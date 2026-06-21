<?php
session_start();
require_once 'connect.php';

$loginMessage = '';

if (isset($_POST['prijava'])) {
    $username = trim($_POST['username']);
    $lozinka = $_POST['lozinka'];

    $sql = "SELECT id, ime, prezime, korisnicko_ime, lozinka, razina
            FROM korisnik
            WHERE korisnicko_ime = ?";

    $stmt = mysqli_prepare($conn, $sql);
    mysqli_stmt_bind_param($stmt, "s", $username);
    mysqli_stmt_execute($stmt);

    $resultLogin = mysqli_stmt_get_result($stmt);
    $user = mysqli_fetch_assoc($resultLogin);

    if ($user && password_verify($lozinka, $user['lozinka'])) {
        $_SESSION['user_id'] = $user['id'];
        $_SESSION['ime'] = $user['ime'];
        $_SESSION['prezime'] = $user['prezime'];
        $_SESSION['korisnicko_ime'] = $user['korisnicko_ime'];
        $_SESSION['razina'] = $user['razina'];
    } else {
        session_unset();
        $loginMessage = 'Neispravno korisničko ime i/ili lozinka. Morate se prvo registrirati.';
    }
}

$loggedIn = isset($_SESSION['user_id']);
$admin = $loggedIn && (int)$_SESSION['razina'] === 1;

if ($admin && isset($_GET['delete'])) {
    $id = (int) $_GET['delete'];

    $query = "DELETE FROM vijesti WHERE id = ?";
    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "i", $id);
    mysqli_stmt_execute($stmt);

    header("Location: administrator.php");
    exit;
}

if ($admin && isset($_POST['update'])) {
    $id = (int) $_POST['id'];
    $title = $_POST['title'];
    $about = $_POST['about'];
    $content = $_POST['content'];
    $category = $_POST['category'];
    $archive = isset($_POST['archive']) ? 1 : 0;

    $query = "UPDATE vijesti
              SET naslov = ?, sazetak = ?, tekst = ?, kategorija = ?, arhiva = ?
              WHERE id = ?";

    $stmt = mysqli_prepare($conn, $query);
    mysqli_stmt_bind_param($stmt, "ssssii", $title, $about, $content, $category, $archive, $id);
    mysqli_stmt_execute($stmt);

    header("Location: administrator.php");
    exit;
}

if ($admin) {
    $result = mysqli_query($conn, "SELECT * FROM vijesti ORDER BY datum DESC");
}
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <title>Administracija</title>
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

                <?php if ($loggedIn) { ?>
                    <li><a href="odjava.php">Odjava</a></li>
                <?php } ?>
            </ul>
        </nav>
    </div>
</header>

<main class="container form-page">

    <h1>Administracija</h1>

    <?php if (!$loggedIn) { ?>

        <?php if ($loginMessage !== '') { ?>
            <p class="message">
                <?php echo htmlspecialchars($loginMessage); ?>
                <a href="registracija.php">Registracija</a>
            </p>
        <?php } ?>

        <form method="POST" action="administrator.php">

            <div class="form-item">
                <label for="username">Korisničko ime</label>
                <input type="text" id="username" name="username" required>
            </div>

            <div class="form-item">
                <label for="lozinka">Lozinka</label>
                <input type="password" id="lozinka" name="lozinka" required>
            </div>

            <div class="form-buttons">
                <button type="submit" name="prijava">Prijava</button>
            </div>

        </form>

        <p>
            Nemate korisnički račun?
            <a href="registracija.php">Registrirajte se ovdje.</a>
        </p>

    <?php } elseif ($loggedIn && !$admin) { ?>

        <p class="message">
            Bok <?php echo htmlspecialchars($_SESSION['ime']); ?>!
            Uspješno ste prijavljeni, ali nemate administratorska prava za pristup ovoj stranici.
        </p>

        <p>
            <a href="odjava.php">Odjava</a>
        </p>

    <?php } else { ?>

        <p class="message">
            Prijavljeni ste kao administrator:
            <?php echo htmlspecialchars($_SESSION['korisnicko_ime']); ?>
            |
            <a href="odjava.php">Odjava</a>
        </p>

        <?php while ($row = mysqli_fetch_assoc($result)) { ?>

            <form method="POST" action="administrator.php" class="admin-form">

                <input type="hidden" name="id" value="<?php echo $row['id']; ?>">

                <div class="form-item">
                    <label>Naslov</label>
                    <input type="text" name="title" value="<?php echo htmlspecialchars($row['naslov']); ?>">
                </div>

                <div class="form-item">
                    <label>Sažetak</label>
                    <textarea name="about" rows="3"><?php echo htmlspecialchars($row['sazetak']); ?></textarea>
                </div>

                <div class="form-item">
                    <label>Tekst</label>
                    <textarea name="content" rows="5"><?php echo htmlspecialchars($row['tekst']); ?></textarea>
                </div>

                <div class="form-item">
                    <label>Kategorija</label>
                    <select name="category">
                        <option value="News" <?php if ($row['kategorija'] === 'News') echo 'selected'; ?>>
                            News
                        </option>

                        <option value="Tournaments" <?php if ($row['kategorija'] === 'Tournaments') echo 'selected'; ?>>
                            Tournaments
                        </option>
                    </select>
                </div>

                <div class="form-item checkbox-item">
                    <label>
                        <input type="checkbox" name="archive" <?php if ($row['arhiva']) echo 'checked'; ?>>
                        Arhiva
                    </label>
                </div>

                <div class="form-buttons">
                    <button type="submit" name="update">Spremi promjene</button>
                    <a class="delete-link" href="administrator.php?delete=<?php echo $row['id']; ?>">Obriši</a>
                </div>

            </form>

        <?php } ?>

    <?php } ?>

</main>

<footer>
    <div class="container">
        Copyright © 2026 | Luka Gavran | luka.gavran@gmail.com
    </div>
</footer>

</body>
</html>