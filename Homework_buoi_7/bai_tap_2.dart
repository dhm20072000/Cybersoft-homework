import 'dart:io';

void main(){

  bool inMenu = true;
  ProductManagement productManagement = new ProductManagement();

  while(inMenu){
    stdout.writeln('Please choose one of the following options:');
    stdout.writeln('1. Input new product information');
    stdout.writeln('2. Show all product information');
    stdout.writeln('3. Search for a product by name');
    stdout.writeln('4. Sell products');
    stdout.writeln('5. Exit');

    stdout.writeln('-------------------------');
    stdout.writeln('Enter an option: ');

    int choice = int.tryParse(stdin.readLineSync()!) ?? 1;

    switch(choice){
      case 1:
        String productName = '';
        final double? productPrice;
        final int? productQuantity;

        bool nameExist = true;

        while(nameExist){
          stdout.writeln('Enter product name: ');
          productName = stdin.readLineSync()!;
          bool duplicateName = productManagement.productLists.where((product) => product.productName == productName).length > 0;
          if(duplicateName){
            stdout.writeln('This product name already exists, please enter a different name.');
          }
          else{
            nameExist = false;
          }
        }

        stdout.writeln('Enter product price: ');
        productPrice = double.tryParse(stdin.readLineSync()!);

        stdout.writeln('Enter product quantity: ');
        productQuantity = int.tryParse(stdin.readLineSync()!);

        if(productName == '' || productPrice == null || productQuantity == null){
          stdout.writeln('Please fill in all required information');
          break;
        }

        Product product = new Product(productName, productPrice, productQuantity);

        productManagement.addProduct(product);

        break;

      case 2:
        stdout.writeln('-------------------------');
        productManagement.showProductInfo();
        stdout.writeln('-------------------------');
        break;

      case 3:
        final String productName;

        stdout.writeln('-------------------------');
        stdout.writeln('Enter the product name you want to search for: ');
        productName = stdin.readLineSync()!;
        productManagement.searchProductName(productName);
        stdout.writeln('-------------------------');
        break;

      case 4:
        String productName = '';
        int? productQuantity = 0;
        dynamic productDetail;

        bool nameExist = false;
        bool quantityExist = false;

        while(!nameExist){
          stdout.writeln('Enter product name: ');
          productName = stdin.readLineSync()!;

          productDetail = productManagement.productLists.firstWhere((product) => product.productName == productName, orElse: () => Product('', 0, 0));

          if(productDetail.productName == ''){
            print('The product name you entered is not available. Please enter a different name.');
          }
          else{
            nameExist = true; 
          }
        }

        if(productDetail.productQuantity <= 0){
          print('This product is sold out.');
        }
        else{
          while(!quantityExist){
            stdout.writeln('Enter product quantity you want to order: ');
            productQuantity = int.tryParse(stdin.readLineSync()!);
            int tempQuantity = productDetail.productQuantity - productQuantity;

            if(productQuantity == null){
              print('Please enter a number.');
            }
            else{
              if(tempQuantity < 0){
                print('Not enough stock. Please order lower quantity. This product has ${productDetail.productQuantity} items in stock.');
              }
              else{
                quantityExist = true;
                productManagement.updateQuantity(productName, tempQuantity);
                print('$productQuantity of $productName${productQuantity > 1 ? 's' : ''} ${productQuantity > 1 ? 'have' : 'has'} been sold');
              }
            }
          }
        }
        break;

      case 5:
        inMenu = false;
        break;

      default:
        break;
    }

  }

}

class Product{

  final String productName;
  final double productPrice;
  int productQuantity = 0;

  Product(this.productName, this.productPrice, this.productQuantity); 

}

class ProductManagement{

  List<Product> productLists = [];

  ProductManagement();

  void addProduct(Product product){
    productLists.add(product);
    stdout.writeln('Product name ${product.productName} has been successfully added!');
  }

  void showProductInfo(){
    if(productLists.length == 0){
      print('There is no available product. Please input new product information.');
    }
    else{
      productLists.forEach((product) => print('${product.productName} - ${product.productPrice} - ${product.productQuantity}'));
    }
  }

  void searchProductName(String productName){
    Product productDetail = productLists.firstWhere((product) => product.productName == productName, orElse: () => Product('', 0, 0));
    if(productDetail.productName == ''){
      print('This product name does not exist in the system.');
    }
    else{
      print('${productDetail.productName} - ${productDetail.productPrice} - ${productDetail.productQuantity}');
    }
  }

  void updateQuantity(String productName, int productQuantity){
    for(var product in productLists){
      if(product.productName == productName){
        product.productQuantity = productQuantity;
      }
    }
  }

}