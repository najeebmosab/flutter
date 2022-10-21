import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class DataWidget extends StatelessWidget
{
  final String label;
  final int value;
  final Function onAdd;
  final Function onRemove;
  const DataWidget(this.value,this.label,this.onRemove, this.onAdd,{Key?key}):super(key: key);
  
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Color(0xff1e152f),
        borderRadius: BorderRadius.circular(10)
      ),
      child: Column(
        mainAxisAlignment:MainAxisAlignment.center,
        children: [
          Text("$label",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Text("$value",style: TextStyle(color: Colors.white,fontSize: 20,fontWeight: FontWeight.bold),),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              FloatingActionButton(mini: true,onPressed: ()=>onRemove() ,child: Icon(Icons.remove)),
              SizedBox(width: 10,),
              FloatingActionButton(mini: true,onPressed:()=>onAdd(),child: Icon(Icons.add)),
            ],
          )
        ],
      ),
    );
  }

}
