import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/get_shopping_card_cubit.dart/get_shopping_card_state.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class GetShoppingCardProducts extends Cubit<GetShoppingCardProductsStates> {
  GetShoppingCardProducts() : super(GetShoppingCardProductsStates());
  int totalPrice = 0;
  List<ProductModel> shoppingCardList = [];

  Future<void> getShoppingCardProductData(String email) async {
    shoppingCardList.clear();
    emit(GetShoppingCardProductsIsloadingState());
    try {
      final user =
          FirebaseFirestore.instance.collection('shopping_cart_product_data');
      final snapshotData = await user.doc(email).collection('products').get();
      final favoriteProductsData =
          snapshotData.docs.map((doc) => doc.data()).toList();
      for (var i = 0; i < favoriteProductsData.length; i++) {
        shoppingCardList.add(
          ProductModel.formJson(favoriteProductsData[i]),
        );
        calTotalPrice();
        emit(CalTotalPriceState(totalprice: totalPrice));
      }
      emit(GetShoppingCardProductsSucessState(
          shoppingCardList: shoppingCardList));
    } catch (e) {
      emit(GetShoppingCardProductsFiledState(errorMessage: e.toString()));
    }
  }

  void deleteAllProductsInShoppingCard(String email) async {
    final user =
        FirebaseFirestore.instance.collection('shopping_cart_product_data');
    await user.doc(email).collection('products').get().then((snapshot) {
      for (DocumentSnapshot ds in snapshot.docs) {
        ds.reference.delete();
      }
    });
    shoppingCardList.clear();
    totalPrice = 0;
    emit(CalTotalPriceState(totalprice: totalPrice));

    emit(
        GetShoppingCardProductsSucessState(shoppingCardList: shoppingCardList));
  }

  Future<void> deleteProductById(String email, String title) async {
    final user =
        FirebaseFirestore.instance.collection('shopping_cart_product_data');
    final snapshot = await user
        .doc(email)
        .collection('products')
        .where('title', isEqualTo: title)
        .get();
    final id = snapshot.docs.first.id;
    await user.doc(email).collection('products').doc(id).delete();
    await getShoppingCardProductData(email);
  }

  int calTotalPrice() {
    totalPrice = 0;
    for (var i = 0; i < shoppingCardList.length; i++) {
      totalPrice += ((int.parse(shoppingCardList[i].price)) *
          shoppingCardList[i].numberOfPaces!);
    }
    emit(CalTotalPriceState(totalprice: totalPrice));
    return totalPrice;
  }
}
