import 'package:flutter/material.dart';
import 'package:screens/screenfive.dart';
import 'package:screens/screenfour.dart';
import 'package:screens/screenone.dart';
import 'package:screens/screenthree.dart';
import 'package:screens/scrrentwo.dart';

class Screens extends StatefulWidget{
  const Screens({super.key});

  @override
  State<Screens> createState() => _ScreensState();
}

class _ScreensState extends State<Screens>{

  final List<String> screenTitles = ['Screen 1', 'Screen 2', 'Screen 3', 'Screen 4', 'Screen 5'];

  void navigatePage(BuildContext context, String screen){
    switch(screen){
      case 'Screen 1':
        Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Screenone())
        );
        break;

      case 'Screen 2':
        Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Screentwo())
        );
        break;

      case 'Screen 3':
        Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Screenthree())
        );
        break;

      case 'Screen 4':
        Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Screenfour())
        );
        break;

      case 'Screen 5':
        Navigator.push(
          context, MaterialPageRoute(builder: (ctx) => Screenfive())
        );
        break;

      default:
        break;
    }
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      appBar: AppBar(
        title: Text('Welcome')
      ),
      body: Container(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        color: Colors.blue[100],
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: screenTitles.map((screen) {
            return Padding(
              padding: const EdgeInsets.all(8),
              child: ElevatedButton(
                onPressed: () => navigatePage(context, screen), 
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.green,
                  foregroundColor: Colors.white
                ),
                child: Text(screen),
              ),
            );
          }).toList(),
        )
      )
    );
  }
}

// Align(
//   alignment: Alignment.center,
//   child: ListView.builder(
//     itemCount: screenTitles.length,
//     itemBuilder: (BuildContext ctx, int index){
//       String title = screenTitles[index];
//       return Padding(
//         padding: const EdgeInsets.all(8),
//         child: ElevatedButton(
//           onPressed: (){}, 
//           child: Text(title)
//         ),
//       );
//     },
//   ),
// ),