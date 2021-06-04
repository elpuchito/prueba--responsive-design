import 'package:flutter/material.dart';
import 'package:prueba/widgets2/constants.dart';
import 'package:prueba/widgets2/custom_text_button.dart';
import 'package:prueba/widgets2/dark_blue_button.dart';
import 'package:responsive_builder/responsive_builder.dart';

import 'global/main_app_bar_widget.dart';

class ViajeroExpressoApp extends StatefulWidget {
  static String routeName = 'viajero_expreso';
  @override
  _ViajeroExpressoAppState createState() => _ViajeroExpressoAppState();
}

class _ViajeroExpressoAppState extends State<ViajeroExpressoApp> {
  final GlobalKey<ScaffoldState> _drawerKey = GlobalKey();

  void openDrawer() {
    _drawerKey.currentState.openDrawer();
  }

  @override
  Widget build(BuildContext context) {
    return ResponsiveBuilder(
      builder: (context, sizingInformation) {
        // Check the sizing information here and return your UI
        if (sizingInformation.deviceScreenType == DeviceScreenType.desktop) {
          return Desktop();
        }

        if (sizingInformation.deviceScreenType == DeviceScreenType.tablet) {
          return Mobile();
        }

        return Mobile();
      },
    );
  }
}

class Desktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: MainAppBarWidget(onPressedMenu: () => openDrawer()),
      drawer: MainDrawerWidget(),
      body: Stack(
        children: [
          ListView(
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 400,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    fit: BoxFit.fitWidth,
                    image: AssetImage('img/3.0x/banner_ve.png'),
                  ),
                ),
              ),
              Column(
                crossAxisAlignment: CrossAxisAlignment.stretch,
                children: [
                  //extremely padded column
                  Container(
                    padding: EdgeInsets.only(left: 350, right: 100),
                    child: Column(
                      children: [
                        TitleBlue(
                          title: 'Ventajas del plan Viajero Expreso:',
                        ),
                        PointsRow(title1: title1, title2: title2),
                        //invisible divider
                        SizedBox(
                          height: 40,
                        ),
                        //yelow container
                        OrangeSection(parr1: parr1, parr2: parr2),
                        SizedBox(
                          height: 20,
                        ),
                        TitleBlue(
                          title: 'Porcentaje de Acumulación',
                        ),
                        ImageContainer(),
                        //footer
                      ],
                    ),
                  ),

                  Footer(contactos: contactos),
                ],
              ),
            ],
          ),
          FloatingMenu(),
        ],
      ),
    );
  }
}

class Footer extends StatelessWidget {
  const Footer({
    Key? key,
    required this.contactos,
  }) : super(key: key);

  final String contactos;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30),
      // color: Colors.red,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('¿Necesitas atención personalizada?', style: p),
              Text('Contáctanos', style: h2),
              Text('Formulario de contacto', style: p),
              Text('Preguntas frecuentes', style: p),
              SizedBox(
                height: 20,
              ),
              Text(contactos, style: p),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Información corporativa'),
              CustomTextButton(
                title: 'Aviso legal',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'Contrato de Transporte',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'Contrato de Mensajería',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'Aviso de privacidad',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'Correo Corporativo',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'Portal de afiliados',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'Trabaje con nosotros',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'Te conecta',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'Certificado de proveedores',
                onPressed: () {},
              ),
              CustomTextButton(
                title: 'gestion de riesgos',
                onPressed: () {},
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Síguenos en nuestras redes:', style: p),
              SizedBox(height: 20),
              SocialIconRow(),
              SizedBox(height: 40),
              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 40,
                      child: Image(
                        image: AssetImage('icons/Social/Imagen-6.png'),
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Image(
                        image: AssetImage('icons/Social/Imagen-7.png'),
                      ),
                    ),
                    Container(
                      height: 40,
                      child: Image(
                        image: AssetImage('icons/Social/Imagen-8.png'),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(height: 20),
              Container(
                width: 300,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      height: 50,
                      child: Image(
                        image: AssetImage('icons/Social/Imagen-9.png'),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Image(
                        image: AssetImage('icons/Social/Imagen-10.png'),
                      ),
                    ),
                    Container(
                      height: 50,
                      child: Image(
                        image: AssetImage('icons/Social/Imagen-11.png'),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class SocialIconRow extends StatelessWidget {
  const SocialIconRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 210,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          socialButton('icons/Social/instagram-logo.png', () {}),
          CircleAvatar(
              radius: 15,
              backgroundColor: Colors.indigo[900],
              child: Center(
                  child: Image(
                      image: AssetImage('icons/Social/twitter-logo.png')))),
          CircleAvatar(
              radius: 15,
              backgroundColor: Colors.indigo[900],
              child: Center(
                  child: Image(
                      image: AssetImage('icons/Social/facebook-logo.png')))),
          CircleAvatar(
              radius: 15,
              backgroundColor: Colors.indigo[900],
              child: Center(
                  child: Image(
                      image: AssetImage('icons/Social/youtube-logo.png')))),
        ],
      ),
    );
  }

  Widget socialButton(String image, VoidCallback onTap) {
    return InkWell(
      onTap: onTap,
      child: CircleAvatar(
          radius: 15,
          backgroundColor: Colors.indigo[900],
          child: Center(child: Image(image: AssetImage(image)))),
    );
  }
}

class FloatingMenu extends StatelessWidget {
  const FloatingMenu({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Positioned.fill(
      top: 40,
      left: 20,
      child: Align(
        alignment: Alignment.topCenter,
        child: Row(
          //customCard
          children: [
            Container(
              width: 285,
              height: 450,
              padding: EdgeInsets.symmetric(
                vertical: 20.0,
                horizontal: 10,
              ),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(12.0)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(0.2),
                    spreadRadius: 3,
                    blurRadius: 7,
                    offset: Offset(3, 4), // changes position of shadow
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Icon(Icons.supervised_user_circle_rounded, size: 80),
                  Text('Hola, JAVIER ARTURO TORRES ROSAS!',
                      style: h2, textAlign: TextAlign.center),
                  SizedBox(height: 20),
                  PuntosCardSection(),
                  SizedBox(height: 20),
                  CardItem(
                    onTap: () {},
                    title: 'Viajero Expreso',
                    icon: Icons.bus_alert_rounded,
                  ),
                  CardItem(
                    onTap: () {},
                    title: 'Mis Puntos',
                    icon: Icons.data_usage,
                  ),
                  CardItem(
                    onTap: () {},
                    title: 'Mis Reservas',
                    icon: Icons.data_usage,
                  ),
                  CardItem(
                    onTap: () {},
                    title: 'Mis Tiquetes',
                    icon: Icons.airplane_ticket,
                  ),
                  SizedBox(
                    height: 30,
                  ),
                  Divider(thickness: 0.4, color: Colors.grey[400]),
                  CardItem(
                    onTap: () {},
                    title: 'Cerrar Sesion',
                    icon: Icons.airplane_ticket,
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class CardItem extends StatelessWidget {
  final String title;
  final IconData icon;
  final VoidCallback onTap;

  const CardItem(
      {Key? key, required this.title, required this.icon, required this.onTap})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        TextButton.icon(
          onPressed: onTap,
          icon: Icon(icon),
          label: Text(title),
        ),
      ],
    );
  }
}

class PuntosCardSection extends StatelessWidget {
  const PuntosCardSection({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Tienes'),
            Text('13.000'),
            Text('Puntos'),
          ],
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Proximos a vencer'),
            Text('2.000'),
            Text('Puntos'),
          ],
        ),
      ],
    );
  }
}

class OrangeSection extends StatelessWidget {
  const OrangeSection({
    Key? key,
    required this.parr1,
    required this.parr2,
  }) : super(key: key);

  final String parr1;
  final String parr2;
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.symmetric(vertical: 30, horizontal: 10),
      color: Colors.amber,
      child: IntrinsicHeight(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Flexible(
              child: Column(
                children: [
                  Text(parr1),
                  LittleDarkBlueButton(
                    title: 'INSCRIBETE AL PLAN',
                  ),
                ],
              ),
            ),
            SizedBox(
              width: 10,
            ),
            VerticalDivider(
              width: 20,
              thickness: 0.7,
              color: Colors.amber[900],
            ),
            SizedBox(
              width: 10,
            ),
            Flexible(
              child: Column(
                children: [
                  Text(parr2),
                  LittleDarkBlueButton(
                    title: 'INGRESA A TU CUENTA',
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class ImageContainer extends StatelessWidget {
  const ImageContainer({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.green,
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 40, horizontal: 30),
      child: Container(
        width: MediaQuery.of(context).size.width,
        height: 400,
        decoration: BoxDecoration(
          image: DecorationImage(
            fit: BoxFit.fitHeight,
            image: AssetImage('img/3.0x/porcentaje_acumulacion_ve.png'),
          ),
        ),
      ),
    );
  }
}

class TitleBlue extends StatelessWidget {
  final String title;
// 'Ventajas del plan Viajero Expreso:'
  const TitleBlue({Key? key, required this.title}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: EdgeInsets.symmetric(vertical: 30),
      child: Text(
        title,
        style: TextStyle(
            color: Color(0xFF001A72),
            fontSize: 18.0,
            fontWeight: FontWeight.bold),
      ),
    );
  }
}

class PointsRow extends StatelessWidget {
  const PointsRow({
    Key? key,
    required this.title1,
    required this.title2,
  }) : super(key: key);

  final String title1;
  final String title2;

  @override
  Widget build(BuildContext context) {
    return Row(
      //main row
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Flexible(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50.0,
                    child: Center(
                      child: Image.asset('icons/icono_puntos_ve.png'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(child: Text(title1))
                ],
              ),
            ],
          ),
        ),
        SizedBox(
          width: 20,
        ),
        Flexible(
          child: Column(
            children: [
              Row(
                children: [
                  Container(
                    width: 50.0,
                    child: Center(
                      child: Image.asset('icons/icono_premios_ve.png'),
                    ),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Flexible(child: Text(title2)),
                ],
              ),
            ],
          ),
        ),
      ],
    );
  }
}

class Mobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // key: _drawerKey,
      appBar: MainAppBarWidget(),
      // drawer: MainDrawerWidget(),
      body: ListView(
        children: [
          Image.asset('img/banner_ve.png'),
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Container(
                  padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
                  child: Text(
                    'Ventajas del plan Viajero Expreso:',
                    style: TextStyle(
                        color: Color(0xFF001A72),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(bottom: 20.0),
                  child: Row(
                    children: [
                      Container(
                        width: 50.0,
                        child: Center(
                          child: Image.asset('icons/icono_puntos_ve.png'),
                        ),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.7,
                        padding: EdgeInsets.only(left: 16.0),
                        child: Text(
                          'Acumula puntos de Viajero Expreso con cada tiquete que compres.',
                          style: TextStyle(color: Color(0xFF6E768E)),
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  children: [
                    Container(
                      width: 50.0,
                      child: Center(
                        child: Image.asset('icons/icono_premios_ve.png'),
                      ),
                    ),
                    Container(
                      width: MediaQuery.of(context).size.width * 0.7,
                      padding: EdgeInsets.only(left: 16.0),
                      child: Text(
                        'Los puntos acumulados podrán ser redimidos por tiquetes de viajes o productos de nuestro catalogo.',
                        style: TextStyle(color: Color(0xFF6E768E)),
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: EdgeInsets.only(top: 30.0),
                  child: CustomButtonBlue(
                    title: 'Registrate',
                    onTap: () {},
                  ),
                ),
                Container(
                  padding: EdgeInsets.only(top: 30.0),
                  child: Text(
                    'Si ya tienes una cuenta creada en nuestro portal puedes acceder a traves del botón “Ingresa a tu cuenta” que se encuentra a continuación, recuerda que para ingresar debes tener tu número de documento o Cédula de ciudadanía y tu clave secreta.',
                    style: TextStyle(color: Color(0xFF6E768E)),
                  ),
                ),
                Padding(
                    padding: EdgeInsets.only(top: 30.0),
                    child: CustomButtonBlue(
                        onTap: () {}, title: 'Ingresa a tu cuenta')),
                Container(
                  padding: EdgeInsets.only(bottom: 30.0, top: 30.0),
                  child: Text(
                    'Porcentaje de acumulación',
                    style: TextStyle(
                        color: Color(0xFF001A72),
                        fontSize: 18.0,
                        fontWeight: FontWeight.bold),
                  ),
                ),
                Container(
                  alignment: Alignment.center,
                  padding: EdgeInsets.only(bottom: 30.0),
                  child: Image.asset('img/porcentaje_acumulacion_ve.png'),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}

class CustomButtonBlue extends StatelessWidget {
  final String title;
  final VoidCallback onTap;

  const CustomButtonBlue({Key? key, required this.onTap, required this.title})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        width: MediaQuery.of(context).size.width,
        padding: EdgeInsets.symmetric(
          vertical: 12.0,
        ),
        decoration: BoxDecoration(
          color: Color(0xFF001A72),
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
        child: Text(
          title,
          textAlign: TextAlign.center,
          style: TextStyle(color: Colors.white, fontSize: 16.0),
        ),
      ),
    );
  }
}

//constants


