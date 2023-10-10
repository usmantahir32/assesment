class FoodItemModel {
  String name;
  int calories;
  

  FoodItemModel({required this.name, required this.calories});
}

List<FoodItemModel> foodItems = [
  FoodItemModel(name: "Spicy Bacon Cheese Toast", calories: 212),
  FoodItemModel(name: "Almold Milk", calories: 190),
  FoodItemModel(name: "Fried Fish", calories: 300),
  FoodItemModel(name: "Chicken Broast", calories: 120),
];
