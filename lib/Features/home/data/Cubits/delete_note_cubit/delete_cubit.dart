import 'package:bookly/Features/home/data/Cubits/delete_note_cubit/delete_cubit_states.dart';
import 'package:bookly/core/utils/function/custom_shopping_list.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class DeleteCubit extends Cubit<DeleteState> {
  DeleteCubit() : super(DeleteState());
  void deleteProduct(int index) {
    shoppingProductList.removeAt(index);
    for (int i = index; i < shoppingProductList.length - 1; i++) {
      shoppingProductList[i] = shoppingProductList[i + 1];
    }

    emit(DeleteProductState());
  }

  void deleteAllProduct() {
    shoppingProductList.removeRange(0, shoppingProductList.length);
    emit(DeleteProductState());
  }
}
