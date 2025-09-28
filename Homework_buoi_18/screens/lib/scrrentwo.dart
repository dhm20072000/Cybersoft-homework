import 'package:flutter/material.dart';

class Screentwo extends StatelessWidget{
  const Screentwo({super.key});

  @override
  Widget build(BuildContext context){

    String imageURL = '';
    Widget getWidget(String imageName){
      if(imageName == 'Fruit'){
        imageURL = 'assets/images/orange.png';
      }
      else if(imageName == 'Vegetable'){
        imageURL = 'assets/images/lettuce.png';
      }
      else if(imageName == 'Cookies'){
        imageURL = 'assets/images/donut.png';
      }
      else if(imageName == 'Meat'){
        imageURL = 'assets/images/meat.png';
      }

      return 
      Container(
        decoration: BoxDecoration(
          color: Colors.white, 
          borderRadius: BorderRadius.all(Radius.circular(20))
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset(
              imageURL,
              height: 100,
              width: 100,
            ),
            const SizedBox(height: 2),
            Text(
              imageName,
              style: TextStyle(
                fontSize: 18,
                fontWeight: FontWeight.w500
              ),
            )
          ],
        ),
      );
    }

    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 2')
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Your balance',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        '\$1,700.00',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 22
                        ),
                      )
                    ],
                  ),
                  CircleAvatar(
                    backgroundColor: Colors.green,
                  )
                ],
              ),
              const SizedBox(height: 20),
              Container(
                height: 220,
                width: double.infinity,
                padding: EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.green,
                  borderRadius: BorderRadius.all(Radius.circular(20))
                ),
                child: const Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(height: 100),
                    Text(
                      'Buy Orange 10 Kg',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      'Get discount 25%',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                        fontWeight: FontWeight.bold
                      ),
                    )
                  ],
                )
              ),
              const SizedBox(height: 30),
              Text(
                'For you',
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold
                )
              ),
              const SizedBox(height: 20),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 2,
                  mainAxisSpacing: 20,
                  crossAxisSpacing: 20,
                  children: [
                    getWidget('Fruit'),
                    getWidget('Vegetable'),
                    getWidget('Cookies'),
                    getWidget('Meat')
                  ],
                ),
              ),
            ],
          ),
        ),
      )
    );
  }
}