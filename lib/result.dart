import 'package:bmiadvance/main.dart';
import 'package:flutter/material.dart';
class Result extends StatefulWidget {

  double slide;
  double wvalue ;
  double agevalue ;
  Result(this.slide,this.wvalue,this.agevalue);
  @override
  State<Result> createState() => _ResultState();
}

class _ResultState extends State<Result> {

  double answer=0;
  void initState (){
    super.initState();
    eq();
  }
  void eq(){
    setState(
            (){

          answer = widget.wvalue/(widget.slide)*(widget.slide);
        }
    );

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.only(top: 15,right: 200),
            child: Text('Result',style: TextStyle(fontSize: 45,
                fontWeight: FontWeight.bold,color: Colors.pink),),
          ),
          Padding(
            padding: const EdgeInsets.all(12),
            child: Container(
              height: 200,
              color: Colors.white12,
              child: Padding(
                padding: const EdgeInsets.all(40),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Column(
                      children: [

                        Text('BMI',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                        Text('${answer.round()}',style: TextStyle(fontSize: 35,color: Colors.white),),

                      ],
                    ),
                    Column(
                      children: [
                        Text('Height',style: TextStyle(color: Colors.white,fontSize: 25),),
                        Text('weight',style: TextStyle(color: Colors.white,fontSize: 25),),
                        Text('age',style: TextStyle(color: Colors.white,fontSize: 25),),

                      ],
                    ),
                    Column(
                      children: [
                        Text('${widget.slide.round()}',style: TextStyle(fontSize: 25,color: Colors.white),),
                        Text('${widget.wvalue.round()}',style: TextStyle(fontSize: 25,color: Colors.white),),
                        Text('${widget.agevalue.round()}',style: TextStyle(fontSize: 25,color: Colors.white),),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ),
          SizedBox(height: 40,),
          Container(
            width: double.maxFinite,
            height: 60,
            child: ElevatedButton(onPressed: (){
              Navigator.pushReplacement(context,MaterialPageRoute(builder: (context)=>Calc()) );
            }, child: Text('Calculate again ?'), style:ElevatedButton.styleFrom(primary: Colors.pink),),
          ),

        ],
      ),
    );
  }
}
