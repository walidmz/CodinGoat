import 'package:flutter/material.dart';

class CategoryElement extends StatelessWidget {
  const CategoryElement({super.key,required this.catImage ,required this.catTitle});

  final String catImage;
  final String catTitle;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
              onTap: () {
                // Handle the tap event
                print('$catTitle clicked');
              },
              child: Column(
                children: [ 
                  Container(
                    width: 60, // Slightly larger than the image to accommodate the border
                    height: 60,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      border: Border.all(
                        color: Color.fromARGB(255, 32, 32, 79), 
                        width: 1.0,
                      ), // Customize border color and width
                    ),
                    child: ClipOval(
                      child: Image.asset(
                        catImage,
                        fit: BoxFit.cover,
                      ),
                      
                    ),
                  ),
                  Text(
                    catTitle,
                    style: TextStyle(fontWeight: FontWeight.w100),
                  )
                ],
              ),
            );
  }
}