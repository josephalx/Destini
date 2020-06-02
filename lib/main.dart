import 'package:flutter/material.dart';
import 'storybrain.dart';

void main() {
  runApp(
    MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: StoryPage(),
        ),
      ),
    ),
  );
}

class StoryPage extends StatefulWidget {
  @override
  _StoryPageState createState() => _StoryPageState();
}

class _StoryPageState extends State<StoryPage> {
  StoryBrain str = new StoryBrain();
  

  @override
  Widget build(BuildContext context) {
    Text txt(int choice)
      {
        if(choice==1)
        {
          return Text(str.getchoice1(),
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            );
        }
        else{
          return Text(str.getchoice2(),
              style: TextStyle(color: Colors.white, fontSize: 20.0),
            );
        }
      }
     
    Expanded button(Color clr, int choice) {
      return Expanded(
        flex: 2,
        child: Visibility(
          visible: str.vis(choice),
                  child: FlatButton(
            color: clr,
            onPressed: () {
              setState(() {
                str.nextStory(choice);
              });
            },
            child: Center(
              child: txt(choice)
            ),
          ),
        ),
      );
    }
      
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage('images/bg.png'),
          fit: BoxFit.cover,
        ),
      ),
      padding: EdgeInsets.symmetric(vertical: 50.0, horizontal: 20.0),
      constraints: BoxConstraints.expand(),
      child: Column(children: <Widget>[
        Expanded(
          flex: 12,
          child: Center(
            child: Text(
              str.getStory(),
              style: TextStyle(color: Colors.white, fontSize: 28.0),
            ),
          ),
        ),
        button(Colors.cyan[300], 1),
        SizedBox(
          height: 20.0,
        ),
        button(Colors.green, 2),
      ]),
    );
  }
}
