import 'package:flutter/material.dart';

class MainAppBarWidget extends StatefulWidget implements PreferredSizeWidget {
  // final Function onPressedMenu;

  @override
  Size get preferredSize => Size.fromHeight(74.0);

  @override
  _MainAppBarWidgetState createState() => _MainAppBarWidgetState();
}

class _MainAppBarWidgetState extends State<MainAppBarWidget> {
  @override
  Widget build(BuildContext context) {
    return AppBar(
      elevation: 0.0,
      backgroundColor: Colors.white,
      titleSpacing: 0.0,
      toolbarHeight: 74.0,
      automaticallyImplyLeading: false,
      title: Container(
        child: Column(
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    width: MediaQuery.of(context).size.width * 0.48,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFF8C300),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.26,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: Color(0xFF001A72),
                    ),
                  ),
                  Container(
                    width: MediaQuery.of(context).size.width * 0.26,
                    height: 12.0,
                    decoration: BoxDecoration(
                      color: Color(0xFFDA291C),
                    ),
                  ),
                ],
              ),
            ),
            Container(
              width: MediaQuery.of(context).size.width,
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 5.0),
              decoration: BoxDecoration(
                border: Border(
                    bottom: BorderSide(color: Color(0xFFDA291C), width: 1.0)),
              ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Image.asset(
                    'img/main_logo.png',
                    width: 150.0,
                  ),
                  InkWell(
                    // onTap: widget.onPressedMenu,
                    child: Image.asset('icons/menu_icon.png'),
                  )
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
