import 'dart:io';

void main() {
  Student student1 = Student(
      name: 'Rayhan',
      age: 23,
      address: 'Madaripur',
      studentId: 157,
      grade: 'A+');
  student1.takeInputCorseScores();
  displayStudentDetails(student1);
  Teacher teacher1 =
      Teacher(name: "Mridha", age: 38, address: "Rajshahi", teacherId: 202);
  print('');
  teacher1.takeInputCorseTaugth();
  displayTeacherDetails(teacher1);
}

abstract class Role {
  void displayRole(); //interface
}

class Person implements Role {
  String name;
  int age;
  String address;
  Person({required this.name, required this.age, required this.address});

  @override
  void displayRole() {
    // Person Can Have Any Kind Of Role
  }
  String get getName => name;
  int get getAge => age;
  String get getAddress => address;
}

class Student extends Person {
  int studentId;
  String grade; //Additional Attribuites
  late List<double> courseScores;

  Student(
      {required super.name,
      required super.age,
      required super.address, //Constructor
      required this.studentId,
      required this.grade});

  @override
  void displayRole() {
    print("Role : Student"); //Overriding Role Method
  }

  void takeInputCorseScores() {
    print("Enter Number Of Total Course : ");
    int numberOfCourse = int.parse(stdin.readLineSync()!);
    print("Enter Course Scores : ");
    List<double> temp = List.filled(numberOfCourse, 0);
    for (int i = 0; i < numberOfCourse; i++) {
      temp[i] = double.parse(stdin.readLineSync()!);
    }
    this.courseScores = temp;
  }

  double calculateAvarage() {
    double sum = 0;
    for (int i = 0; i < courseScores.length; i++)
      sum += courseScores[i]; //Calculating Avarage Mark And Return Avarage
    return sum / courseScores.length;
  }
}

class Teacher extends Person {
  int teacherId;
  late List<String> courseTaught;
  @override
  void displayRole() {
    print("Role : Teacher");
  }

  Teacher(
      {required super.name,
      required super.age,
      required super.address,
      required this.teacherId});

  void takeInputCorseTaugth() {
    print("Enter Number Of Taught Course : ");
    int numberOfCourse = int.parse(stdin.readLineSync()!);
    print("Enter Courses Name : ");
    List<String> temp = List.filled(numberOfCourse, '');
    for (int i = 0; i < numberOfCourse; i++) {
      temp[i] = stdin.readLineSync()!;
    }
    this.courseTaught = temp;
  }
}

void displayStudentDetails(Student student) {
  print("\n--------Student Information--------\n");
  student.displayRole();
  print("Name : ${student.getName}");
  print("Age : ${student.getAge}");
  print("Address : ${student.getAddress}");
  print("Avarage Score :" + student.calculateAvarage().toStringAsFixed(1));
}

void displayTeacherDetails(Teacher teacher) {
  print("\n--------Teacher Information--------\n");
  teacher.displayRole();
  print("Name : ${teacher.getName}");
  print("Age : ${teacher.getAge}");
  print("Address : ${teacher.getAddress}");
  print("Course Taught : ");
  for (int i = 0; i < teacher.courseTaught.length; i++)
    print("-" + teacher.courseTaught[i]);
}
