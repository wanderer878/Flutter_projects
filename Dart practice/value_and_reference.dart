class Car {
  late String model;
  Car(String model) {
    this.model = model;
  }
}

void changer(Car car) {
  car.model = 'suzuki';
}

void main(List<String> args) {
  Car car1 = Car('honda');
  Car car2 = Car('civic');

  changer(car1);

  print(car1.model);
  print(car2.model);
}
