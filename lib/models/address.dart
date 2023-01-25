class Address {
  String? city;
  String? state;
  String? cp;
  String? suburb;
  String? street;
  String? number;

  Address({
    this.city,
    this.state,
    this.cp,
    this.suburb,
    this.street,
    this.number,
  });

  // function to convert json data to user model
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        city: json['address']['municipio'],
        state: json['address']['estado'],
        cp: json['address']['cp'].toString(),
        suburb: json['address']['colonia'],
        street: json['address']['calle'],
        number: json['address']['numero']);
  }
}
