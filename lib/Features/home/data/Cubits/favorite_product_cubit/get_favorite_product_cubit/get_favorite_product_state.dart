import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';

class GetFavoriteProductsStates {}

class GetFavoriteProductsSucessState extends GetFavoriteProductsStates {
  final List<ProductModel> favoriteProductList;

  GetFavoriteProductsSucessState({required this.favoriteProductList});
}

class GetFavoriteProductsFiledState extends GetFavoriteProductsStates {
  final String errorMessage;

  GetFavoriteProductsFiledState({required this.errorMessage});
}

class GetFavoriteProductsIsloadingState extends GetFavoriteProductsStates {}
