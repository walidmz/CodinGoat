import 'package:CodinGoat_flutter/src/utils/ImagePaths.dart';
import 'package:CodinGoat_flutter/utils/constants.dart';

 const String CategoryImage = "image";
 const String CategoryTitle = "title";

class CategoriesMap {

  final categories = [
      {CategoryImage: Imagepaths.MobileCategoryImageAsset, CategoryTitle: StringConstants.MobilesTitle},
      {CategoryImage: Imagepaths.CarCategoryImageAsset, CategoryTitle: StringConstants.CarsTitle},
      {CategoryImage: Imagepaths.ShoesCategoryImageAsset, CategoryTitle: StringConstants.ShoesTitle},
      {CategoryImage: Imagepaths.bikesCategoryImageAsset, CategoryTitle: StringConstants.BikesTitle},
      {CategoryImage: Imagepaths.PropertiesCategoryImageAsset, CategoryTitle: StringConstants.PropertiesTiltle},
    ];
}