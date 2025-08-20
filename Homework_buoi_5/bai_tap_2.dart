import 'dart:io';

void main(){

  stdout.write('Enter the name of the product: ');
  String productName = stdin.readLineSync()!;
  stdout.write('Enter the quantity: ');
  double? itemQuantity = double.tryParse(stdin.readLineSync()!);
  stdout.write('Enter item price: ');
  double? itemPrice = double.tryParse(stdin.readLineSync()!);

  if(productName == '' || itemQuantity == null || itemPrice == null){
    print('You must fill in all of these information');
    return;
  }

  double totalPrice = itemQuantity * itemPrice;
  
  double priceDiscount = 0.0;
  double totalPriceAfterDiscount = 0.0;
  double vatTax = 0.0;
  double finalTotalPrice = 0.0;

  if(totalPrice > 1000000){
    priceDiscount = totalPrice * 0.1;
  }
  else if(totalPrice <= 1000000 && totalPrice >= 500000){
    priceDiscount = totalPrice * 0.05;
  }

  totalPriceAfterDiscount = totalPrice - priceDiscount;

  vatTax = totalPriceAfterDiscount * 0.08;

  finalTotalPrice = totalPriceAfterDiscount + vatTax;

  print('Product name: $productName');
  print('Item quantity: $itemQuantity');
  print('Item price: $itemPrice');
  print('Total price before discount: $totalPrice');
  print('Discount: $priceDiscount');
  print('VAT tax: $vatTax');
  print('Final price: $finalTotalPrice');

}