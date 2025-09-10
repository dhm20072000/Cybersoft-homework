import 'dart:io';

void main(){
  bool inMenu = true;

  SchoolManagement schoolManagement = new SchoolManagement();

  while(inMenu){
    stdout.writeln('Please choose one of the following options:');
    stdout.writeln('1. Input new student information');
    stdout.writeln('2. Input new teacher information');
    stdout.writeln('3. Add student and teacher to a classroom');
    stdout.writeln('4. Input student score');
    stdout.writeln('5. Show a list of students and teachers');
    stdout.writeln('6. Show an average score of a student');
    stdout.writeln('7. Show a list of classrooms and its scores');
    stdout.writeln('8. Exit');

    stdout.writeln('-------------------------');
    stdout.writeln('Enter an option: ');

    int choice = int.tryParse(stdin.readLineSync()!) ?? 1;

    switch(choice){
      case 1:
        stdout.writeln('Enter student id: ');
        String studentId = stdin.readLineSync() ?? '';

        if(studentId == ''){
          print('Student ID cannot be empty.');
          break;
        }

        schoolManagement.addStudent(studentId);
        break;

      case 2:
        stdout.writeln('Enter teacher id: ');
        String teacherId = stdin.readLineSync() ?? '';

        if(teacherId == ''){
          print('Teacher ID cannot be empty.');
          break;
        }

        schoolManagement.addTeacher(teacherId);
        break;

      case 3:
        stdout.writeln('Enter student id: ');
        String studentId = stdin.readLineSync() ?? '';

        stdout.writeln('Enter teacher id: ');
        String teacherId = stdin.readLineSync() ?? '';

        stdout.writeln('Enter classroom id: ');
        String classroomId = stdin.readLineSync() ?? '';

        stdout.writeln('Enter classroom name: ');
        String classroomName = stdin.readLineSync() ?? '';

        if(studentId == '' || teacherId == '' || classroomId == '' || classroomName == ''){
          print('Student ID, Teacher ID, Classroom ID, and Classroom Name cannot be empty.');
          break;
        }

        schoolManagement.addClassroom(studentId, teacherId, classroomId, classroomName);
        break;

      case 4:
        stdout.writeln('Enter student id: ');
        String studentId = stdin.readLineSync() ?? '';

        stdout.writeln('Enter classroom id: ');
        String classroomId = stdin.readLineSync() ?? '';

        stdout.writeln('Enter student score: ');
        double? studentScore = double.tryParse(stdin.readLineSync()!);

        if(studentId == '' || classroomId == '' || studentScore == null){
          print('Student ID, classroom ID, and student score cannot be empty.');
        }

        schoolManagement.addScore(studentId, classroomId, studentScore ?? 0);
        break;

      case 5:
        schoolManagement.printStudentsAndTeachers();
        break;

      case 6:
        stdout.writeln('Enter student id: ');
        String studentId = stdin.readLineSync() ?? '';

        if(studentId == ''){
          print('Student ID cannot be empty');
          break;
        }

        schoolManagement.printStudentAverageScore(studentId);
        break;

      case 7:
        schoolManagement.printClassroomDetails();
        break;

      case 8:
        inMenu = false;
        break;

      default:
        break;
    }

  }

}

class Person{
  final String id;
  final String name;
  final int age;
  final String gender;

  Person(this.id, this.name, this.age, this.gender);
}

class Student extends Person{
  final int grade;

  Student(super.id, super.name, super.age, super.gender, this.grade);
}

class Teacher extends Person{
  final String subject;
  final double salary;

  Teacher(super.id, super.name, super.age, super.gender, this.subject, this.salary);
}

class Classroom{
  final String id;
  final String name;
  final List<String> studentList;
  final String teacher;

  Classroom(this.id, this.name, this.studentList, this.teacher);
}

class Score{
  final String student;
  final String classroom;
  double score;

  Score(this.student, this.classroom, this.score);
}

class SchoolManagement{
  List<Student> studentList = [];
  List<Teacher> teacherList = [];
  List<Classroom> classroomList = [];
  List<Score> scoreList = [];

  void addStudent(String id){
    // dynamic existingStudent = studentList.where((student) => student.id == id).toList();
    int num = checkExisting('student', id);
    if(num > 0){
      print('The student already exists. Please create a new student.');
    }
    else{
      stdout.writeln('Enter student name: ');
      String studentName = stdin.readLineSync() ?? '';

      stdout.writeln('Enter student age: ');
      int? studentAge = int.tryParse(stdin.readLineSync()!);

      stdout.writeln('Enter student gender: ');
      String studentGender = stdin.readLineSync() ?? '';

      stdout.writeln('Enter student grade: ');
      int? studentGrade = int.tryParse(stdin.readLineSync()!);

      if(studentName == '' || studentAge == null || studentGender == '' || studentGrade == null){
        print('Please fill in all required information for the student.');
      }
      else{
        Student student = new Student(id, studentName, studentAge, studentGender, studentGrade);
        studentList.add(student);
      }
    }
  }

  void addTeacher(String id){
    // dynamic existingTeacher = teacherList.where((teacher) => teacher.id == id).toList();
    int num = checkExisting('teacher', id);
    if(num > 0){
      print('The teacher already exists. Please create a new teacher.');
    }
    else{
      stdout.writeln('Enter teacher name: ');
      String teacherName = stdin.readLineSync() ?? '';

      stdout.writeln('Enter teacher age: ');
      int? teacherAge = int.tryParse(stdin.readLineSync()!);

      stdout.writeln('Enter teacher gender: ');
      String teacherGender = stdin.readLineSync() ?? '';

      stdout.writeln('Enter teacher subject: ');
      String teacherSubject = stdin.readLineSync() ?? '';

      stdout.writeln('Enter teacher salary:');
      double? teacherSalary = double.tryParse(stdin.readLineSync()!);

      if(teacherName == '' || teacherAge == null || teacherGender == '' || teacherSubject == '' || teacherSalary == null){
        print('Please fill in all required information for the teacher.');
      }
      else{
        Teacher teacher = new Teacher(id, teacherName, teacherAge, teacherGender, teacherSubject, teacherSalary);
        teacherList.add(teacher);
      }
    }
  }

  void addClassroom(String studentId, String teacherId, String classroomId, String classroomName){

    int existingStudent = checkExisting('student', studentId);
    int existingTeacher = checkExisting('teacher', teacherId);
    int existingClassroom = checkExisting('classroom', classroomId);

    if(existingStudent <= 0 || existingTeacher <= 0){
      print('The student, the teacher, or the classroom does not exist.');
    }
    else{
      if(existingClassroom > 0){
        dynamic studentInClassroom = classroomList.where((classroom) => classroom.id == classroomId && classroom.studentList.contains(studentId)).toList();
        if(studentInClassroom.length > 0){
          print('The student already exist in the classroom ${studentInClassroom[0].name}.');
        }
        else{
          for(var classroom in classroomList){
            if(classroom.id == classroomId){
              classroom.studentList.add(studentId);
              print('The student has been successfully added to classroom $classroomName.');
            }
          }
        }
      } 
      else{
        dynamic studentInClassroom = classroomList.where((classroom) => classroom.studentList.contains(studentId) && classroom.teacher == teacherId).toList();
        if(studentInClassroom.length > 0){
          print('The student and the teacher already exist in the classroom ${studentInClassroom[0].name}.');
        }
        else{
          Classroom classroom = new Classroom(classroomId, classroomName, [studentId], teacherId);
          classroomList.add(classroom);
          print('Classroom $classroomName has been successfully added.');
        }
      }
    }
  }

  void addScore(String studentId, String classroomId, double studentScore){
    int existingStudent = checkExisting('student', studentId);
    int existingClassroom = checkExisting('classroom', classroomId);

    if(existingStudent <= 0 || existingClassroom <= 0){
      print('The student or the classroom does not exist.');
    }
    else{
      // Check if this student is in this classroom
      dynamic existingStudentClassroom = classroomList.where((classroom) => classroom.id == classroomId && classroom.studentList.contains(studentId)).length;
      
      // If exist then add the score
      // If not, then throw an error
      if(existingStudentClassroom <= 0){
        print('The student does not exist in this classroom');
      }
      else{
        // Check if this student already has the score in this classroom
        dynamic scoreExists = scoreList.where((score) => score.student == studentId && score.classroom == classroomId).length;

        // If score exists, then override it
        // If not, then create a score
        if(scoreExists <= 0){
          Score score = new Score(studentId, classroomId, studentScore);
          scoreList.add(score);
          print('The student score has been added successfully.');
        }
        else{
          for(var score in scoreList){
            if(score.student == studentId && score.classroom == classroomId){
              score.score = studentScore;
              print('The student score has been overwritten successfully.');
            }
          }
        }
      }
    }
  }

  void printStudentsAndTeachers(){
    stdout.writeln('-------------------------');
    stdout.writeln('List of students:');
    studentList.forEach((student) => print('Student ID: ${student.id} - Student name: ${student.name} - Student age: ${student.age} - Student gender: ${student.gender} - Student grade: ${student.grade}'));
    stdout.writeln('\n');
    stdout.writeln('List of teachers:');
    teacherList.forEach((teacher) => print('Teacher ID: ${teacher.id} - Teacher name: ${teacher.name} - Teacher age: ${teacher.age} - Teacher gender: ${teacher.gender} - Teacher subject: ${teacher.subject} - Teacher salary: ${teacher.salary}'));
    stdout.writeln('\n');
    stdout.writeln('-------------------------');
  }

  void printStudentAverageScore(String id){

    String averageScore = '';
    int existingStudent = checkExisting('student', id);

    if(existingStudent <= 0){
      print('The student does not exist');
    } 
    else{
      stdout.writeln('-------------------------');
      double totalScore = 0;
      double counter = 0;
      
      scoreList.forEach((score){
        if(score.student == id){
          counter++;
          totalScore += score.score;
        }
      });

      averageScore = totalScore > 0 ? (totalScore / counter).toStringAsFixed(2) : '0';

      print('The average score of this student is $averageScore'); 
      stdout.writeln('-------------------------');
    }
  }

  void printClassroomDetails(){
    stdout.writeln('-------------------------');
    if(classroomList.length <= 0){
      print('There is no classroom available.');
    }
    else{
      classroomList.forEach((classroom){
        print('Classroom name: ${classroom.name}');
        Teacher existingTeacher = teacherList.firstWhere((teacher) => teacher.id == classroom.teacher);
        print('Classroom teacher: ${existingTeacher.name}');

        List<Student> existingStudent = studentList.where((student) => classroom.studentList.contains(student.id)).toList();
        if(existingStudent.length <= 0){
          print('The classroom ${classroom.name} does have any student.');
        }
        else{
          existingStudent.forEach((student){
            Score existingScore = scoreList.firstWhere((score) => score.student == student.id && score.classroom == classroom.id, orElse: () => Score('', '', 0));
            if(existingScore.student == ''){
              print('Student name ${student.name} has no score in this classroom');
            }
            else{
              print('Student name ${student.name} has a score of ${existingScore.score} in this classroom');
            }
          });
        }

        stdout.writeln('\n');
      });
    }
    stdout.writeln('-------------------------');
  }

  int checkExisting(String option, String id){
    int num = 0;
    if(option == 'student'){
      num = studentList.where((student) => student.id == id).length;
    }
    else if(option == 'teacher'){
      num = teacherList.where((teacher) => teacher.id == id).length;
    }
    else if(option == 'classroom'){
      num = classroomList.where((classroom) => classroom.id == id).length;
    }
    return num;
  }

}