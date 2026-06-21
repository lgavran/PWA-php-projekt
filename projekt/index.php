<?php
session_start();
require_once 'connect.php';

$queryNews = "SELECT * FROM vijesti 
              WHERE arhiva = 0 AND kategorija = 'News' 
              ORDER BY datum DESC 
              LIMIT 3";
$resultNews = mysqli_query($conn, $queryNews);

$queryTournaments = "SELECT * FROM vijesti 
                     WHERE arhiva = 0 AND kategorija = 'Tournaments' 
                     ORDER BY datum DESC 
                     LIMIT 3";
$resultTournaments = mysqli_query($conn, $queryTournaments);
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Warhammer News</title>
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

<main class="container">

    <div class="top-row">
        <h1>Welcome to Warhammer</h1>
        <span><?php echo date('l, d F'); ?></span>
    </div>

    <section id="news">
        <h2 class="news-title">News</h2>

        <div class="articles">
            <?php while ($row = mysqli_fetch_assoc($resultNews)) { ?>
                <article>
                    <a href="clanak.php?id=<?php echo $row['id']; ?>">
                        <img src="<?php echo htmlspecialchars($row['slika']); ?>" alt="Slika članka">
                    </a>

                    <h3>
                        <a href="clanak.php?id=<?php echo $row['id']; ?>">
                            <?php echo htmlspecialchars($row['naslov']); ?>
                        </a>
                    </h3>

                    <p><?php echo htmlspecialchars($row['sazetak']); ?></p>
                </article>
            <?php } ?>
        </div>
    </section>

    <section id="tournaments">
        <h2 class="tournament-title">Tournaments</h2>

        <div class="articles">
            <?php while ($row = mysqli_fetch_assoc($resultTournaments)) { ?>
                <article>
                    <a href="clanak.php?id=<?php echo $row['id']; ?>">
                        <img src="<?php echo htmlspecialchars($row['slika']); ?>" alt="Slika članka">
                    </a>

                    <h3>
                        <a href="clanak.php?id=<?php echo $row['id']; ?>">
                            <?php echo htmlspecialchars($row['naslov']); ?>
                        </a>
                    </h3>

                    <p><?php echo htmlspecialchars($row['sazetak']); ?></p>
                </article>
            <?php } ?>
        </div>
    </section>

</main>

<footer>
    <div class="container">
        Copyright © 2026 | Luka Gavran | luka.gavran@gmail.com
    </div>
</footer>

</body>
</html>