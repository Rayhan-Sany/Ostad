import 'dart:io';

void main() {
  List<Map<String, dynamic>> fruits = [
    {'name': 'Apple', 'color': 'Red', 'price': 2.5},
    {'name': 'Banana', 'color': 'Yellow', 'price': 1.0},
    {'name': 'Grapes', 'color': 'Purple', 'price': 2.7},
  ];
  displayFruitsDetails(fruits);
  print("Enter How Much Discount You Want Give : ");
  int discount = int.parse(stdin.readLineSync()!);
  applyPriceDiscount(fruits, discount);
  print('\nAfter $discount% Discount Prcices Are\n');
  displayFruitsDetails(fruits);
}

void displayFruitsDetails(List fruits) {
  for (int i = 0; i < fruits.length; i++) {
    print('Name : ' + fruits[i]['name']);
    print('Color : ' + fruits[i]['color']);
    print('Price : \$' + fruits[i]['price'].toString());
    print('');
  }
}

void applyPriceDiscount(List fruits, int discount) {
  for (int i = 0; i < fruits.length; i++) {
    fruits[i]['price'] -= (fruits[i]['price']) * (discount / 100);
  }
}
