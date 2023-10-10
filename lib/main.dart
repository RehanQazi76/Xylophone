import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        
        primarySwatch: Colors.grey,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage();

  

   

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  
  void plays(int digi) async{
    final player =AudioPlayer();
    await  player.play(AssetSource('note$digi.wav'),volume: 10); 
  }
  Widget keys(int digit,Color col){
    return Expanded(
              child: ElevatedButton(onPressed: ()  {
                plays(digit);
              }, 
              style: ButtonStyle(backgroundColor:MaterialStatePropertyAll<Color>(col),
              fixedSize: MaterialStatePropertyAll<Size>(Size(300, 50))),
              child: Text("",),
              ),
            );
  }

  @override
  Widget build(BuildContext context) {
   
    return Scaffold(
      appBar: AppBar(
       
        title: Center(
          child: Text("XYLOPHONE",
          style: TextStyle(
            fontFamily: "TimesNewRoman",
            
          ),),
        ),
      ),
      body: Center(
        child: Column(
         crossAxisAlignment: CrossAxisAlignment.stretch,
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            keys(1,Colors.red),
            keys(2,Colors.orange),
            keys(3,Colors.black),
            keys(4,Colors.blue),
            keys(5,Colors.yellow),
            keys(6,Colors.green),
            keys(7,Colors.cyan),
          ],
        ),
      ),
      
    );
  }
}
