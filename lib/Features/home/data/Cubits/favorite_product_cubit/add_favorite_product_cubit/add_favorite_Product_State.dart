class AddFavoriteProductsStates {}

class AddToFavoriteProductsSucessState extends AddFavoriteProductsStates {}

class AddToFavoriteProductsFiledState extends AddFavoriteProductsStates {
  final String errorMessage;

  AddToFavoriteProductsFiledState({required this.errorMessage});
}

class AddToFavoriteProductsIsloadingState extends AddFavoriteProductsStates {}
