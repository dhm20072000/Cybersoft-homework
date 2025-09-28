import 'package:flutter/material.dart';

class Screenthree extends StatelessWidget{
  const Screenthree({super.key});

  Widget getWidget(String text1, String text2, String text3){
    return 
      Container(
        height: 140,
        decoration: BoxDecoration(
          border: Border(
            bottom: BorderSide(
              color: const Color.fromARGB(255, 238, 235, 235),
              width: 1,
            )
          )
        ),
        child: Row(
          // mainAxisSize: MainAxisSize.max,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 80,
              width: 80,
              decoration: const BoxDecoration(
                color: Colors.green,
                borderRadius: BorderRadius.all(Radius.circular(10))
              ),
            ),
            SizedBox(width: 20),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  text1,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  )
                ),
                Text(
                  text2,
                  style: TextStyle(
                    color: const Color.fromARGB(255, 190, 186, 186)
                  )
                ),
                Text(
                  text3,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 22
                  )
                )
              ],
            ),
            Spacer(),
            Icon(
              Icons.favorite_border_outlined,
              size: 35,
            )
          ],
        ),
      );
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 3'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            // crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              getWidget('Orange', '1000 ready stock', '\$15'),
              getWidget('Apple', '1000 ready stock', '\$20'),
              getWidget('Banana', '1000 ready stock', '\$5'),
              getWidget('Mango', '1000 ready stock', '\$15'),
              getWidget('Orange', '1000 ready stock', '\$10'),
            ],
          )
        ),
      )
    );
  }
}