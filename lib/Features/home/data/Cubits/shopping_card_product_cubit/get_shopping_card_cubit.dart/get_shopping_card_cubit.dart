import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_state.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetFavoriteProductCubit extends Cubit<GetShoppingCardProductsStates> {
  GetFavoriteProductCubit() : super(GetShoppingCardProductsStates());
  Future<List<ProductModel>> getFavoriteProductData(String email) async {
    List<ProductModel> favoriteProductList = [];
    emit(GetShoppingCardProductsIsloadingState());
    try {
      final user =
          FirebaseFirestore.instance.collection('shopping_cart_product_data');
      final snapshotData = await user.doc(email).collection('products').get();
      final favoriteProductsData =
          snapshotData.docs.map((doc) => doc.data()).toList();
      for (var i = 0; i < favoriteProductsData.length; i++) {
        favoriteProductList.add(ProductModel.formJson(favoriteProductsData[i]));
      }
      emit(GetShoppingCardProductsSucessState());
    } catch (e) {
      emit(GetShoppingCardProductsFiledState(errorMessage: e.toString()));
    }
    return favoriteProductList;
  }
}
