<%@ page contentType="text/html" pageEncoding="UTF-8" %>
<%@ page import="java.util.*, model.Film" %>
<!DOCTYPE html>
<html lang="id">
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1" />
    <title>Anime Bioskop</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <style>
        /* Background Gradient */
        body {
            background: linear-gradient(135deg, #1f1c2c, #928dab);
            color: #f0f0f5;
            font-family: 'Poppins', 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            min-height: 100vh;
            margin: 0;
            padding-bottom: 60px;
        }

        h1 {
            font-weight: 900;
            text-align: center;
            margin-top: 40px;
            margin-bottom: 50px;
            color: #ffe600;
            text-shadow: 0 0 10px #ffd600aa, 0 0 20px #ffde0055;
            letter-spacing: 2px;
        }

        /* Card Grid */
        .container {
            max-width: 1200px;
        }

        .anime-card {
            background: linear-gradient(145deg, #2c2a3f, #1b1a2d);
            border-radius: 20px;
            box-shadow: 0 6px 20px rgba(255, 255, 255, 0.1);
            overflow: hidden;
            display: flex;
            flex-direction: column;
            transition: transform 0.4s ease, box-shadow 0.4s ease;
            cursor: pointer;
            height: 100%;
        }

        .anime-card:hover {
            transform: translateY(-10px) scale(1.05);
            box-shadow:
                0 8px 30px rgba(255, 230, 100, 0.8),
                0 0 20px rgba(255, 210, 70, 0.6);
            border: 2px solid #ffd600;
        }

        .anime-image {
            height: 300px;
            width: 100%;
            object-fit: cover;
            border-bottom: 3px solid #ffd600;
            transition: filter 0.3s ease;
        }

        .anime-card:hover .anime-image {
            filter: brightness(1.1);
        }

        .card-body {
            flex-grow: 1;
            padding: 20px 25px;
            display: flex;
            flex-direction: column;
            justify-content: space-between;
        }

        .card-title {
            font-weight: 700;
            font-size: 1.4rem;
            margin-bottom: 12px;
            color: #fff842;
            text-shadow: 0 0 5px #ffd600cc;
        }

        .card-text {
            font-size: 0.9rem;
            margin-bottom: 8px;
            color: #dddde0cc;
        }

        .btn-pesan {
            background-image: linear-gradient(45deg, #ffcc00, #ff9900);
            color: #222;
            font-weight: 700;
            border: none;
            border-radius: 10px;
            padding: 12px 0;
            transition: background-image 0.3s ease;
            box-shadow: 0 0 8px #ffcc00aa;
            text-shadow: none;
        }

        .btn-pesan:hover {
            background-image: linear-gradient(45deg, #ffb700, #ff8200);
            color: #111;
            box-shadow: 0 0 12px #ffb700cc;
        }

        /* Responsive tweaks */
        @media (max-width: 768px) {
            .anime-image {
                height: 220px;
            }
        }
        @media (max-width: 480px) {
            .anime-image {
                height: 180px;
            }
            .card-title {
                font-size: 1.2rem;
            }
        }
    </style>
    <!-- Optional: Google Fonts -->
    <link href="https://fonts.googleapis.com/css2?family=Poppins:wght@400;700;900&display=swap" rel="stylesheet" />
</head>
<body>

<%
    ArrayList<Film> filmList = (ArrayList<Film>) session.getAttribute("filmList");

    if (filmList == null) {
        filmList = new ArrayList<>();

        filmList.add(new Film(
            "Hunter x Hunter",
            "Anime, Fantasy",
            115,
            40000,
            new String[]{"10:00", "13:00", "16:00"},
            "https://i.pinimg.com/736x/b9/ef/0a/b9ef0ae3b860fd287e907491fddd560c.jpg"
        ));

        filmList.add(new Film(
            "One Piece Film: Red",
            "Anime, Adventure",
            120,
            45000,
            new String[]{"11:30", "14:30", "17:30"},
            "https://i.pinimg.com/736x/11/9a/ad/119aad3c7d98b9bf795ee7b2eb753791.jpg"
        ));

        filmList.add(new Film(
            "Naruto",
            "Anime, Ninja Shinobi",
            130,
            42000,
            new String[]{"12:00", "15:00", "18:00"},
            "https://i.pinimg.com/736x/05/20/95/05209578d20ec18d4aba21d2508c2a9e.jpg"
        ));

        filmList.add(new Film(
            "Attack on Titan Final Season",
            "Anime, Action, Drama",
            140,
            48000,
            new String[]{"13:00", "16:00", "19:00"},
            "https://i.pinimg.com/736x/0d/6b/34/0d6b349f99d5b56d41ad961c1496894d.jpg"
        ));

        filmList.add(new Film(
            "Jujutsu Kaisen ",
            "Anime, Supernatural",
            105,
            43000,
            new String[]{"10:30", "13:30", "16:30"},
            "https://i.pinimg.com/736x/0c/a2/4b/0ca24b558add686645b30b812a6410e3.jpg"
        ));

        filmList.add(new Film(
            "Black Clover",
            "Anime, Action, Magic",
            117,
            46000,
            new String[]{"11:00", "14:00", "17:00"},
            "https://i.pinimg.com/736x/9e/ba/ea/9ebaea63fa887f99e9c60741220a532a.jpg"
        ));

        session.setAttribute("filmList", filmList);
    }
%>

<div class="container">
    <h1>Anime Bioskop</h1>
    <div class="row row-cols-1 row-cols-md-3 g-4">
        <% for (int i = 0; i < filmList.size(); i++) {
            Film film = filmList.get(i);
        %>
            <div class="col">
                <div class="card anime-card h-100" onclick="location.href='formPesan.jsp?filmIndex=<%= i %>'" role="button" tabindex="0">
                    <img src="<%= film.getGambar() %>" class="card-img-top anime-image" alt="<%= film.getJudul() %> Poster" />
                    <div class="card-body d-flex flex-column">
                        <h5 class="card-title"><%= film.getJudul() %></h5>
                        <p class="card-text"><strong>Genre:</strong> <%= film.getGenre() %></p>
                        <p class="card-text"><strong>Durasi:</strong> <%= film.getDurasi() %> menit</p>
                        <p class="card-text"><strong>Harga Tiket:</strong> Rp <%= String.format("%,d", film.getHargaTiket()) %></p>
                        <a href="formPesan.jsp?filmIndex=<%= i %>" class="btn btn-pesan mt-auto align-self-center px-5">Pesan Tiket</a>
                    </div>
                </div>
            </div>
        <% } %>
    </div>
</div>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
