import 'package:bookly/Features/details/presentation/view/widgets/custom_botton.dart';
import 'package:bookly/Features/home/data/Cubits/delete_note_cubit/delete_cubit.dart';
import 'package:bookly/core/utils/function/custom_shopping_list.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

class OrderProductWidget extends StatefulWidget {
  const OrderProductWidget({
    super.key,
  });

  @override
  State<OrderProductWidget> createState() => _OrderProductWidgetState();
}

class _OrderProductWidgetState extends State<OrderProductWidget> {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.end,
      children: [
        GestureDetector(
          onTap: () {
            shoppingProductList.removeRange(0, shoppingProductList.length);

            BlocProvider.of<DeleteCubit>(context).deleteAllProduct();
          },
          child: const SizedBox(
            height: 20,
            child: Text(
              'Cancle',
              style: TextStyle(
                color: Colors.orangeAccent,
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),
          ),
        ),
        CustomBottom(
          title: 'place Order',
          //  color: Colors.orange,
        ),
      ],
    );
  }
}
