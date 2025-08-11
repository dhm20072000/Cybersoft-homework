import 'dart:io';

void main(){

  stdout.write('Enter your name: ');
  String name = stdin.readLineSync()!;
  stdout.write('Enter your working hours: ');
  double? hours = double.tryParse(stdin.readLineSync()!);
  stdout.write('Enter your salary per hour: ');
  double? salaryPerHour = double.tryParse(stdin.readLineSync()!);
  
  if(name == '' || hours == null || salaryPerHour == null){
    print('You must fill in all of these information');
    return;
  }

  double totalPayBeforeTax = hours > 40 ? hours * salaryPerHour * 1.2 : hours * salaryPerHour;

  double tax = 0.0;
  double totalPayAfterTax = 0.0;
  
  if(totalPayBeforeTax > 10000000){
    tax = totalPayBeforeTax * 0.1;
  }
  else if(totalPayBeforeTax <= 10000000 && totalPayBeforeTax >= 7000000){
    tax = totalPayBeforeTax * 0.05;
  }

  totalPayAfterTax = totalPayBeforeTax - tax;

  print('Name: $name');
  print('Salary before tax: $totalPayBeforeTax');
  print('Tax: $tax');
  print('Salary after tax: $totalPayAfterTax');

}