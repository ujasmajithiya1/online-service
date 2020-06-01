import 'package:flutter/foundation.dart';

FooditemList scheduleService = FooditemList(foodItems: [
  FoodItem(
    id: 1,
    title: "Basic Service",
    price: 17399,
   
  ),
  FoodItem(
    id: 2,
    title: "Standard Service",
    price: 20399,

   
  ),
  FoodItem(
    id: 3,
    title: "Comprehensive Service",
    price: 30199,
    
  ),
]);

FooditemList acService = FooditemList(foodItems: [
  FoodItem(
    id: 4,
    title: "Standard Ac Service",
    price: 2199,
    
  ),
  FoodItem(
    id: 5,
    title: "Comprehensive Service",
    price: 5699,
    
  ),
]);
FooditemList batteries = FooditemList(foodItems: [
  FoodItem(
    id: 6,
    title: "Amaron 100 ah Charge\n(48 Months Warranty)",
    price: 14500,
    
  ),
  FoodItem(
    id: 7,
    title: "Exide 100 ah Charge\n(48 Months Warranty)",
    price: 15500,
    
  ),
]);
FooditemList carCareService = FooditemList(foodItems: [
  FoodItem(
    id: 8,
    title: "Dry Cleaning",
    price: 2199,
    
  ),
  FoodItem(
    id: 9,
    title: "Car Exterior Polishing and Rubbing",
    price: 2499,
    
  ),
  FoodItem(
    id: 10,
    title: "Comprehensive Cleaning",
    price: 3599,
    
  ),
  FoodItem(
    id: 11,
    title: "Teflon Coating",
    price: 5699,
    
  ),
  FoodItem(
    id: 12,
    title: "Anti Rust Underbody Coating",
    price: 3699,
    
  ),
  FoodItem(
    id: 13,
    title: "Car Inspection/Diagnostics",
    price: 499,
    
  ),
  FoodItem(
    id: 14,
    title: "Ceramic Coating",
    price: 21999,
    
  ),
]);
FooditemList denting = FooditemList(foodItems: [
  FoodItem(
    id: 15,
    title: "RHS Fender Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 16,
    title: "LHS Fender Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 17,
    title: "RHS Front Door paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 18,
    title: "LHS Front Door Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 19,
    title: "RHS Rear Door Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 20,
    title: "LHS Rear Door Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 21,
    title: "LHS Quarter Panel Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 22,
    title: "RHS Quarter Panel Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 23,
    title: "RHS Running Board Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 24,
    title: "LHS Running Board Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 25,
    title: "Front Bumper",
    price: 3400,
    
  ),
  FoodItem(
    id: 26,
    title: "Bonnet",
    price: 3400,
    
  ),
  FoodItem(
    id: 27,
    title: "Rear Bumper",
    price: 3400,
    
  ),
  FoodItem(
    id: 28,
    title: "Boot Paint",
    price: 3400,
    
  ),
  FoodItem(
    id: 29,
    title: "Full Body Dent Paint",
    price: 38000,
    
  ),
]);
FooditemList tyres = FooditemList(foodItems: [
  FoodItem(
    id: 30,
    title: "Bridgestone S001",
    price: 22493,
    
  ),
]);
FooditemList wheelCareService = FooditemList(foodItems: [
  FoodItem(
    id: 31,
    title: "Tyre Roation",
    price: 499,
    
  ),
  FoodItem(
    id: 32,
    title: "Wheel Balancing",
    price: 1600,
    
  ),
  FoodItem(
    id: 33,
    title: "Tyre Alignment",
    price: 1100,
    
  ),
]);
class FooditemList {
  List<FoodItem> foodItems;

  FooditemList({@required this.foodItems});
}

class FoodItem {
  int id;
  String title;
  double price;
  
  int quantity;


  FoodItem({
    @required this.id,
    @required this.title,
    @required this.price,
    
    this.quantity = 1,
  });
   

   FoodItem.fromMap(Map<String, dynamic> data) {
    id = data['id'];
    title = data['title'];
    price = data['price'];
    quantity = data['quantity'];
  }

  Map<String, dynamic> toMap() {
    return {
      'id': id,
      'title': title,
      'price': price,
      'quantity': quantity
    };
  }

  void incrementQuantity() {
    this.quantity = this.quantity;
  }

  void decrementQuantity() {
    this.quantity = this.quantity - 1;
  }
}
