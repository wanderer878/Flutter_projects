void main(List<String> args) {

  ({String name, int age, String grade}) student_record;

  var students = [
    (name: 'Alice', age: 20, grade: 'A'),
    (name: 'Bob', age: 21, grade: 'B'),
    (name: 'Charlie', age: 19, grade: 'C'),
    (name: 'David', age: 22, grade: 'B'),
    (name: 'Eve', age: 20, grade: 'A'),
  ];

  List filterByGrade(List students, String grade){
    return students.where((element)=> element.grade == grade).toList();
    }
  
  void printStudentNames(List students){
    print("students with grade ${students[0].grade}");
    for (final element in students) print(element.name);
  }

  

  double averageAgeByGrade(List students,  String grade){

    num _sumOfAge = 0;
    List Grade_list = filterByGrade(students, grade);
    for (final element in Grade_list) {
      _sumOfAge = _sumOfAge + element.age;
    }
   
    

    return _sumOfAge/Grade_list.length;
  }

  printStudentNames(filterByGrade(students, 'A'));
  print("Average age of students with grade A: ${averageAgeByGrade(students, "A")}");
  }
