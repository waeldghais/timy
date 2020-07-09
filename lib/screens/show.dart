import 'package:TimyTimeMain/screens/detail-screen.dart';
import 'package:flutter/material.dart';


// ignore: must_be_immutable
class ShowsList extends StatelessWidget {
  final String name;
  var  product;
  ShowsList({this.name,this.product});
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 218,
      width: double.infinity,
      child: Stack(
        children: <Widget>[
          Positioned(
            top: 5,
            left: 20,
            child: Text(
              name,
              style: TextStyle(
                  color: Colors.white,
                  fontWeight: FontWeight.bold,
                  fontSize: 20),
            ),
          ),
          Padding(
            padding:  EdgeInsets.only(top:30.0,left: 10),
            child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: product.length,
                itemBuilder: (context,i){
                  return Padding(
                    padding: EdgeInsets.all(5),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.of(context)
                            .push(MaterialPageRoute(builder: (context) {
                          return DetailScreen(product[i].id);
                        }));
                      },
                      child: Container(
                        height: 180,width: 130,
                        child: Image.network(product[i].showsCoverLink, fit: BoxFit.fill,height: 170,width: 130,),
                      ),
                    ),
                  );}
            ),
          )
        ],
      ),
    );
  }
}
