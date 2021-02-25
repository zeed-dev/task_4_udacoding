part of 'models.dart';

class Dictionary extends Equatable {
  Dictionary({
    this.id,
    this.title,
    this.subtitle,
    this.description,
  });

  final String id;
  final String title;
  final String subtitle;
  final String description;

  factory Dictionary.fromJson(Map<String, dynamic> json) => Dictionary(
        id: json["id"],
        title: json["title"],
        subtitle: json["subtitle"],
        description: json["description"],
      );

  @override
  List<Object> get props => [];
}

List<Dictionary> mockDictionary = [
  Dictionary(
    id: 1.toString(),
    title: "ADG 1",
    subtitle: "Average Daily Gain",
    description:
        "Average Daily Gain (ADG) merupakan nilai rata-rata pertambahan bobot badan harian hewan ternak. ADG ini diperoleh dengan mengurangi berat akhir dengan berat awal kemudian membaginya dengan lama pemeliharaan (hari).",
  ),
  Dictionary(
    id: 2.toString(),
    title: "BETN 2",
    subtitle: "Bahan Ekstrak Tanpa Nitrogen",
    description:
        "Bahan Ekstrak Tanpa Nitrogen (BETN) merupakan karbohidrat yang mudah larut dalam larutan asam dan basa serta memiliki daya cerna yang tinggi. BETN ini menjadi sumber energi yang sangat baik bagi hewan ternak.",
  ),
];
