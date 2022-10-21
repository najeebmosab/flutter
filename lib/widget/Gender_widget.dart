import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class GenderWidget extends StatelessWidget {

  final String gender;
  final IconData icon;
  final Color colorX;
  const GenderWidget(this.gender,this.icon, this.colorX,{Key? key}):super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color:colorX
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            icon,
            color: Colors.white,
            size: 50,
          ),
          SizedBox(
            height: 10,
          ),
          Text(
           "${gender}",
            style: TextStyle(
                color: Colors.white, fontWeight: FontWeight.bold, fontSize: 30),
          )
        ],
      ),
    );
  }
}
