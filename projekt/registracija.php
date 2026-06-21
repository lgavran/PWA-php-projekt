<?php
require_once 'connect.php';

$msg = '';
$registriranKorisnik = false;

if ($_SERVER['REQUEST_METHOD'] === 'POST') {
    $ime = trim($_POST['ime']);
    $prezime = trim($_POST['prezime']);
    $username = trim($_POST['username']);
    $pass = $_POST['pass'];
    $passRep = $_POST['passRep'];

    if ($ime === '' || $prezime === '' || $username === '' || $pass === '' || $passRep === '') {
        $msg = 'Sva polja moraju biti popunjena.';
    } elseif ($pass !== $passRep) {
        $msg = 'Lozinke nisu iste.';
    } else {
        $sql = "SELECT id FROM korisnik WHERE korisnicko_ime = ?";
        $stmt = mysqli_prepare($conn, $sql);
        mysqli_stmt_bind_param($stmt, "s", $username);
        mysqli_stmt_execute($stmt);
        mysqli_stmt_store_result($stmt);

        if (mysqli_stmt_num_rows($stmt) > 0) {
            $msg = 'Korisničko ime već postoji.';
        } else {
            $hashed_password = password_hash($pass, PASSWORD_BCRYPT);
            $razina = 0;

            $sql = "INSERT INTO korisnik (ime, prezime, korisnicko_ime, lozinka, razina)
                    VALUES (?, ?, ?, ?, ?)";
            $stmt = mysqli_prepare($conn, $sql);
            mysqli_stmt_bind_param($stmt, "ssssi", $ime, $prezime, $username, $hashed_password, $razina);

            if (mysqli_stmt_execute($stmt)) {
                $registriranKorisnik = true;
                $msg = 'Korisnik je uspješno registriran.';
            } else {
                $msg = 'Greška prilikom registracije.';
            }
        }
    }
}
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <title>Registracija</title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<header>
    <div class="container">
        <div class="logo">Warhammer News</div>

        <nav>
    <ul>
        <li><a href="index.php">Home</a></li>
        <li><a href="kategorija.php?kategorija=News">News</a></li>
        <li><a href="kategorija.php?kategorija=Tournaments">Tournaments</a></li>
        <li><a href="unos.html">Unos</a></li>
        <li><a href="administrator.php">Administracija</a></li>
        <li><a href="registracija.php">Registracija</a></li>
        <?php if (isset($_SESSION['user_id'])) { ?>
                    <li><a href="odjava.php">Odjava</a></li>
                <?php } ?>
    </ul>
</nav>
    </div>
</header>

<main class="container form-page">

    <h1>Registracija korisnika</h1>

    <?php if ($msg !== '') { ?>
        <p class="message"><?php echo htmlspecialchars($msg); ?></p>
    <?php } ?>

    <?php if ($registriranKorisnik) { ?>

        <p>
            Sada se možete prijaviti na
            <a href="administrator.php">administracijsku stranicu</a>.
        </p>

    <?php } else { ?>

        <form method="POST" action="registracija.php">

            <div class="form-item">
                <label for="ime">Ime</label>
                <input type="text" id="ime" name="ime" required>
            </div>

            <div class="form-item">
                <label for="prezime">Prezime</label>
                <input type="text" id="prezime" name="prezime" required>
            </div>

            <div class="form-item">
                <label for="username">Korisničko ime</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-item">
                <label for="pass">Lozinka</label>
                <input type="password" id="pass" name="pass" required>
            </div>

            <div class="form-item">
                <label for="passRep">Ponovite lozinku</label>
                <input type="password" id="passRep" name="passRep" required>
            </div>

            <div class="form-buttons">
                <button type="submit">Registriraj korisnika</button>
            </div>

        </form>

    <?php } ?>

</main>

<footer>
    <div class="container">
        Copyright © 2026 | Luka Gavran | luka.gavran@gmail.com
    </div>
</footer>

</body>
</html>