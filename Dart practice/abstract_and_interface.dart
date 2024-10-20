abstract class A {
  void abstract();

  void concrete() {
    print("concrete of A");
  }
}

class B extends A {
  @override
  void abstract() {
    print("abstract defined in B");
  }
}

class C implements B, A {
  @override
  void abstract() {
    print("abstract defined in C");
  }

  @override
  void concrete() {
    print("concrete defined in C");
  }
}

void main(List<String> args) {
  B().concrete();
}
