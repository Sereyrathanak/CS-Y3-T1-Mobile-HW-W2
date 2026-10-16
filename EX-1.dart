
enum Skill { FLUTTER, DART, OTHER }

class Address {
  final String street;
  final String city;
  final String zipCode;

  Address(this.street, this.city, this.zipCode);
}


class Employee {
  final String _name;
  final double _baseSalary;
  final List<Skill> _skills;
  final Address _address;
  final int _yearsOfExperience;

  Employee(
    this._name,
    this._baseSalary,
    this._skills,
    this._address,
    this._yearsOfExperience,
  );

 
  Employee.mobileDeveloper(
    String name,
    double baseSalary,
    Address address,
    int yearsOfExperience,
  ) : this(
        name,
        baseSalary,
        [Skill.FLUTTER, Skill.DART],
        address,
        yearsOfExperience,
      );

 
  String get name => _name;
  double get baseSalary => _baseSalary;
  List<Skill> get skills => List.unmodifiable(_skills);
  Address get address => _address;
  int get yearsOfExperience => _yearsOfExperience;

  double computeSalary() {
    double salary = 40000;

    salary = salary + (_yearsOfExperience * 2000);

    for (Skill skill in _skills) {
      if (skill == Skill.FLUTTER) {
        salary = salary + 5000;
      } else if (skill == Skill.DART) {
        salary = salary + 3000;
      } else if (skill == Skill.OTHER) {
        salary = salary + 1000;
      }
    }

    return salary;
  }


  void displayInfo() {
    print("Name: $name");
    print("Base Salary: $baseSalary");
    print("Skills: $skills");
    print("City: ${address.city}");
    print("Experience: $yearsOfExperience years");
    print("Final Salary: ${computeSalary()}");
  }
}


void main() {
  Address address1 = Address(
    "Street 123",
    "Phnom Penh",
    "12000",
  );

  Employee emp1 = Employee.mobileDeveloper(
    "Dara",
    40000,
    address1,
    3,
  );

  emp1.displayInfo();
}