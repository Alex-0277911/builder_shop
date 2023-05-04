// Інтерфейс будівельників оголошує всі можливі етапи та кроки
// конфігурації продукту.
abstract class Builder {
  void reset();
  void setSeats(int seats);
  void setEngine(String engine);
  void setTripComputer(bool tripComputer);
  void setGPS(bool gps);
}

// Усі конкретні будівельники реалізують загальний інтерфейс по своєму.
class CarBuilder implements Builder {
  final List<String> _car = [];

  @override
  void reset() {
    _car.clear();
  }

  @override
  void setSeats(int seats) {
    // Встановити вказану кількість сидінь.
    _car.add("Number of seats: $seats");
  }

  @override
  void setEngine(String engine) {
    // Встановити наданий двигун.
    _car.add("Engine: $engine");
  }

  @override
  void setTripComputer(bool tripComputer) {
    // Встановити надану систему навігації.
    _car.add("Trip computer: ${tripComputer ? "yes" : "no"}");
  }

  @override
  void setGPS(bool gps) {
    // Встановити або зняти GPS.
    _car.add("GPS: ${gps ? "yes" : "no"}");
  }

  List<String> getResult() {
    // Повернути поточний об'єкт автомобіля.
    final car = _car;
    return car;
  }
}

class CarManualBuilder implements Builder {
  final List<String> _manual = [];

  @override
  void reset() {
    _manual.clear();
  }

  @override
  void setSeats(int numberOfSeats) {
    _manual.add("Number of seats: $numberOfSeats");
  }

  @override
  void setEngine(String engine) {
    _manual.add("Engine: $engine");
  }

  @override
  void setTripComputer(bool hasTripComputer) {
    _manual.add("Trip computer: ${hasTripComputer ? "yes" : "no"}");
  }

  @override
  void setGPS(bool hasGPS) {
    _manual.add("GPS: ${hasGPS ? "yes" : "no"}");
  }

  List<String> getResult() {
    final manual = _manual;
    return manual;
  }
}

class Director {
  void constructSportsCar(Builder builder) {
    builder.reset();
    builder.setSeats(2);
    builder.setEngine('SportEngine');
    builder.setTripComputer(true);
    builder.setGPS(true);
  }

  void constructCar(Builder builder) {
    builder.reset();
    builder.setSeats(4);
    builder.setEngine('DieselEngine');
    builder.setTripComputer(false);
    builder.setGPS(false);
  }
}

void main() {
  Director director = Director();

  CarBuilder carBuilder = CarBuilder();
  director.constructCar(carBuilder);
  final car = carBuilder.getResult();
  // друкуємо результат створення мануалу
  for (var element in car) {
    print('Car: $element');
  }

  CarBuilder carSportBuilder = CarBuilder();
  director.constructSportsCar(carSportBuilder);
  final carSport = carSportBuilder.getResult();
  // друкуємо результат створення мануалу
  for (var element in carSport) {
    print('Car Sport: $element');
  }

  CarManualBuilder manualSportCarBuilder = CarManualBuilder();
  director.constructSportsCar(manualSportCarBuilder);
  final manual = manualSportCarBuilder.getResult();
  // друкуємо результат створення мануалу
  for (var element in manual) {
    print('Manual Sport Car: $element');
  }

  CarManualBuilder manualCarBuilder = CarManualBuilder();
  director.constructCar(manualCarBuilder);
  final manualCar = manualCarBuilder.getResult();
  // друкуємо результат створення мануалу
  for (var element in manualCar) {
    print('Manual Car: $element');
  }
}
