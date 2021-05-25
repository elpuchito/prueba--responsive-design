import 'package:flutter/material.dart';
import 'package:prueba/widgets/custom_checkox.dart';
import 'package:prueba/widgets/custom_dropdown.dart';
import 'package:prueba/widgets/little_box.dart';
import 'package:responsive_builder/responsive_builder.dart';

var depas = ['Antioquia', 'Cundinamarca', 'Santander'];
var cities = ['Bogota', 'Bucaramanga', 'Cali'];

class App extends StatefulWidget {
  @override
  _AppState createState() => _AppState();
}

class _AppState extends State<App> {
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

class Mobile extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://assets.website-files.com/5e832e12eb7ca02ee9064d42/5f7db426b676b95755fb2844_Group%20805.jpg'))),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Flexible(
                flex: 3,
                child: Container(),
              ),
              Flexible(
                flex: 1,
                child: CustomBar(),
              ),
            ],
          ),
          Positioned.fill(
            top: 10,
            left: 10,
            child: Align(
                alignment: Alignment.topCenter,
                child: Row(
                  children: [
                    AgenciasCheckBox(),
                    SizedBox(
                      width: 8,
                    ),
                    PuntosDeVentaCheckbox(),
                  ],
                )),
          ),
        ],
      ),
    );
  }
}

class Desktop extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
                image: DecorationImage(
                    fit: BoxFit.cover,
                    image: NetworkImage(
                        'https://assets.website-files.com/5e832e12eb7ca02ee9064d42/5f7db426b676b95755fb2844_Group%20805.jpg'))),
          ),
          Positioned.fill(
            top: 10,
            child: Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: 50,
                width: MediaQuery.of(context).size.width * 0.95,
                child: CustomBar(),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class CustomBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      // padding: EdgeInsets.symmetric(horizontal: 8),
      decoration: BoxDecoration(
        color: Colors.amber,
        borderRadius: BorderRadius.only(
          topLeft: getValueForScreenType(
              context: context,
              mobile: Radius.circular(10),
              desktop: Radius.circular(5)),
          topRight: getValueForScreenType(
              context: context,
              mobile: Radius.circular(10),
              desktop: Radius.circular(5)),
          bottomLeft: getValueForScreenType(
              context: context,
              mobile: Radius.circular(0),
              desktop: Radius.circular(5)),
          bottomRight: getValueForScreenType(
              context: context,
              mobile: Radius.circular(0),
              desktop: Radius.circular(5)),
        ),
      ),
      child: getValueForScreenType<bool>(
        context: context,
        mobile: false,
        tablet: false,
        desktop: true,
      )
          ? RowDesktopBar()
          : MobileBar(),
    );
  }
}

class MobileBar extends StatelessWidget {
  const MobileBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          // SizedBox(
          //   height: 12,
          // ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [Text('Agencias y sitios de interes en:')],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDropDownMenu(
                initialValue: 'Antioquia',
                items: depas,
              ),
            ],
          ),
          SizedBox(
            height: 8,
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              CustomDropDownMenu(
                initialValue: 'Bogota',
                items: cities,
              ),
            ],
          )
        ],
      ),
    );
  }
}

class RowDesktopBar extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 8),
      child: Row(children: [
        Flexible(
            flex: 2,
            child: Row(
              children: [
                Text(
                  'Agencias y sitios de interes en:',
                ),
                SizedBox(
                  width: 20,
                ),
                CustomDropDownMenu(
                  initialValue: 'Antioquia',
                  items: depas,
                ),
                SizedBox(
                  width: 8,
                ),
                CustomDropDownMenu(
                  initialValue: 'Bogota',
                  items: cities,
                ),
              ],
            )),

        Flexible(
          flex: 1,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              // Flexible(
              //   child: SizedBox(
              //     width: 60,
              //   ),
              // ),
              AgenciasCheckBox(),
              SizedBox(
                width: 8,
              ),
              PuntosDeVentaCheckbox(),
              SizedBox(
                width: 8,
              ),
              getValueForScreenType<bool>(
                context: context,
                mobile: false,
                tablet: true,
              )
                  ? LittleSquare()
                  : Container()
            ],
          ),
        ),
        // CityDropDownMenu()
      ]),
    );
  }
}

class PuntosDeVentaCheckbox extends StatelessWidget {
  const PuntosDeVentaCheckbox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCheck2(title: 'Puntos de Venta');
  }
}

class AgenciasCheckBox extends StatelessWidget {
  const AgenciasCheckBox({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CustomCheck2(title: 'Agencias');
  }
}
