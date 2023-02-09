class Orders {
  String? internal_id;
  String? order_description;
  String? cost;
  String? lat_destiny;
  String? lon_destiny;
  int? status;

  Orders(
      {this.internal_id,
      this.order_description,
      this.cost,
      this.lat_destiny,
      this.lon_destiny,
      this.status});

  // function to convert json data to Orders model
  factory Orders.fromJson(Map<String, dynamic> json) {
    return Orders(
        internal_id: json['orders']['internal_id'],
        order_description: json['orders']['order_description'],
        cost: json['orders']['cost'],
        lat_destiny: json['orders']['lat_destiny'].toString(),
        lon_destiny: json['orders']['lon_destiny'].toString(),
        status: json['orders']['status']);
  }
}
