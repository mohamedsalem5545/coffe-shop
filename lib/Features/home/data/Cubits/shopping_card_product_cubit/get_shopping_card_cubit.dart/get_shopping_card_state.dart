import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';

class GetShoppingCardProductsStates {}

class GetShoppingCardProductsSucessState extends GetShoppingCardProductsStates {
      final List<ProductModel> shoppingCardList;

  GetShoppingCardProductsSucessState({required this.shoppingCardList});

}

class GetShoppingCardProductsFiledState extends GetShoppingCardProductsStates {
  final String errorMessage;

  GetShoppingCardProductsFiledState({required this.errorMessage});
}

class GetShoppingCardProductsIsloadingState extends GetShoppingCardProductsStates {}
class CalTotalPriceState extends GetShoppingCardProductsStates{
 final int totalprice;

  CalTotalPriceState({required this.totalprice});
}
