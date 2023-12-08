import 'package:bookly/Features/home/data/Cubits/favorite_product_cubit/add_favorite_product_cubit/add_favorite_Product_State.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class AddFavoriteProductCubit extends Cubit {
  AddFavoriteProductCubit() : super(AddFavoriteProductsStates());
  void addProductToList(String email, ProductModel product) {
    emit(AddToFavoriteProductsIsloadingState());

    try {
      final user =
          FirebaseFirestore.instance.collection('favorite_products_data');

      user.doc(email).collection('products').doc(product.title).set({
        'title': product.title,
        'price': product.price,
        'description': product.descrip,
        'image': product.imagUrl,
      });
      emit(AddToFavoriteProductsSucessState());
    } catch (e) {
      emit(AddToFavoriteProductsFiledState(errorMessage: e.toString()));
    }
  }

  Future<List<ProductModel>> getFavoriteProductData(String email) async {
    List<ProductModel> favoriteProductList = [];

    try {
      final user =
          FirebaseFirestore.instance.collection('favorite_products_data');
      final snapshotData = await user.doc(email).collection('products').get();
      final favoriteProductsData =
          snapshotData.docs.map((doc) => doc.data()).toList();
      for (var i = 0; i < favoriteProductsData.length; i++) {
        favoriteProductList.add(ProductModel.formJson(favoriteProductsData[i]));
      }
      return favoriteProductList;
    } catch (e) {
      return favoriteProductList;
    }
  }
}
