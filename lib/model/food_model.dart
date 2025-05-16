import 'package:flutter/material.dart';

class FoodModel {
  final String name;
  final String image;
  final String category;
  final String rating;
  final String description;
  bool isFavorite;
  final String price;

  FoodModel({
    required this.name,
    required this.image,
    required this.category,
    required this.rating,
    required this.description,
    required this.isFavorite,
    required this.price,
  });
}

class FoodProvider with ChangeNotifier {
  final List<FoodModel> _foods = [
    FoodModel(
      name: "CheeseBurger",
      image: 'assets/images/meat.png',
      category: "Wendy's Burger",
      rating: '4.9',
      description:
          "The Cheeseburger Wendy's Burger is a classic fast food burger that packs a punch of flavor in every bite. Made with a juicy beef patty cooked to perfection, it's topped with melted American cheese, crispy lettuce, ripe tomato, and crunchy pickles.",
      isFavorite: false,
      price: '8.24',
    ),
    FoodModel(
      name: "HamBurger",
      image: 'assets/images/ham.png',
      category: 'Veggie Burger',
      rating: '4.8',
      description:
          "Enjoy our delicious Hamburger Veggie Burger, made with a savory blend of fresh vegetables and herbs, topped with crisp lettuce, juicy tomatoes, and tangy pickles, all served on a soft, toasted bun.",
      isFavorite: false,
      price: '9.99',
    ),
    FoodModel(
      name: "HamBurger",
      image: 'assets/images/meat.png',
      category: 'Chicken Burger',
      rating: '4.6',
      description:
          "Our chicken burger is a delicious and healthier alternative to traditional beef burgers, perfect for those looking for a lighter meal option.",
      isFavorite: false,
      price: '12.48',
    ),
    FoodModel(
      name: "HamBurger",
      image: 'assets/images/chiken.png',
      category: 'Fried Chicken Burger',
      rating: '4.5',
      description:
          "Indulge in our crispy and savory Fried Chicken Burger, made with a juicy chicken patty, hand-breaded and deep-fried to perfection.",
      isFavorite: false,
      price: '26.99',
    ),
  ];

  List<FoodModel> get foods => _foods;

  void toggleFavorite(FoodModel food) {
    food.isFavorite = !food.isFavorite;
    notifyListeners();
  }

  List<FoodModel> get favoriteFoods =>
      _foods.where((food) => food.isFavorite).toList();
}
