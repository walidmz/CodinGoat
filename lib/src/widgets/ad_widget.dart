import 'package:flutter/material.dart';

class AdWidget extends StatelessWidget {
  const AdWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(top :20,left :40,bottom: 5),
      child: Container(
        height: 150,
        width: 500,
        alignment: Alignment.topRight,
        child: Stack(
          children: [
            Positioned(
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(20),
                  child: Container(
                    color: Colors.grey[200]!.withOpacity(.6),
                    height: 141,
                    width: 280,
                  ),
                ),
                top: 0,
                left: 0,                
                ),
            Positioned(
              child: ClipRRect(
                borderRadius:BorderRadius.circular(100) ,
                child: Container(
                  color: Colors.white,
                  child: Text(
                    '  Ad  ',
                    style: TextStyle(fontFamily:'Quicksand' , fontWeight: FontWeight.w700 ),),
                ),
                ),
                top: 10,
                left: 23,
              ),
            Positioned(
              child: Text('Nike',style: TextStyle(fontWeight: FontWeight.bold,fontSize: 30,fontFamily: 'OpenSans'),),
              left: 50,
              top: 40,
            ),
            Positioned(
              child: Text('Free Metcon',style: TextStyle(fontWeight: FontWeight.w700,fontSize: 20,fontFamily: 'OpenSans',color: Colors.grey.withOpacity(.7)),),
              left: 50,
              top: 77,
            ),
            Positioned(
              child: Text("\$120.99" ,style: TextStyle(fontWeight: FontWeight.w700 ,fontSize: 20,fontFamily: 'OpenSans'),),
              left: 50,
              top: 100,
            ),
            Positioned(
                child: Image.asset('assets/images/nike_shoe.png',width:150 ,),
                top: 0,
                right: 10,                
              )
          ],
        ),
      ),
    );
  }
}