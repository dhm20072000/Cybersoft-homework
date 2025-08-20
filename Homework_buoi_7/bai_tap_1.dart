import 'dart:io';

void main(){

  bool inMenu = true;
  StudentManagement studentManagement = new StudentManagement();

  while(inMenu){
    stdout.writeln('Please choose one of the following options:');
    stdout.writeln('1. Input new student information');
    stdout.writeln('2. Show all student information');
    stdout.writeln('3. Find students with the highest average grade');
    stdout.writeln('4. Exit');

    stdout.writeln('-------------------------');
    stdout.writeln('Enter an option: ');
    int choice = int.tryParse(stdin.readLineSync()!) ?? 1;

    switch(choice){
      case 1:
        String name = '';
        final double? mathGrade;
        final double? physicsGrade;
        final double? chemistryGrade;

        bool nameExist = true;
        
        while(nameExist){
          stdout.writeln('Enter student name: ');
          name = stdin.readLineSync()!;

          bool duplicateName = studentManagement.studentList.where((student) => student.name == name).length > 0;

          if(duplicateName){
            stdout.writeln('This student name already exists, please enter a different name.');
          }
          else{
            nameExist = false;
          }

        }

        stdout.writeln(('Enter math grade: '));
        mathGrade = double.tryParse(stdin.readLineSync()!);

        stdout.writeln(('Enter physics grade: '));
        physicsGrade = double.tryParse(stdin.readLineSync()!);

        stdout.writeln(('Enter chemistry grade: '));
        chemistryGrade = double.tryParse(stdin.readLineSync()!);

        if(name == '' || mathGrade == null || physicsGrade == null || chemistryGrade == null){
          stdout.writeln('Please fill in all required information');
          break;
        }

        Student student = new Student(name, mathGrade, physicsGrade, chemistryGrade);

        studentManagement.addStudent(student);
        break;
      
      case 2:
        stdout.writeln('-------------------------');
        studentManagement.showStudentInfo();
        stdout.writeln('-------------------------');
        break;

      case 3:
        stdout.writeln('-------------------------');
        dynamic highestStudents = studentManagement.findHighestStudents();
        highestStudents.forEach((student) => print('${student.name} has the highest average grade with ${student.averageGrade}'));
        stdout.writeln('-------------------------');
        break;

      case 4:
        inMenu = false;
        break;

      default:
        break;
    }

  }

}

class Student{

  final String name;
  final double mathGrade;
  final double physicsGrade;
  final double chemistryGrade;
  double averageGrade = 0;

  Student(this.name, this.mathGrade, this.physicsGrade, this.chemistryGrade){
    String averageGradeString = ((mathGrade + physicsGrade + chemistryGrade) / 3).toStringAsFixed(2);
    averageGrade = double.parse(averageGradeString);
  }

}

class StudentManagement{
  
  final List<Student> studentList = [];

  StudentManagement();

  void addStudent(Student student){
    studentList.add(student);
  }

  void showStudentInfo(){
    if(studentList.length == 0){
      print('There is no available student. Please input new student information.');
    }
    else{
      studentList.forEach((student){
        String studentName = student.name;
        String category = '';
        double averageGrade = student.averageGrade;

        if(averageGrade > 9){
          category = 'Xuat sac';
        }
        else if(averageGrade <= 9 && averageGrade >= 7){
          category = 'Gioi';
        }
        else if(averageGrade <= 7 && averageGrade >= 5){
          category = 'Kha';
        }
        else{
          category = 'Kem';
        }

        stdout.writeln('Student name: $studentName, average grade: $averageGrade, and category: $category');
      });
    }
  }

  List<Student> findHighestStudents(){
    double highestAverage = studentList.reduce((value, element) => value.averageGrade > element.averageGrade ? value : element).averageGrade;

    List<Student> highestStudents = studentList.where((student) => student.averageGrade == highestAverage).toList();
    return highestStudents;
  }

}