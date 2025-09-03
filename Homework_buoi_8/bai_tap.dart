import 'dart:io';

void main(){

  bool inMenu = true;

  CartManagement cartManagement = new CartManagement();

  while(inMenu){
    stdout.writeln('Please choose one of the following options:');
    stdout.writeln('1. Add product to cart');
    stdout.writeln('2. Edit product detail');
    stdout.writeln('3. Remove product');
    stdout.writeln('4. Show cart');
    stdout.writeln('5. Calculate total in cart');
    stdout.writeln('6. Exit');

    stdout.writeln('-------------------------');
    stdout.writeln('Enter an option: ');

    int? choice = int.tryParse(stdin.readLineSync()!) ?? 1;

    switch(choice){
      case 1:
        stdout.writeln('Enter product name: ');
        String productName = stdin.readLineSync() ?? '';

        bool productExist = cartManagement.checkIfProductNameExist(productName);
        if(productExist){
          print('Product name already exists.');
          break;
        }
        
        stdout.writeln('Enter the quantity');
        int productQuantity = int.tryParse(stdin.readLineSync()!) ?? 0;

        stdout.writeln('Enter product price');
        double productPrice = double.tryParse(stdin.readLineSync()!) ?? 0.0;

        bool result = cartManagement.verifyInput(productName, productQuantity, productPrice);

        if(!result) break;

        cartManagement.addProduct(productName, productQuantity, productPrice);
        break;

      case 2:
        stdout.writeln('Enter the product you want to edit from cart: ');
        String productName = stdin.readLineSync() ?? '';

        bool productExist = cartManagement.checkIfProductNameExist(productName);

        if(!productExist){
          print('The product name does not exist, so it cannot be edited');
          break;
        }

        cartManagement.editProduct(productName);
        break;

      case 3:
        stdout.writeln('Enter the product you want to remove from cart: ');
        String productName = stdin.readLineSync() ?? '';

        bool productExist = cartManagement.checkIfProductNameExist(productName);

        if(!productExist){
          print('The product name does not exist, so it cannot be deleted');
          break;
        }

        cartManagement.removeProduct(productName);

        break;

      case 4:
        stdout.writeln('-------------------------');
        cartManagement.showCartDetails();
        stdout.writeln('-------------------------');
        break;

      case 5:
        stdout.writeln('-------------------------');
        cartManagement.calculateTotalPrice();
        stdout.writeln('-------------------------');

      case 6:
        inMenu = false;
        break;
        
      default:
        break;
    }
  }

}

class CartManagement{
  List<Map<String, dynamic>> productList = [];

  bool verifyInput(productName, productQuantity, productPrice){
    if(productName == '' || productQuantity <= 0 || productPrice <= 0){
      print('Product name cannot be empty, product quantity and product price cannot be less than or equal to 0');
      return false;
    }
    return true;
  }

  void addProduct(productName, productQuantity, productPrice){
    Map<String, dynamic> productObj = {
      'productName': productName,
      'productQuantity': productQuantity,
      'productPrice': productPrice
    };

    productList.add(productObj);
    print('The product has been added successfully');
  }

  bool checkIfProductNameExist(productName){
    dynamic product = productList.where((product) => product['productName'] == productName);
    if(product.length <= 0){
      return false;
    }
    return true;
  }

  void editProduct(productName){
    bool editQuantity = false;
    bool editPrice = false;
    int productQuantity = 0;
    double productPrice = 0.0;

    stdout.writeln('Do you want to edit the product quantity?(Press y for Yes and n for No) ');
    String answerQuantity = stdin.readLineSync() ?? 'n';

    stdout.writeln('Do you want to edit the product price?(Press y for Yes and n for No)');
    String answerPrice = stdin.readLineSync() ?? 'n';

    editQuantity = answerQuantity == 'y' || answerQuantity == 'Y' ? true : false;
    editPrice = answerPrice == 'y' || answerPrice == 'Y' ? true : false;

    if(editQuantity || editPrice){
      if(editQuantity){
        stdout.writeln('Enter the quantity');
        productQuantity = int.tryParse(stdin.readLineSync()!) ?? 0;
      }
      
      if(editPrice){
        stdout.writeln('Enter product price');
        productPrice = double.tryParse(stdin.readLineSync()!) ?? 0.0;
      }

      bool result = verifyInput('exist', editQuantity ? productQuantity : 1, editPrice ? productPrice : 1);

      if(result){
        for(var product in productList){
          if(product['productName'] == productName){
            product['productQuantity'] = editQuantity ? productQuantity : product['productQuantity']; // If editQuanity is true, then use productQuanity, else keep the same value
            product['productPrice'] = editPrice ? productPrice : product['productPrice']; // If editPrice is true, then use productPrice, else keep the same value
            print('The product has been successfully updated');
          }
        }
      }
    }
    else{
      print('You select No for both product quantity and product price, so the product is not edited');
    }
  }

  void removeProduct(productName){
    productList = productList.where((product) => product['productName'] != productName).toList();
    print('Successfully removed $productName from cart');
  }

  void showCartDetails(){
    if(productList.length == 0){
      print('Cart is empty. Please add a product to show cart details.');
    }
    productList.forEach((product) => print('Product Name: ${product['productName']} - Product Quantity: ${product['productQuantity']} - Product Price: ${product['productPrice']}'));
  }

  void calculateTotalPrice(){
    double totalPrice = 0.0;

    productList.forEach((product) => totalPrice += product['productQuantity'] * product['productPrice']);

    print('The total price is ${totalPrice.toStringAsFixed(2)}');
  }

}