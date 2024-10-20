class A {
  late String name;
  A(String name) {
    this.name = name;
  }
  int _a = 1;
}

class B extends A {
  late final String name;
  B(String name) : super(name) {
    this.name = name;

    String b = name;
  }
}

class C extends B {
  C(String name) : super(name) {
    this.name = name;
  }
  int c = A('hello')._a + 2;
}

class D {
  int d = A('hello')._a + 3;
}

void main(List<String> args) {
  print(D().d);
}
