part of 'models.dart';

class Farm {
  int id;
  String name;
  String photo;
  int cows;
  int rate;
  String location;
  String city;
  String mapUrl;

  Farm({
    this.id,
    this.name,
    this.photo,
    this.cows,
    this.rate,
    this.location,
    this.city,
    this.mapUrl,
  });
}

List<Farm> mockFarm = [
  Farm(
    id: 1,
    name: "Swiss Farm",
    photo: "assets/farm1.jpg",
    cows: 52,
    rate: 3,
    location: "Jln. Kappan Sukses No. 20",
    city: "Swiss",
    mapUrl: "https://goo.gl/maps/5s61rreEq3PVn44u9",
  ),
  Farm(
    id: 2,
    name: "Belanda Farm",
    photo: "assets/farm2.jpg",
    cows: 52,
    rate: 4,
    location: "Jln. Kappan Sukses No. 21",
    city: "Belanda",
    mapUrl: "https://goo.gl/maps/5s61rreEq3PVn44u9",
  ),
  Farm(
    id: 3,
    name: "England Farm",
    photo: "assets/farm3.jpg",
    cows: 52,
    rate: 5,
    location: "Jln. Kappan Sukses No. 23",
    city: "England",
    mapUrl: "https://goo.gl/maps/gc6NwbW6fVS4Thvu7",
  ),
];
