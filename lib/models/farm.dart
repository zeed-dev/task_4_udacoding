part of 'models.dart';

class Farm extends Equatable {
  Farm({
    this.id,
    this.name,
    this.cows,
    this.rate,
    this.mapUrl,
    this.foto,
    this.city,
    this.location,
  });

  final String id;
  final String name;
  final String cows;
  final int rate;
  final String mapUrl;
  final String foto;
  final String city;
  final String location;

  factory Farm.fromJson(Map<String, dynamic> json) => Farm(
        id: json["id"],
        name: json["name"],
        cows: json["cows"],
        rate: int.tryParse(json["rate"]),
        mapUrl: json["map_url"],
        foto: json["foto"],
        city: json["city"],
        location: json["location"],
      );

  @override
  List<Object> get props => throw UnimplementedError();
}

List<Farm> mockFarm = [
  Farm(
    id: 1.toString(),
    name: "Swiss Farm",
    foto: "assets/farm1.jpg",
    cows: 52.toString(),
    rate: 3,
    location: "Jln. Kappan Sukses No. 20",
    city: "Swiss",
    mapUrl: "https://goo.gl/maps/5s61rreEq3PVn44u9",
  ),
  Farm(
    id: 2.toString(),
    name: "Belanda Farm",
    foto: "assets/farm2.jpg",
    cows: 52.toString(),
    rate: 4,
    location: "Jln. Kappan Sukses No. 21",
    city: "Belanda",
    mapUrl: "https://goo.gl/maps/5s61rreEq3PVn44u9",
  ),
  Farm(
    id: 3.toString(),
    name: "England Farm",
    foto: "assets/farm3.jpg",
    cows: 52.toString(),
    rate: 5,
    location: "Jln. Kappan Sukses No. 23",
    city: "England",
    mapUrl: "https://goo.gl/maps/gc6NwbW6fVS4Thvu7",
  ),
];
