import 'package:flutter/material.dart';


class SustainabilityArticleBanner extends StatelessWidget {
  final String imagePath;
  const  SustainabilityArticleBanner({
    required this.imagePath,
    super.key});

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Container(
      color: Colors.white,
      child: Stack(
        children: [
          Positioned(
            top: 0,
            
            child: Container(
              height: size.height * 0.5,
              width: size.width,
              decoration: BoxDecoration(
                
                image: DecorationImage(
                    image: AssetImage(imagePath), fit: BoxFit.cover),
                    
              ),
              //child: Image.asset(imagePath, fit: BoxFit.cover),
            ),
          ),
          Container(
           
            height: 500,
          ),
          
          Positioned(
            top: 150,
            left: size.width/4,
            height: size.height * .5,
              width: size.width/2,
            child: Container(
              
            decoration: BoxDecoration(
              
              image: DecorationImage(
                  image: AssetImage(imagePath), fit: BoxFit.contain),
            ),
          ))
        ],
      ),
    );
  }
}