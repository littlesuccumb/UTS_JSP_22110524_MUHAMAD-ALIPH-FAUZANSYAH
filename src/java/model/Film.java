package model;

public class Film {
    private String judul;
    private String genre;
    private int durasi;
    private int hargaTiket;
    private String[] jadwalTayang;
    private String gambar; // ✅ Tambahkan atribut gambar

    // ✅ Constructor lengkap
    public Film(String judul, String genre, int durasi, int hargaTiket, String[] jadwalTayang, String gambar) {
        this.judul = judul;
        this.genre = genre;
        this.durasi = durasi;
        this.hargaTiket = hargaTiket;
        this.jadwalTayang = jadwalTayang;
        this.gambar = gambar;
    }

    // ✅ Getter & Setter
    public String getJudul() {
        return judul;
    }

    public String getGenre() {
        return genre;
    }

    public int getDurasi() {
        return durasi;
    }

    public int getHargaTiket() {
        return hargaTiket;
    }

    public String[] getJadwalTayang() {
        return jadwalTayang;
    }

    public String getGambar() {
        return gambar;
    }

    public void setJudul(String judul) {
        this.judul = judul;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public void setDurasi(int durasi) {
        this.durasi = durasi;
    }

    public void setHargaTiket(int hargaTiket) {
        this.hargaTiket = hargaTiket;
    }

    public void setJadwalTayang(String[] jadwalTayang) {
        this.jadwalTayang = jadwalTayang;
    }

    public void setGambar(String gambar) {
        this.gambar = gambar;
    }
}
