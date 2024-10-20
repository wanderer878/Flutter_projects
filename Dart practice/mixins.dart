class A {
  void a() {
    print("method of A");
  }
}

mixin B {
  void mixin_method() {
    print("mixin method of B");
  }
}

mixin C {
  void mixin_method() {
    print("mixin method of C");
  }
}

class D extends A with B, C {}

void main(List<String> args) {
  D().a();
  D().mixin_method();
}
