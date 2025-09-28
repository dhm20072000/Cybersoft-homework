import 'package:flutter/material.dart';

class Screenfour extends StatelessWidget{
  const Screenfour({super.key});

  @override
  Widget build(BuildContext context){

    Widget getWidget(String name){

      String capitalizedName = '${name[0].toUpperCase()}${name.substring(1)}';

      return Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(15))
        ),
        child: ClipRRect(
          borderRadius: BorderRadius.circular(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Image.asset(
                'assets/images/$name.jpg',
                fit: BoxFit.fill,
                height: 140,
              ),
              Container(
                padding: EdgeInsets.all(15),
                child: Text(
                  capitalizedName,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18
                  ),
                ),
              )
            ],
          ),
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Screen 4'),
      ),
      backgroundColor: const Color.fromARGB(255, 31, 61, 85),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.only(left: 30, right: 30),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(top: 30, bottom: 30),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Explore',
                          style: TextStyle(
                            fontWeight: FontWeight.w500,
                            fontSize: 30,
                            color: Color.fromARGB(255, 216, 213, 213)
                          ),
                        ),
                        SizedBox(height: 2),
                        Text(
                          'Find products easier here',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            fontSize: 14,
                            color: Color.fromARGB(255, 216, 213, 213)
                          ),
                        )
                      ],
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                        color: Colors.orange,
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                    ),
                  ],
                ),
              ),
              getWidget('lamp'),
              SizedBox(height: 20),
              getWidget('car'),
              SizedBox(height: 20),
              getWidget('plant'),
            ],
          ),
        ),
      )
    );
  }
}

