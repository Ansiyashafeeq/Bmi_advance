import 'package:bmiadvance/result.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home:  Calc(),));
}
class Calc extends StatefulWidget {
  const Calc({Key? key}) : super(key: key);

  @override
  State<Calc> createState() => _CalcState();
}

class _CalcState extends State<Calc> {
  double svalue=0;
  double wvalue=0;
  double agev=0;
  @override
  Widget build(BuildContext context) {
    return Scaffold (
      appBar: AppBar(title: Text('BMI CALCULATOR',style: TextStyle(fontSize: 30,color: Colors.white,),
      ),centerTitle: true,backgroundColor: Colors.black54,),
      backgroundColor: Colors.black87,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [

           GridView.count(shrinkWrap:true,crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,
             children: [

               Container(
                 color: Colors.white10,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(Icons.male,color: Colors.white,size: 75,),
                    Text('male',style: TextStyle(color: Colors.white60,fontSize: 30),),
                  ],
                ),
               ),
               Container(
                 color: Colors.white10,
                 child: Column(
                   mainAxisAlignment: MainAxisAlignment.center,
                   children: [
                     Icon(Icons.female,color: Colors.white,size: 75,),
                     Text('female',style: TextStyle(color: Colors.white60,fontSize: 30),),
                   ],
                 ),
               ),
             ],

           ),
            Padding(
              padding: const EdgeInsets.all(15),
              child: Container(
                color: Colors.white10,
               child: Column(
                 children: [
                   Text('Height',style: TextStyle(color: Colors.white60,fontSize: 30)),
                   Text('${svalue.round()}.cm',style: TextStyle(color: Colors.white,fontSize: 40)),
                   Slider(max: 200,
                       min: 0,
                       divisions: 55,
                       value:svalue , activeColor: Colors.pinkAccent,
                       inactiveColor: Colors.blueGrey,onChanged: (value){
                     setState(
                         (){
                            svalue=value;
                         }
                     );
                   }),

                 ],
               ),
              ),
            ),
            GridView.count(shrinkWrap:true,crossAxisCount: 2,mainAxisSpacing: 10,crossAxisSpacing: 10,
              children: [

                Container(
                  color: Colors.white10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('weight',style: TextStyle(color: Colors.white60,fontSize: 24),),
                      Text('$wvalue',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(onPressed: (){
                            setState(
                                (){
                                 wvalue--;
                                }
                            );
                          },
                          child: Icon(Icons.remove,size: 30,),backgroundColor: Colors.white30,),
                          FloatingActionButton(onPressed: (){
                            setState(
                                (){
                                wvalue++;
                                }
                            );
                          },
                         child: Icon(Icons.add), backgroundColor: Colors.white30,),
                        ],
                      )
                    ],
                  ),
                ),
                Container(
                  color: Colors.white10,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [

                      Text('age',style: TextStyle(color: Colors.white60,fontSize: 24),),
                      Text('$agev',style: TextStyle(color: Colors.white,fontSize: 40,fontWeight: FontWeight.bold),),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          FloatingActionButton(onPressed: (){
                            setState(
                                (){
                                  agev--;
                                }
                            );
                          },
                          child: Icon(Icons.remove),backgroundColor: Colors.white30,),
                          FloatingActionButton(onPressed: (){
                           setState(
                               (){
                                 agev++;
                               }
                           );
                          },
                          child: Icon(Icons.add),
                          backgroundColor: Colors.white30,),
                        ],
                      ),
                    ],
                  ),
                ),
              ],

            ),
              SizedBox(height: 50,),
           Container(
             width: double.maxFinite,
             height: 60,

             child: ElevatedButton(onPressed: (){
               setState(
                   (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>Result(svalue,wvalue,agev)));
                   }
               );
             },
               style:ElevatedButton.styleFrom(primary: Colors.pink),child: Text(
               'calculate'
             ),),
           )

          ],

        ),
      ),
    );
  }
}

