<?php
session_start();
require_once 'connect.php';

if ($_SERVER['REQUEST_METHOD'] !== 'POST') {
    header("Location: unos.html");
    exit;
}

$title = isset($_POST['title']) ? trim($_POST['title']) : '';
$about = isset($_POST['about']) ? trim($_POST['about']) : '';
$content = isset($_POST['content']) ? trim($_POST['content']) : '';
$category = isset($_POST['category']) ? trim($_POST['category']) : '';
$archiveText = isset($_POST['archive']) ? 'Da' : 'Ne';
$archiveValue = isset($_POST['archive']) ? 1 : 0;

if ($title === '' || $about === '' || $content === '' || $category === '') {
    die("Nisu uneseni svi potrebni podaci.");
}

$imagePath = 'img/default.jpg';

if (isset($_FILES['photo']) && $_FILES['photo']['error'] === UPLOAD_ERR_OK) {
    $uploadDir = 'img/';

    if (!is_dir($uploadDir)) {
        mkdir($uploadDir, 0777, true);
    }

    $originalFileName = basename($_FILES['photo']['name']);
    $safeFileName = preg_replace('/[^A-Za-z0-9._-]/', '_', $originalFileName);
    $targetPath = $uploadDir . time() . '_' . $safeFileName;

    if (move_uploaded_file($_FILES['photo']['tmp_name'], $targetPath)) {
        $imagePath = $targetPath;
    }
}

$sql = "INSERT INTO vijesti
        (naslov, sazetak, tekst, slika, kategorija, arhiva)
        VALUES (?, ?, ?, ?, ?, ?)";

$stmt = mysqli_prepare($conn, $sql);

mysqli_stmt_bind_param(
    $stmt,
    "sssssi",
    $title,
    $about,
    $content,
    $imagePath,
    $category,
    $archiveValue
);

mysqli_stmt_execute($stmt);

$insertedId = mysqli_insert_id($conn);
?>
<!DOCTYPE html>
<html lang="hr">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title><?php echo htmlspecialchars($title); ?></title>
    <link rel="stylesheet" type="text/css" href="style.css">
</head>
<body>

<header>
    <div class="container">
        <div class="logo">NEWS</div>

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

<div class="category-banner">
    <?php echo htmlspecialchars($category); ?>
</div>

<main class="container article-page">

    <article>
        <h1><?php echo htmlspecialchars($title); ?></h1>

        <p class="meta">AUTOR: Luka Gavran</p>
        <p class="meta">OBJAVLJENO: <?php echo date('d.m.Y. H:i'); ?></p>
        <p class="meta">ARHIVA: <?php echo htmlspecialchars($archiveText); ?></p>

        <img
            src="<?php echo htmlspecialchars($imagePath); ?>"
            alt="Slika članka"
            class="article-image">

        <p class="lead">
            <?php echo htmlspecialchars($about); ?>
        </p>

        <p>
            <?php echo nl2br(htmlspecialchars($content)); ?>
        </p>

        <p>
            <a href="clanak.php?id=<?php echo $insertedId; ?>">Otvori spremljeni članak</a>
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