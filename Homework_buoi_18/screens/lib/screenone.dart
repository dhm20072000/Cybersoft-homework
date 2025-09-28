import 'package:flutter/material.dart';

class Screenone extends StatelessWidget{
  const Screenone({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Screen 1')
      ),
      body: Column(
        children: [
          Container(
            height: (MediaQuery.of(context).size.height) * 0.48,
            decoration: const BoxDecoration(
              color: Colors.green,
              borderRadius: BorderRadius.only(
                bottomLeft: Radius.elliptical(300, 20), 
                bottomRight: Radius.elliptical(300, 20)
              )
            ),
          ),
          SizedBox(height: (MediaQuery.of(context).size.height) * 0.06),
          SizedBox(
            width: (MediaQuery.of(context).size.width) * 0.7,
            child: const Text(
              'Complete your grocery need easily',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 40,
                height: 1
              ),
              textAlign: TextAlign.center,
            ),
          ),
          SizedBox(height: (MediaQuery.of(context).size.height) * 0.08),
          Center(
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.green,
                foregroundColor: Colors.white,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(12)
                )
              ),
              onPressed: (){}, 
              child: const Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text('Get Started'),
                  SizedBox(width: 10),
                  Icon(
                    Icons.arrow_right_alt,
                    size: 30,
                  )
                ],
              )
            ),
          )
        ]
      ),
    );
  }
}

// child: FractionallySizedBox(
//   heightFactor: 0.6,
//   alignment: Alignment.topLeft,
//   child: Container(
//     decoration: BoxDecoration(
//       color: Colors.green,
//       borderRadius: BorderRadius.only(bottomLeft: Radius.circular(0.5), bottomRight: Radius.circular(0.5))
//     ),
//   ),
// ),