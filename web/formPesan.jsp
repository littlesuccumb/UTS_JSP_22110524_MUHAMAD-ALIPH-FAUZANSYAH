<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page import="java.util.*, model.Film" %>
<%
    String filmIndexStr = request.getParameter("filmIndex");
    int filmIndex = -1;
    try {
        filmIndex = Integer.parseInt(filmIndexStr);
    } catch (Exception e) {
        out.println("<script>alert('Film tidak valid!'); location='index.jsp';</script>");
        return;
    }

    ArrayList<Film> filmList = (ArrayList<Film>) session.getAttribute("filmList");
    if (filmList == null || filmIndex < 0 || filmIndex >= filmList.size()) {
        out.println("<script>alert('Film tidak ditemukan!'); location='index.jsp';</script>");
        return;
    }

    Film film = filmList.get(filmIndex);
%>

<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Pesan Tiket - <%= film.getJudul() %></title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        body {
            background: linear-gradient(135deg, #1f1c2c, #928dab);
            color: #f0f0f5;
            font-family: 'Poppins', sans-serif;
            min-height: 100vh;
            padding: 40px 15px 60px;
            display: flex;
            justify-content: center;
            align-items: center;
        }
        .form-container {
            background: #2c2a3f;
            border-radius: 20px;
            max-width: 700px;
            width: 100%;
            padding: 30px 35px;
            box-shadow: 0 6px 20px rgba(255, 255, 255, 0.1);
            display: flex;
            gap: 40px;
            align-items: center;
        }
        .film-img {
            max-width: 300px;
            width: 100%;
            border-radius: 15px;
            box-shadow: 0 0 15px #ffd60088;
            object-fit: cover;
            flex-shrink: 0;
        }
        form {
            flex: 1;
        }
        h2 {
            text-align: center;
            color: #ffd600;
            margin-bottom: 30px;
            font-weight: 800;
            text-shadow: 0 0 8px #ffd600cc;
        }
        label {
            font-weight: 600;
            color: #ffec75;
        }
        .form-control, .form-select {
            background: #1b1a2d;
            border: 1.5px solid #444357;
            color: #f0f0f5;
            font-weight: 500;
            border-radius: 10px;
            transition: border-color 0.3s ease;
        }
        .form-control:focus, .form-select:focus {
            border-color: #ffd600;
            box-shadow: 0 0 6px #ffd600bb;
            outline: none;
            background: #2c2a3f;
        }
        .btn-pesan {
            background-image: linear-gradient(45deg, #ffcc00, #ff9900);
            color: #222;
            font-weight: 700;
            border: none;
            border-radius: 12px;
            padding: 12px 0;
            width: 100%;
            margin-top: 20px;
            box-shadow: 0 0 10px #ffcc0099;
            transition: background-image 0.3s ease;
        }
        .btn-pesan:hover {
            background-image: linear-gradient(45deg, #ffb700, #ff8200);
            color: #111;
            box-shadow: 0 0 15px #ffb700cc;
        }
        .btn-kembali {
            background: transparent;
            border: 2px solid #ffd600;
            color: #ffd600;
            font-weight: 700;
            border-radius: 12px;
            padding: 10px 0;
            width: 100%;
            margin-top: 15px;
            transition: background-color 0.3s ease, color 0.3s ease;
            cursor: pointer;
        }
        .btn-kembali:hover {
            background-color: #ffd600;
            color: #222;
        }

        /* Responsif untuk layar kecil */
        @media (max-width: 768px) {
            .form-container {
                flex-direction: column;
                padding: 20px;
            }
            .film-img {
                max-width: 100%;
                margin-bottom: 25px;
            }
        }
    </style>
</head>
<body>

<div class="form-container">
    <img src="<%= film.getGambar() %>" alt="Poster <%= film.getJudul() %>" class="film-img" />
    <form action="struk.jsp" method="get">
        <h2>Pesan Tiket: <%= film.getJudul() %></h2>
        <input type="hidden" name="filmIndex" value="<%= filmIndex %>" />
        <div class="mb-3">
            <label for="jamTayang">Jam Tayang</label>
            <select id="jamTayang" name="jamTayang" class="form-select" required>
                <% for (String jam : film.getJadwalTayang()) { %>
                    <option value="<%= jam %>"><%= jam %></option>
                <% } %>
            </select>
        </div>
        <div class="mb-3">
            <label for="namaPemesan">Nama Pemesan</label>
            <input id="namaPemesan" type="text" name="namaPemesan" class="form-control" placeholder="Masukkan nama Anda" required />
        </div>
        <div class="mb-3">
            <label for="jumlahTiket">Jumlah Tiket</label>
            <input id="jumlahTiket" type="number" name="jumlahTiket" min="1" class="form-control" placeholder="Jumlah tiket yang dipesan" required />
        </div>
        <button type="submit" class="btn-pesan">Lanjut ke Struk</button>
        <button type="button" onclick="window.location.href='index.jsp'" class="btn-kembali">Kembali ke Daftar Film</button>
    </form>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
