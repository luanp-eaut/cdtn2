// Class cơ bản
class Person {
  String name;
  int age;

  // Constructor
  Person(this.name, this.age);

  // Named constructor
  Person.guest() : name = 'Khách', age = 0;

  void introduce() {
    print('Tôi là $name, $age tuổi');
  }
}

// Kế thừa
class Employee extends Person {
  String company;

  Employee(String name, int age, this.company) : super(name, age);

  @override
  void introduce() {
    super.introduce();
    print('Làm việc tại $company');
  }
}

// Abstract class
abstract class Shape {
  double area();
}

// Implements interface
class Circle implements Shape {
  double radius;
  Circle(this.radius);

  @override
  double area() => 3.14 * radius * radius;
}

// Mixin
mixin Flyable {
  void fly() => print('Đang bay');
}

class Bird with Flyable {
  String name;
  Bird(this.name);
}

void main() {
  // Sử dụng class
  var person = Person('An', 25);
  person.introduce();

  var guest = Person.guest();
  guest.introduce();

  // Kế thừa
  var emp = Employee('Bình', 30, 'Google');
  emp.introduce();

  // Interface
  var circle = Circle(5);
  print('Diện tích hình tròn: ${circle.area()}');

  // Mixin
  var bird = Bird('Chim sẻ');
  bird.fly();
}
