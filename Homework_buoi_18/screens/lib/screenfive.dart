import 'package:flutter/material.dart';

class Screenfive extends StatelessWidget{
  const Screenfive({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 5'),
      ),
      body: Center(
        child: Padding(
          padding: EdgeInsets.only(left: 30, right: 30),
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                mainAxisSize: MainAxisSize.max,
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Welcome back',
                        style: TextStyle(
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      SizedBox(height: 2),
                      Text(
                        'Samantha William',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 24
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: [
                      const Icon(
                        Icons.shopping_cart_outlined,
                        size: 35,
                      ),
                      Positioned(
                        top: 0,
                        right: 0,
                        child: Container(
                          height: 16,
                          width: 16,
                          decoration: const BoxDecoration(
                            color: Colors.red,
                            borderRadius: BorderRadius.all(Radius.circular(8))
                          ),
                          child: Text(
                            '1',
                            textAlign: TextAlign.center,
                          ),
                        ),
                      )
                    ],
                  )
                ],
              ),
              SizedBox(height: 15),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 50,
                      width: double.infinity,
                      padding: EdgeInsets.all(10),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 233, 231, 231),
                        borderRadius: BorderRadius.all(Radius.circular(12))
                      ),
                      child: Row( 
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.search,
                            size: 25,
                            color: const Color.fromARGB(255, 204, 194, 194)
                          ),
                          SizedBox(width: 10),
                          Text(
                            'Searching item',
                            style: TextStyle(
                              color: const Color.fromARGB(255, 204, 194, 194),
                              fontSize: 15
                            )
                          )
                        ]
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Container(
                    height: 50,
                    width: 50,
                    decoration: BoxDecoration(
                      color: Colors.orange,
                      borderRadius: BorderRadius.all(Radius.circular(12))
                    ),
                    child: Icon(
                      Icons.menu,
                      size: 30,
                      color: Colors.white
                    ),
                  )
                ],
              ),
              SizedBox(height: 15),
              Card(
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(15))
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      Image.asset(
                        'assets/images/lamp.jpg',
                        fit: BoxFit.fill,
                        height: 160,
                      )
                    ],
                  ),
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(
                    Icons.linear_scale,
                    size: 50
                  )
                ],
              ),
              SizedBox(height: 10),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, right: 30),
                  child: GridView.count(
                    crossAxisCount: 4,
                    crossAxisSpacing: 20,
                    childAspectRatio: 0.5,
                    children: [
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 236, 236),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(
                              Icons.music_video,
                              size: 30,
                              color: const Color.fromARGB(255, 86, 153, 207)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Music',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 236, 236),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(
                              Icons.house,
                              size: 30,
                              color: const Color.fromARGB(255, 86, 153, 207)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Property',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 236, 236),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(
                              Icons.gamepad,
                              size: 30,
                              color: const Color.fromARGB(255, 86, 153, 207)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Game',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 236, 236),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(
                              Icons.note_add_rounded,
                              size: 30,
                              color: const Color.fromARGB(255, 86, 153, 207)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Gadget',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 236, 236),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(
                              Icons.music_video,
                              size: 30,
                              color: const Color.fromARGB(255, 86, 153, 207)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Music',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 236, 236),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(
                              Icons.house,
                              size: 30,
                              color: const Color.fromARGB(255, 86, 153, 207)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Property',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 236, 236),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(
                              Icons.gamepad,
                              size: 30,
                              color: const Color.fromARGB(255, 86, 153, 207)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Game',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      ),
                      Column(
                        children: [
                          Container(
                            height: 60,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 247, 236, 236),
                              borderRadius: BorderRadius.all(Radius.circular(20))
                            ),
                            child: Icon(
                              Icons.note_add_rounded,
                              size: 30,
                              color: const Color.fromARGB(255, 86, 153, 207)
                            ),
                          ),
                          SizedBox(height: 10),
                          Text(
                            'Gadget',
                            style: TextStyle(
                              fontWeight: FontWeight.bold
                            ),
                          )
                        ],
                      )
                    ],
                  ),
                ),
              ),
              SizedBox(height: 10),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Best Seller',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold
                    )
                  ),
                  Text(
                    'See All',
                    style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.bold,
                      color: Colors.orange
                    )
                  )
                ],
              ),
              Expanded(
                child: GridView.count(
                  crossAxisCount: 3,
                  crossAxisSpacing: 5,
                  childAspectRatio: 0.5,
                  children: [
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              'assets/images/lamp.jpg',
                              fit: BoxFit.fill,
                              height: 100,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Lamb',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              'assets/images/car.jpg',
                              fit: BoxFit.fill,
                              height: 100,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Car',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    Card(
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.all(Radius.circular(15))
                      ),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(15.0),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            Image.asset(
                              'assets/images/plant.jpg',
                              fit: BoxFit.fill,
                              height: 100,
                            ),
                            Container(
                              padding: EdgeInsets.all(10),
                              child: Text(
                                'Plant',
                                style: TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 15
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                  ]
                ),
              ),
            ],
          )
        ),
      )
    );
  }
}