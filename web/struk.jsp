<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Film" %>
<%
    String filmIndexStr = request.getParameter("filmIndex");
    String jamTayang = request.getParameter("jamTayang");
    String namaPemesan = request.getParameter("namaPemesan");
    String jumlahTiketStr = request.getParameter("jumlahTiket");

    int filmIndex = -1;
    int jumlahTiket = 0;

    try {
        filmIndex = Integer.parseInt(filmIndexStr);
        jumlahTiket = Integer.parseInt(jumlahTiketStr);
    } catch (Exception e) {
        out.println("<script>alert('Data pemesanan tidak valid!'); location='index.jsp';</script>");
        return;
    }

    ArrayList<Film> filmList = (ArrayList<Film>) session.getAttribute("filmList");
    if (filmList == null || filmIndex < 0 || filmIndex >= filmList.size() || jamTayang == null || namaPemesan == null || namaPemesan.trim().isEmpty() || jumlahTiket < 1) {
        out.println("<script>alert('Data pemesanan tidak lengkap atau tidak valid!'); location='index.jsp';</script>");
        return;
    }

    Film film = filmList.get(filmIndex);
    int totalHarga = film.getHargaTiket() * jumlahTiket;
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Struk Pemesanan - <%= film.getJudul() %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: #f0f0f0;
            font-family: 'Courier New', Courier, monospace;
            display: flex;
            justify-content: center;
            padding: 40px 15px;
        }
        .struk-container {
            background: #fff;
            width: 320px; /* Lebar struk thermal */
            padding: 20px 30px;
            border-radius: 8px;
            box-shadow: 0 0 8px rgba(0,0,0,0.15);
            color: #222;
            border: 1px solid #ddd;
        }
        .struk-title {
            font-weight: 900;
            font-size: 1.6rem;
            text-align: center;
            margin-bottom: 20px;
            border-bottom: 1px dashed #ccc;
            padding-bottom: 10px;
        }
        .film-img {
            width: 100%;
            max-height: 180px;
            object-fit: cover;
            margin-bottom: 20px;
            border-radius: 4px;
            border: 1px solid #ccc;
        }
        .info-label {
            font-weight: bold;
            font-size: 0.85rem;
            margin-top: 8px;
        }
        .info-value {
            font-size: 1.1rem;
            margin-bottom: 6px;
            letter-spacing: 0.05em;
        }
        .total-harga {
            font-weight: 900;
            font-size: 1.3rem;
            margin-top: 20px;
            border-top: 1px dashed #ccc;
            padding-top: 12px;
            text-align: center;
        }
        .btn-kembali {
            margin-top: 25px;
            width: 100%;
            padding: 10px 0;
            background-color: #222;
            color: #fff;
            font-weight: bold;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            letter-spacing: 0.1em;
            transition: background-color 0.3s ease;
        }
        .btn-kembali:hover {
            background-color: #555;
        }

        @media print {
            body {
                background: white;
                padding: 0;
                display: block;
            }
            .struk-container {
                box-shadow: none;
                border: none;
                width: 100%;
                max-width: 320px;
                margin: 0 auto;
            }
            .btn-kembali {
                display: none;
            }
        }
    </style>
</head>
<body>

<div class="struk-container">
    <h1 class="struk-title">Struk Pemesanan</h1>
    <img src="<%= film.getGambar() %>" alt="Poster <%= film.getJudul() %>" class="film-img" />
    <div>
        <div class="info-label">Nama Pemesan</div>
        <div class="info-value"><%= namaPemesan %></div>
        
        <div class="info-label">Judul Film</div>
        <div class="info-value"><%= film.getJudul() %></div>

        <div class="info-label">Jam Tayang</div>
        <div class="info-value"><%= jamTayang %></div>

        <div class="info-label">Jumlah Tiket</div>
        <div class="info-value"><%= jumlahTiket %> tiket</div>

        <div class="info-label">Harga per Tiket</div>
        <div class="info-value">Rp <%= String.format("%,d", film.getHargaTiket()) %></div>

        <div class="total-harga">Total Harga: Rp <%= String.format("%,d", totalHarga) %></div>
    </div>

    <button class="btn-kembali" onclick="window.location.href='index.jsp'">Kembali ke Beranda</button>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
