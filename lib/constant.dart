// ----- STRINGS ------
import 'package:flutter/material.dart';

const baseURL = 'https://seges.com.mx/api';
// const baseURL = 'http://127.0.0.1:8000/api';

const loginURL = baseURL + '/login';
const registerURL = baseURL + '/register';
const logoutURL = baseURL + '/logout';
const userURL = baseURL + '/user';
const postsURL = baseURL + '/posts';
const commentsURL = baseURL + '/comments';
const addressURL = baseURL + '/address';
const ordersURL = baseURL + '/getorders';
const addressByCpURL = baseURL + '/addressbycp';
const setaddressByCpURL = baseURL + '/insertupdateaddress';
const headers = {'Accept': 'application/json'};
const MAP_API = "AIzaSyCI9KYYmGxX3_PpRTjvzimwhlfRmemqH7g";
final Color PRYMARY_COLOR = Color.fromRGBO(143, 164, 58, 1);
final Color SECONDARY_COLOR = Color.fromRGBO(141, 166, 199, 1);
final Color THYRD_COLOR = Color.fromRGBO(227, 234, 204, 1);
final List<String> beersList = [
  'Bud Light',
  'Corona Extra',
  'Corona Light',
  'Heineken',
  'Indio',
  'Modelo Especial',
  'Tecate Ambar',
  'Tecate Light',
  'Tecate Roja',
  'Tecate Titanium',
  'Victoria',
  'XX Lagger',
  'XX Ambar',
];
final List<String> frostyList = [
  'Rocakelta',
  'Bubble Gum',
  'Burbu Soda',
  'Lucas',
  'Pelon pelorico',
  'Picafresa',
  'PintaAzul',
  'Pulparindo',
  'Super Rebanadas',
  'Tarrito',
  'Truena Pop',
  'Tupsi Pop',
  'Sin escarchado',
];
final List<String> skewerList = [
  'Gomitas Enchiladas',
  'Tamarindo',
  'Sin brocheta',
];
final List<String> snackList = [
  'Cacahuates Enchilados',
  'Cerezas Picantes',
  'Cueritos',
  'Gomitas Enchiladas',
  'Jicama Pepino Zanahoria',
  'Sin botana',
];
final List<String> redbullList = [
  'Red Bull Energy',
  'Red Bull Sugar Free',
  'Red Bull Tropical',
];
final List<String> icecreamList = [
  'Tamarindo',
  'Mango',
];
final List<String> mezcalList = [
  '400 Conejos',
  '1000 Diablos',
  'Alacrán',
  'Unión el Viejo',
];
final List<String> clamatoList = [
  'Clamato Natural',
  'Clamato Preparado',
];
final List<String> flavorsList = [
  'Blue Berry',
  'Coco',
  'Durazno',
  'Frambuesa',
  'Fresa',
  'Frutos Rojos',
  'Mandarina',
  'Mango',
  'Manzana Verde',
  'Maracuya',
  'Pepino-Morita',
  'Piña Chamoy',
  'Piña Colada',
  'Tamarindo',
  'Uva',
];
// ----- Errors -----
const serverError = 'Error en el servidor';
const unauthorized = 'no autorizado';
const somethingWentWrong = 'Algo salio mal intente de nuevo';

// --- input decoration
InputDecoration kInputDecoration(String label) {
  return InputDecoration(
      labelText: label,
      contentPadding: EdgeInsets.all(10),
      border: OutlineInputBorder(
          borderSide: BorderSide(width: 1, color: Colors.black)));
}

// button

TextButton kTextButton(String label, Function onPressed) {
  return TextButton(
    child: Text(
      label,
      style: TextStyle(color: Colors.white),
    ),
    style: ButtonStyle(
        backgroundColor:
            MaterialStateColor.resolveWith((states) => PRYMARY_COLOR),
        padding: MaterialStateProperty.resolveWith(
            (states) => EdgeInsets.symmetric(vertical: 10))),
    onPressed: () => onPressed(),
  );
}

// loginRegisterHint
Row kLoginRegisterHint(String text, String label, Function onTap) {
  return Row(
    mainAxisAlignment: MainAxisAlignment.center,
    children: [
      Text(text),
      GestureDetector(
          child:
              Text(label, style: TextStyle(color: PRYMARY_COLOR, fontSize: 12)),
          onTap: () => onTap())
    ],
  );
}

// likes and comment btn

Expanded kLikeAndComment(
    int value, IconData icon, Color color, Function onTap) {
  return Expanded(
    child: Material(
      child: InkWell(
        onTap: () => onTap(),
        child: Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Icon(
                icon,
                size: 16,
                color: color,
              ),
              SizedBox(width: 4),
              Text('$value')
            ],
          ),
        ),
      ),
    ),
  );
}
