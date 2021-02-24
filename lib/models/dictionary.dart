part of 'models.dart';

class Dictionary {
  int id;
  String title;
  String subtitle;
  String description;

  Dictionary({
    this.id,
    this.title,
    this.subtitle,
    this.description,
  });
}

List<Dictionary> mockDictionary = [
  Dictionary(
    id: 1,
    title: "ADG",
    subtitle: "Average Daily Gain",
    description:
        "Average Daily Gain (ADG) merupakan nilai rata-rata pertambahan bobot badan harian hewan ternak. ADG ini diperoleh dengan mengurangi berat akhir dengan berat awal kemudian membaginya dengan lama pemeliharaan (hari).",
  ),
  Dictionary(
    id: 2,
    title: "BETN",
    subtitle: "Bahan Ekstrak Tanpa Nitrogen",
    description:
        "Bahan Ekstrak Tanpa Nitrogen (BETN) merupakan karbohidrat yang mudah larut dalam larutan asam dan basa serta memiliki daya cerna yang tinggi. BETN ini menjadi sumber energi yang sangat baik bagi hewan ternak.",
  ),
  Dictionary(
    id: 2,
    title: "Fattening",
    subtitle: "Feedlot",
    description:
        "Fattening atau biasa disebut juga dengan Feedlot merupakan usaha penggemukan ternak dengan berprinsip untuk mendapatkan keuntungan yang maksimal. Program penggemukan ini dilakukan dengan cara memberi pakan dalam jumlah yang mencukupi kebutuhan hewan ternak selama periode tertentu untuk mempercepat dan meningkatkan produksi daging.",
  ),
];
