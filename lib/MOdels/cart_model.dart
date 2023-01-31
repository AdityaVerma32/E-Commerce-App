class CartModel {
  //defining variables
  int? id;
  String? name;
  int? quantity;
  int? price;
  bool? isExist;
  String? img;
  String? time;

  //constructor
  CartModel({
    this.id,
    this.name,
    this.price,
    this.img,
    this.isExist,
    this.quantity,
    this.time,
  });

  //Getting data from json
  CartModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    price = json['price'];
    img = json['img'];
    quantity = json['quantity'];
    isExist = json['isExist'];
    time = json['time'];
  }
}
