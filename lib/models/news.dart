part of 'models.dart';

class News {
  int id;
  String photo;
  String title;
  String date;
  String descrption;

  News({
    this.id,
    this.photo,
    this.date,
    this.descrption,
    this.title,
  });
}

List<News> mockNews = [
  News(
    id: 1,
    photo: "assets/news1.jpg",
    title: "Kandang Ayam Terbakar",
    date: " Rabu, 24 Maret 2021",
    descrption:
        "Sekjen Majelis Ulama Indonesia (MUI), Amirsyah Tambunan mengatakan empat petugas medis laki-laki di RSUD Djasamen Saragih, Pematang Siantar, Sumatera Utara yang memandikan jenazah pasien suspek berjenis kelamin perempuan telah melanggar syariat Islam dan fatwa MUI soal memandikan jenazah pasien virus Corona.",
  ),
  News(
    id: 1,
    photo: "assets/news1.jpg",
    title: "Kandang Sapi Terbakar",
    date: " Kamis, 24 Maret 2021",
    descrption:
        "Sekjen Majelis Ulama Indonesia (MUI), Amirsyah Tambunan mengatakan empat petugas medis laki-laki di RSUD Djasamen Saragih, Pematang Siantar, Sumatera Utara yang memandikan jenazah pasien suspek berjenis kelamin perempuan telah melanggar syariat Islam dan fatwa MUI soal memandikan jenazah pasien virus Corona.",
  ),
  News(
    id: 1,
    photo: "assets/news1.jpg",
    title: "Kandang Bebek Terbakar",
    date: " Jumat, 24 Maret 2021",
    descrption:
        "Sekjen Majelis Ulama Indonesia (MUI), Amirsyah Tambunan mengatakan empat petugas medis laki-laki di RSUD Djasamen Saragih, Pematang Siantar, Sumatera Utara yang memandikan jenazah pasien suspek berjenis kelamin perempuan telah melanggar syariat Islam dan fatwa MUI soal memandikan jenazah pasien virus Corona.",
  ),
];
