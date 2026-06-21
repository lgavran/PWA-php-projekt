<?php
session_start();
require_once 'connect.php';

$id = isset($_GET['id']) ? (int) $_GET['id'] : 0;

if ($id <= 0) {
    die("Neispravan ID članka.");
}

$query = "SELECT id, datum, naslov, sazetak, tekst, slika, kategorija, arhiva
          FROM vijesti
          WHERE id = ?";

$stmt = mysqli_prepare($conn, $query);
mysqli_stmt_bind_param($stmt, "i", $id);
mysqli_stmt_execute($stmt);

$result = mysqli_stmt_get_result($stmt);
$row = mysqli_fetch_assoc($result);

if (!$row) {
    die("Članak nije pronađen.");
}
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($row['naslov']); ?></title>
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
            </ul>
        </nav>
    </div>
</header>

<div class="category-banner">
    <?php echo htmlspecialchars($row['kategorija']); ?>
</div>

<main class="container article-page">

    <article>
        <h1><?php echo htmlspecialchars($row['naslov']); ?></h1>

        <p class="meta">AUTOR: Luka Gavran</p>
        <p class="meta">
            OBJAVLJENO:
            <?php echo date('d.m.Y. H:i', strtotime($row['datum'])); ?>
        </p>

        <img
            src="<?php echo htmlspecialchars($row['slika']); ?>"
            alt="Slika članka"
            class="article-image">

        <p class="lead">
            <?php echo htmlspecialchars($row['sazetak']); ?>
        </p>

        <p>
            <?php echo nl2br(htmlspecialchars($row['tekst'])); ?>
        </p>
    </article>

</main>

<footer>
    <div class="container">
        Copyright © 2026 | Luka Gavran | luka.gavran@gmail.com
    </div>
</footer>

</body>
</html>