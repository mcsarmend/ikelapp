class Address {
  String? city;
  String? state;
  String? cp;
  String? suburb;
  String? street;
  String? number;
  int? idCity;
  int? idState;

  Address({
    this.city,
    this.state,
    this.cp,
    this.suburb,
    this.street,
    this.number,
    this.idState,
    this.idCity,
  });

  // function to convert json data to user model
  factory Address.fromJson(Map<String, dynamic> json) {
    return Address(
        city: json['address']['municipio'],
        state: json['address']['estado'],
        cp: json['address']['cp'].toString(),
        suburb: json['address']['colonia'],
        street: json['address']['calle'],
        number: json['address']['numero'],
        idState: json['address']['idestado'],
        idCity: json['address']['idmunicipio']);
  }
}
