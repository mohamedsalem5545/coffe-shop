import 'package:bookly/Features/home/data/Cubits/shopping_card_product_cubit/add_to_shopping_card_cubit/add_shopping_card_product_state.dart';
import 'package:bookly/core/utils/function/custom_favorite_product_list.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class AddFavoriteProductCubit extends Cubit {
  AddFavoriteProductCubit() : super(AddShoppingCardState());
  void addProductToList(String email, ProductModel product) {
    emit(AddShoppingCardLoadingState());

    try {
      final user =
          FirebaseFirestore.instance.collection('shopping_cart_product_data');

      user.doc(email).collection('products').doc(product.title).set({
        'title': product.title,
        'price': product.price,
        'description': product.descrip,
        'image': product.imagUrl,
      });
      emit(AddShoppingCardSucessState());
    } catch (e) {
      emit(AddShoppingCardFailedState(errorMessage: e.toString()));
    }
  }
}