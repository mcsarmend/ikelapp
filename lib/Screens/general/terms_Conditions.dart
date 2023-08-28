import 'package:flutter/material.dart';

import '../../constant.dart';

class TermsAndConditions extends StatefulWidget {
  @override
  State<TermsAndConditions> createState() => _TermsAndConditionsState();
}

class _TermsAndConditionsState extends State<TermsAndConditions> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          backgroundColor: PRYMARY_COLOR,
          title: Text("Terminos y Condiciones"),
          leading: IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              Navigator.pop(context);
            },
          ),
        ),
        body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 30),
            child: SingleChildScrollView(
              child: Column(children: [
                Text(
                    "Política de privacidad de 'Ikel Drinks Alpha' Fecha de entrada en vigor: 24-03-2023 En 'Ikel Drinks Alpha', valoramos y respetamos tu privacidad. Esta política de privacidad describe cómo recopilamos, utilizamos y protegemos la información personal que proporcionas al utilizar nuestra aplicación. Información que recopilamos Podemos recopilar la siguiente información personal cuando utilizas nuestra aplicación: Nombre y apellidos Dirección de correo electrónico Número de teléfono Dirección de entrega  Fecha de nacimiento Identificación con foto (para verificar la edad) Historial de compras y pedidos Información de pago Uso de la información Utilizamos la información personal que recopilamos para los siguientes fines: Procesar y entregar tus pedidos Verificar tu edad para la venta de bebidas alcohólicas Mejorar nuestros servicios y productos Enviar promociones y ofertas especiales por correo electrónico o mensaje de texto (con tu consentimiento previo) Compartir información No compartimos ni vendemos tu información personal a terceros, excepto en los siguientes casos: Con nuestros repartidores para la entrega de tus pedidos Con nuestros proveedores de pago para procesar tus pagos Si estamos obligados por ley o en respuesta a una orden judicial o una solicitud gubernamental Seguridad de la información Tomamos medidas de seguridad razonables para proteger tu información personal contra el acceso no autorizado, la modificación o la divulgación. Sin embargo, no podemos garantizar la seguridad de la información transmitida a través de Internet o almacenada en nuestros servidores. Cambios en la política de privacidad Podemos actualizar esta política de privacidad en cualquier momento y sin previo aviso. Te recomendamos que revises esta política con regularidad. Contacto Si tienes preguntas o comentarios sobre esta política de privacidad, por favor contáctanos en atencion_ikel@begroup.com.mx  Al utilizar nuestra aplicación, aceptas los términos de esta política de privacidad. Requisito de Edad Al utilizar nuestra aplicación, confirmas y aceptas que debes ser mayor de edad según las leyes aplicables en tu jurisdicción para poder hacer uso de nuestros servicios. En caso de que no cumplas con este requisito, te instamos a que dejes de utilizar nuestra aplicación de inmediato."),
              ]),
            )));
  }
}
