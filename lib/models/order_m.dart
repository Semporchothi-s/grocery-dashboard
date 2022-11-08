// To parse this JSON data, do
//
//     final orderitems = orderitemsFromJson(jsonString);

import 'dart:convert';

Orderitems ordersFromJson(String str) => Orderitems.fromJson(json.decode(str));
Orderitems orderssFromJson(String str) => Orderitems.fromJson(json.decode(str).cast<Map<String, dynamic>>());

String ordersToJson(Orderitems data) => json.encode(data.toJson());

class Orderitems {
  Orderitems({
    this.id = "",
    this.total = " ",
    this.status = "",
    this.takenBy = "",
    this.product = const [],
  });

  String id;
  String total;
  String status;
  String takenBy;
  List<Product> product;

  factory Orderitems.fromJson(Map<String, dynamic> json) => Orderitems(
        id: json["_id"],
        total: json["total"],
        status: json["status"],
        takenBy: json["taken_by"],
        product:
            List<Product>.from(json["product"].map((x) => Product.fromJson(x))),
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "total": total,
        "status": status,
        "taken_by": takenBy,
        "product": List<dynamic>.from(product.map((x) => x.toJson())),
      };
}

class Product {
  Product({
    this.id = "",
    this.productname = "",
    this.price = "",
    this.qty = "",
  });

  String id;
  String productname;
  String price;
  String qty;

  factory Product.fromJson(Map<String, dynamic> json) => Product(
        id: json["_id"],
        productname: json["productname"],
        price: json["price"],
        qty: json["qty"]
      );

  Map<String, dynamic> toJson() => {
        "_id": id,
        "productname": productname,
        "price": price,
        "qty" : qty,
      };
}
