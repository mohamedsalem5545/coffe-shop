class GetFavoriteProductsStates {}

class GetFavoriteProductsSucessState extends GetFavoriteProductsStates {}

class GetFavoriteProductsFiledState extends GetFavoriteProductsStates {
  final String errorMessage;

  GetFavoriteProductsFiledState({required this.errorMessage});
}

class GetFavoriteProductsIsloadingState extends GetFavoriteProductsStates {}
