class GetShoppingCardProductsStates {}

class GetShoppingCardProductsSucessState extends GetShoppingCardProductsStates {}

class GetShoppingCardProductsFiledState extends GetShoppingCardProductsStates {
  final String errorMessage;

  GetShoppingCardProductsFiledState({required this.errorMessage});
}

class GetShoppingCardProductsIsloadingState extends GetShoppingCardProductsStates {}
