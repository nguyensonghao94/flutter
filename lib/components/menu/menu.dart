import 'package:flutter/material.dart';

class WMenu extends StatelessWidget {
  const WMenu({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: (
        Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
              color: Colors.blue,
              height: 150,
              width: 303,
              padding: const EdgeInsets.only(top: 45.0, left: 20),
              child: Row(                
                children: [
                  Container(
                    width: 64,
                    height: 64,
                    margin: const EdgeInsets.only(right: 15.0),
                    child: Image.network("https://www.easy-profile.com/support.html?controller=attachment&task=download&tmpl=component&id=2883"),
                  ),
                  Text("Nguyễn Song Hào", style: TextStyle(color: Colors.white, fontSize: 18)),
                ],
              )
            )
          ],
        )
      ),
    );
  }
}