import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/get_favorite_product_cubit/get_favorite_product_state.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetFavoriteProductCubit extends Cubit<GetFavoriteProductsStates> {
  GetFavoriteProductCubit() : super(GetFavoriteProductsStates());
  Future<void> getFavoriteProductData() async {
    List<ProductModel> favoriteProductList = [];

    emit(GetFavoriteProductsIsloadingState());
    try {
      final user =
          FirebaseFirestore.instance.collection('favorite_products_data');
      final snapshotData = await user
          .doc(FirebaseAuth.instance.currentUser!.email!)
          .collection('products')
          .get();
      final favoriteProductsData =
          snapshotData.docs.map((doc) => doc.data()).toList();
      for (var i = 0; i < favoriteProductsData.length; i++) {
        favoriteProductList.add(ProductModel.formJson(favoriteProductsData[i]));
      }
      emit(GetFavoriteProductsSucessState(
          favoriteProductList: favoriteProductList));
    } catch (e) {
      emit(GetFavoriteProductsFiledState(errorMessage: e.toString()));
    }
  }

  Future<void> deleteProductById( String title) async {
    final user =
        FirebaseFirestore.instance.collection('favorite_products_data');
    final snapshot = await user
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('products')
        .where('title', isEqualTo: title)
        .get();
    final id = snapshot.docs.first.id;
    await user
        .doc(FirebaseAuth.instance.currentUser!.email!)
        .collection('products')
        .doc(id)
        .delete();
    await getFavoriteProductData();
  }
}
