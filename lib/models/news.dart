part of 'models.dart';

class News extends Equatable {
  News({
    this.id,
    this.titile,
    this.description,
    this.photo,
    this.date,
  });

  final String id;
  final String titile;
  final String description;
  final String photo;
  final String date;

  factory News.fromJson(Map<String, dynamic> json) => News(
        id: json["id"],
        titile: json["titile"],
        description: json["description"],
        photo: json["photo"],
        date: json["date"],
      );

  @override
  List<Object> get props => [id, photo, titile, date, description];
}

List<News> mockNews = [
  News(
    id: 1.toString(),
    photo: "assets/news1.jpg",
    titile: "Kandang Ayam Terbakar",
    date: " Rabu, 24 Maret 2021",
    description:
        "Sekjen Majelis Ulama Indonesia (MUI), Amirsyah Tambunan mengatakan empat petugas medis laki-laki di RSUD Djasamen Saragih, Pematang Siantar, Sumatera Utara yang memandikan jenazah pasien suspek berjenis kelamin perempuan telah melanggar syariat Islam dan fatwa MUI soal memandikan jenazah pasien virus Corona.",
  ),
  News(
    id: 1.toString(),
    photo: "assets/news1.jpg",
    titile: "Kandang Sapi Terbakar",
    date: " Kamis, 24 Maret 2021",
    description:
        "Sekjen Majelis Ulama Indonesia (MUI), Amirsyah Tambunan mengatakan empat petugas medis laki-laki di RSUD Djasamen Saragih, Pematang Siantar, Sumatera Utara yang memandikan jenazah pasien suspek berjenis kelamin perempuan telah melanggar syariat Islam dan fatwa MUI soal memandikan jenazah pasien virus Corona.",
  ),
  News(
    id: 1.toString(),
    photo: "assets/news1.jpg",
    titile: "Kandang Bebek Terbakar",
    date: " Jumat, 24 Maret 2021",
    description:
        "Sekjen Majelis Ulama Indonesia (MUI), Amirsyah Tambunan mengatakan empat petugas medis laki-laki di RSUD Djasamen Saragih, Pematang Siantar, Sumatera Utara yang memandikan jenazah pasien suspek berjenis kelamin perempuan telah melanggar syariat Islam dan fatwa MUI soal memandikan jenazah pasien virus Corona.",
  ),
];
