import 'package:flutter/material.dart';

class MobilesWidget extends StatelessWidget {
  const MobilesWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.only(left: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Mobile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 25,
                  ),
                ),
                Text(
                  '+100',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
                TextButton(
                  onPressed: () {},
                  child: Text(
                    'See more',
                    style: TextStyle(
                      decoration: TextDecoration.underline,
                      color: const Color.fromARGB(255, 86, 27, 97),
                    ),
                  ),
                ),
              ],
            ),
          ),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            padding: EdgeInsets.only(left: 20),
            child: Row(
              children: [
                _buildMobileCard(image: 'assets/images/mobile1.jpg'),
                _buildMobileCard(image: 'assets/images/mobile2.jpg'),
                // Add more _buildFeatureCard widgets for additional images
              ],
            ),
          ),
        ],
      ),
    );
  }
}



  Widget _buildMobileCard({required String image}) {
    return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [ 
          Stack(
          children: [
            Container(
              width: 180,
              height: 150 ,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                image: DecorationImage(
                  image: AssetImage(image),
                  fit: BoxFit.cover,
                ),
              ),
            ),
           
            Positioned(
              top: 10,
              right: 10,
              child: Container(
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  color: Colors.grey.withOpacity(0.5),
                ),
                child: Icon(
                  Icons.favorite_border_outlined,
                  color: Colors.white,
                  size: 20,
                ),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.only(left: 20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text('Samsung Galaxy s23',
                style: TextStyle(fontFamily: 'Quicksand'),
              ),
              Text('Rs 1.300.000',
                style: TextStyle(
                fontFamily: 'Quicksand',
                fontWeight: FontWeight.bold,
                ),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child : Text('Used',style:TextStyle(backgroundColor: Colors.grey[300]),)
                    ),
                    SizedBox(width: 8,),
                    ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child : Text('10/10',style:TextStyle(backgroundColor: Colors.grey[300]),)
                    )
          ],
        )
            ],
          ),
          ),
        
        

      ]
      ),
    );
  }
