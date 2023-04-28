//  Builder у магазинній програмі на мові Dart:

// клас Product, що містить три властивості - назву товару, ціну та опис.

class Product {
  final String name;
  final double price;
  final String description;

  Product(this.name, this.price, this.description);
}

// Клас ProductBuilder є будівельником, який допомагає створити об'єкт класу
// Product. У будівельника є три методи setName, setPrice та setDescription,
// які дозволяють задати значення для кожної з властивостей класу Product.
// Метод build повертає готовий об'єкт класу Product, зі значеннями,
// встановленими за допомогою методів будівельника.

class ProductBuilder {
  late String name;
  late double price;
  late String description;

  ProductBuilder setName(String name) {
    this.name = name;
    return this;
  }

  ProductBuilder setPrice(double price) {
    this.price = price;
    return this;
  }

  ProductBuilder setDescription(String description) {
    this.description = description;
    return this;
  }

  Product build() {
    return Product(name, price, description);
  }
}

// У головній функції main створюється об'єкт класу Product за допомогою
// методів будівельника. Після цього значення кожної з властивостей
// виводяться на екран за допомогою функції print.

void main() {
  Product product = ProductBuilder()
      .setName("Laptop")
      .setPrice(999.99)
      .setDescription("15-inch MacBook Pro with Retina display")
      .build();

  print("Product name: ${product.name}");
  print("Product price: ${product.price}");
  print("Product description: ${product.description}");
}
