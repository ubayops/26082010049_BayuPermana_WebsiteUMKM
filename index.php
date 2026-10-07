<?php
require_once 'services/config.php';

$query = "
    SELECT
        umkm.nama_umkm,
        kategori.nama_kategori,
        produk.nama_produk,
        produk.harga,
        produk.stok
    FROM produk
    JOIN umkm ON produk.id_umkm = umkm.id_umkm
    JOIN kategori ON umkm.id_kategori = kategori.id_kategori
    ORDER BY umkm.nama_umkm
";

$result = $conn->query($query);
?>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Data UMKM</title>
    <link rel="stylesheet" href="style.css">
</head>

<body>

    <nav>
        <div class="logo">UMKM Indonesia</div>
    </nav>

    <header>
        <h1>Data UMKM</h1>
        <p>Daftar UMKM dan produk yang tersedia</p>
    </header>

    <main>
        <section class="card">
            <h2>Daftar Produk UMKM</h2>

            <div class="table-container">
                <table>
                    <thead>
                        <tr>
                            <th>No</th>
                            <th>UMKM</th>
                            <th>Kategori</th>
                            <th>Produk</th>
                            <th>Harga</th>
                            <th>Stok</th>
                        </tr>
                    </thead>

                    <tbody>

                    <?php
                    $no = 1;

                    while ($row = $result->fetch_assoc()) {
                    ?>

                        <tr>
                            <td><?= $no++; ?></td>

                            <td>
                                <?= htmlspecialchars($row['nama_umkm']); ?>
                            </td>

                            <td>
                                <?= htmlspecialchars($row['nama_kategori']); ?>
                            </td>

                            <td>
                                <?= htmlspecialchars($row['nama_produk']); ?>
                            </td>

                            <td>
                                Rp <?= number_format($row['harga'], 0, ',', '.'); ?>
                            </td>

                            <td>
                                <?= $row['stok']; ?>
                            </td>
                        </tr>

                    <?php
                    }
                    ?>

                    </tbody>
                </table>
            </div>
        </section>
    </main>

</body>
</html>