import 'package:flutter/material.dart';

class FeaturedWidget extends StatefulWidget {
  const FeaturedWidget({Key? key,});

  @override
  State<FeaturedWidget> createState() => _FeaturedWidgetState();
}

class _FeaturedWidgetState extends State<FeaturedWidget> {
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              Text(
                'Featured',
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 25,
                ),
              ),
              Padding(
                padding: EdgeInsets.only(left: 10),
                child: Text(
                  '+10',
                  style: TextStyle(
                    color: Colors.grey,
                    fontSize: 15,
                  ),
                ),
              ),
              SizedBox(width: 75,),
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
              _buildFeatureCard(image: 'assets/images/car.jpg',productName: 'Audi Rs6',productPrice: 'Rs 790,599'),
              _buildFeatureCard(image: 'assets/images/property.jpg',productName: 'Ville Luxe',productPrice: 'Rs 3,790,599'),
              // Add more _buildFeatureCard widgets for additional images
            ],
          ),
        ),
      ],
    );
  }

Widget _buildFeatureCard({required String image, required String productName, required String productPrice}) {
    return FeatureCard(image: image, productName: productName, productPrice: productPrice);
  }
  }
  class FeatureCard extends StatefulWidget {
    const FeatureCard({Key? key, required this.image, required this.productName, required this.productPrice}) : super(key: key);

  final String image;
  final String productName;
  final String productPrice;

  @override
  _FeatureCardState createState() => _FeatureCardState();
  }

  class _FeatureCardState extends State<FeatureCard> {
    bool isFavorite = false ;

    void _toggleFavorite() {
    setState(() {
      isFavorite = !isFavorite;
    });
  }

  @override
  Widget build(BuildContext context) {
return Padding(
      padding: const EdgeInsets.only(right: 10),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Stack(
            children: [
              Container(
                width: 180,
                height: 150,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  image: DecorationImage(
                    image: AssetImage(widget.image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Positioned(
                bottom: 10,
                left: 10,
                child: Container(
                  width: 80,
                  height: 20,
                  decoration: BoxDecoration(
                    color: Colors.amber.withOpacity(0.9),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Center(
                    child: Text(
                      'Featured',
                      style: TextStyle(fontWeight: FontWeight.w500),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: 10,
                right: 10,
                child: GestureDetector(
                  onTap: _toggleFavorite,
                  child: Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.withOpacity(0.5),
                    ),
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      isFavorite ? Icons.favorite_rounded : Icons.favorite_border_outlined,
                      color: isFavorite? Colors.red : Colors.white,
                      size: 20,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: EdgeInsets.only(left: 20),
            child: Column(
              children: [
                Text(
                  widget.productName,
                  style: TextStyle(fontFamily: 'Quicksand'),
                ),
                Text(
                  widget.productPrice,
                  style: TextStyle(
                    fontFamily: 'Quicksand',
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Text(
                        'new',
                        style: TextStyle(backgroundColor: Colors.grey[300]),
                      ),
                    ),
                    SizedBox(width: 8,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(20),
                      child: Text(
                        '10/10',
                        style: TextStyle(backgroundColor: Colors.grey[300]),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }    
  }
