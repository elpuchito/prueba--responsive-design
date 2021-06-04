import 'package:flutter/material.dart';

class WikenCard extends StatelessWidget {
  const WikenCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Column(
            children: [
              Flexible(
                child: Container(
                  color: Colors.indigo[900],
                ),
              ),
              Flexible(
                flex: 3,
                child: Container(color: Colors.white),
              ),
            ],
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              ListTile(
                leading:
                    Icon(Icons.arrow_back_ios_new_rounded, color: Colors.white),
                title: Text('Wiken Card',
                    textAlign: TextAlign.center,
                    style: TextStyle(color: Colors.white, fontSize: 15)),
              ),
              Divider(
                color: Colors.white,
                thickness: 1.0,
              ),
              //user tile

              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(Icons.account_circle_rounded, size: 50),
                  SizedBox(
                    width: 20,
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      //litle text
                      Text('Francisco Castro',
                          style: TextStyle(color: Colors.white, fontSize: 20)),

                      Text('Suscriptor Estandar',
                          style: TextStyle(color: Colors.white, fontSize: 12)),
                    ],
                  )
                ],
              ),
              SizedBox(height: 20),
              //first card
              Flexible(
                  child: FittedBox(
                child: Card(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(15.0),
                  ),
                  elevation: 10,
                  margin: EdgeInsets.symmetric(horizontal: 20),
                  //mainColumn
                  child: Padding(
                    padding: const EdgeInsets.all(30.0),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            Icon(Icons.account_balance_rounded, size: 50),
                            SizedBox(
                              width: 20,
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                //litle text
                                Text('El saldo de tu tarjeta regalo'),

                                Text('50.000',
                                    style: TextStyle(
                                        color: Colors.blue, fontSize: 40)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            //blue rounded container
                            CustomBlueButton(
                              title: 'Comprar/Recargar',
                              icon: Icons.monetization_on_outlined,
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                ),
              )),
              //second card
              Flexible(
                flex: 1,
                child: FittedBox(
                  child: Card(
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(15.0),
                    ),
                    elevation: 10,
                    margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                    //mainColumn
                    child: Padding(
                      padding: const EdgeInsets.all(30.0),
                      child: Column(
                        children: [
                          Text('Movimiento de Saldo'),
                          SizedBox(
                            height: 20,
                          ),
                          //blue border container
                          Container(
                            padding: EdgeInsets.all(12),
                            decoration: BoxDecoration(
                                border: Border.all(
                                  color: Colors.blue[100]!,
                                ),
                                borderRadius: BorderRadius.circular(
                                    20) // use instead of BorderRadius.all(Radius.circular(20))
                                ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Fecha'),
                                    Text('15 de marzo'),
                                    Text('13 de marzo'),
                                    Text('12 de marzo'),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  children: [
                                    Text('Valor'),
                                    Text('\$ 100.000'),
                                    Text('\$ 15.600'),
                                    Text('\$ 18.000'),
                                  ],
                                ),
                              ],
                            ),
                          ),
                          SizedBox(
                            height: 20,
                          ),

                          CustomBlueButton(
                            title: 'Ver Movimientos',
                            icon: Icons.menu_rounded,
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class CustomBlueButton extends StatelessWidget {
  final String title;
  final IconData icon;

  const CustomBlueButton({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
          color: Colors.blue[100],
          borderRadius: BorderRadius.circular(20.0),
        ),
        child: Container(
          margin: EdgeInsets.all(10),
          width: 200,
          height: 40,
          child: Row(
            //icon and button
            children: [
              Icon(icon, color: Colors.indigo[900]),
              SizedBox(width: 10),
              ElevatedButton(
                onPressed: () {},
                child: Text(title),
                style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: 18,
                      horizontal: 15,
                    ),
                    elevation: 0,
                    primary: Colors.white,
                    shape: StadiumBorder()),
              )
            ],
          ),
        ));
  }
}

//Icons.monetization_on_outlined
//'Comprar/Recargar'