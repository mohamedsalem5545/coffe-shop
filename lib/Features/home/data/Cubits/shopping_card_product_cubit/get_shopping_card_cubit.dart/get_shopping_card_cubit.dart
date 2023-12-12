import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_state.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetShoppingCardProducts extends Cubit<GetShoppingCardProductsStates> {
  GetShoppingCardProducts() : super(GetShoppingCardProductsStates());
  int totalPrice = 0;

  Future<List<ProductModel>> getShoppingCardProductData(String email) async {
    List<ProductModel> shoppingCardList = [];

    emit(GetShoppingCardProductsIsloadingState());
    try {
      final user =
          FirebaseFirestore.instance.collection('shopping_cart_product_data');
      final snapshotData = await user.doc(email).collection('products').get();
      final favoriteProductsData =
          snapshotData.docs.map((doc) => doc.data()).toList();
      totalPrice = 0;
      for (var i = 0; i < favoriteProductsData.length; i++) {
        shoppingCardList.add(ProductModel.formJson(favoriteProductsData[i]));
      
      }
      emit(GetShoppingCardProductsSucessState());
    } catch (e) {
      emit(GetShoppingCardProductsFiledState(errorMessage: e.toString()));
    }
    return shoppingCardList;
  }
}
