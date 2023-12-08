class ProductModel {
  final String title;
  final String descrip;
  final String imagUrl;
  final String price;
  int? numberOfPaces;

  ProductModel({
    required this.title,
    required this.descrip,
    required this.imagUrl,
    required this.price,
    this.numberOfPaces,
  });
  factory ProductModel.formJson(jsonData) {
    return ProductModel(
      title: jsonData['title'],
      descrip: jsonData['description'],
      imagUrl: jsonData['image'],
      price: jsonData['price'],
    );
  }
}

