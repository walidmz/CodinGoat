import 'package:CodinGoat_flutter/src/utils/CategoriesMap.dart';
import 'package:CodinGoat_flutter/src/utils/browse_categories_styles.dart';
import 'package:CodinGoat_flutter/src/widgets/category_element.dart';
import 'package:CodinGoat_flutter/utils/constants.dart';
import 'package:flutter/material.dart';

class BrowseCategories extends StatelessWidget {
  const BrowseCategories({super.key});

  @override
  Widget build(BuildContext context) {
    
final categoriesMap = CategoriesMap();

    return Padding
    (
      padding: EdgeInsets.only(left: 20),
      child: Column(
        children: [
          Row(
            children: [
      
              const Text(
                StringConstants.CategoriesTitle,
                style: BrowseCategoriesStyles.titleTextStyle,
              ),
              const Padding(
                padding: EdgeInsets.all(10),
                child: Text(
                  StringConstants.FeaturedNumber,
                  style: BrowseCategoriesStyles.countTextStyle,
                ),
              ),
              const Spacer(),
              TextButton(
                onPressed: () {  },
                child: const Text(
                  StringConstants.SeeMoreText,
                  style: BrowseCategoriesStyles.seeMoreTextStyle,
                ),
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children:categoriesMap.categories.map(
              (category) {
              return CategoryElement(
                catImage: category[CategoryImage]!,
                catTitle: category[CategoryTitle]!,
              );
            }
            ).toList(),
          ),
        ],
      ),
    );
  }
}
