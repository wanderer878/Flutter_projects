class Planet {
  bool big = true;

  String meth1(int a) {
    return a.toString();
  }

  String meth1(int a, int b) {
    return a.toString() + b.toString();
  }
}

class Earth extends Planet {
  @override
  bool big = false;
}

void main(List<String> args) {
  Earth earth = Earth();
  Planet planet = Planet();
  print(planet.big);
  print(earth.big);
}
