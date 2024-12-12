<!DOCTYPE html>
<html lang="pl-PL">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <link rel="stylesheet" href="Kino.css">
</head>
<body>
    <header>
        <img src="logo.png" id="logo1">
        <nav>
            <a href="Kino.html" class="links">Strona główna</a>
            <a href="Formularz.html" class="links">Formularz</a>
            <a href="Seanse.php" class="links">Zabookowane seanse</a>
        </nav>
    </header>
    <section class="section3">
        <?php include 'Skrypt.php'; ?>
    </section>
    <footer>
        <p id="animacja"><b>&copy Kino SUN</b></p>
    </footer>
<script src="Kino.js"></script>
</body>
</html>