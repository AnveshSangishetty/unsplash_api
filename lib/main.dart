import 'package:flutter/material.dart';
import 'package:unsplashh_api/Images.dart';

void main(){
  runApp(
      MaterialApp(home: MyApp())
  );
}

class MyApp extends StatefulWidget {
  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //4YpBBkbOfcRA5vItrp68bIkSeOE87UpPStlUMi3x1z4
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Unsplash Api"),),
      body: Container(
        padding: EdgeInsets.fromLTRB(50,200,50,0),
        child: Column(
          children: [
            Center(
              child: ElevatedButton(child: Text("Fetch images"),onPressed: (){
                Navigator.of(context).pushReplacement(MaterialPageRoute(builder: (context)=>images()));
              },),
            ),
            SizedBox(height: 20,),
            RichText(
              text: TextSpan(
                style: const TextStyle(
                fontSize: 14.0,
                color: Colors.black54,
              ),
              children: <TextSpan>[
                TextSpan(text: 'By :\n',style: TextStyle(color: Colors.black)),
                TextSpan(text: 'Anvesh Sangishetty\n', style:TextStyle(fontWeight: FontWeight.bold,color: Colors.black)),
                TextSpan(text: "Btech,IIT HYDERABAD\n"),
                TextSpan(text: "Email: ch19btech11023@iith.ac.in\n"),
                TextSpan(text: "Mobile no: 8688441987")
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
