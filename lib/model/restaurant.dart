import 'dart:convert';

class Welcome {
  List<Restaurant> restaurants;

  Welcome({
    required this.restaurants,
  });

  factory Welcome.fromRawJson(String str) => Welcome.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Welcome.fromJson(Map<String, dynamic> json) => Welcome(
    restaurants: List<Restaurant>.from(json["restaurants"].map((x) => Restaurant.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "restaurants": List<dynamic>.from(restaurants.map((x) => x.toJson())),
  };
}

class Restaurant {
  String id;
  String name;
  String description;
  String pictureId;
  String city;
  double rating;
  Menus menus;

  Restaurant({
    required this.id,
    required this.name,
    required this.description,
    required this.pictureId,
    required this.city,
    required this.rating,
    required this.menus,
  });

  factory Restaurant.fromRawJson(String str) => Restaurant.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Restaurant.fromJson(Map<String, dynamic> json) => Restaurant(
    id: json["id"],
    name: json["name"],
    description: json["description"],
    pictureId: json["pictureId"],
    city: json["city"],
    rating: json["rating"]?.toDouble(),
    menus: Menus.fromJson(json["menus"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "description": description,
    "pictureId": pictureId,
    "city": city,
    "rating": rating,
    "menus": menus.toJson(),
  };
}

class Menus {
  List<Drink> foods;
  List<Drink> drinks;

  Menus({
    required this.foods,
    required this.drinks,
  });

  factory Menus.fromRawJson(String str) => Menus.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Menus.fromJson(Map<String, dynamic> json) => Menus(
    foods: List<Drink>.from(json["foods"].map((x) => Drink.fromJson(x))),
    drinks: List<Drink>.from(json["drinks"].map((x) => Drink.fromJson(x))),
  );

  Map<String, dynamic> toJson() => {
    "foods": List<dynamic>.from(foods.map((x) => x.toJson())),
    "drinks": List<dynamic>.from(drinks.map((x) => x.toJson())),
  };
}

class Drink {
  String name;

  Drink({
    required this.name,
  });

  factory Drink.fromRawJson(String str) => Drink.fromJson(json.decode(str));

  String toRawJson() => json.encode(toJson());

  factory Drink.fromJson(Map<String, dynamic> json) => Drink(
    name: json["name"],
  );

  Map<String, dynamic> toJson() => {
    "name": name,
  };
}

List<Restaurant> parseRestaurant(String? json) {
  if (json == null) {
    return [];
  }

  // Correctly parse the JSON, assuming a list of restaurants
  final List<dynamic> jsonData = jsonDecode(json)['restaurants']; // Access the 'restaurants' list
  return jsonData.map((restaurantJson) => Restaurant.fromJson(restaurantJson as Map<String, dynamic>)).toList();
}