class AddShoppingCardState {}

class AddShoppingCardSucessState extends AddShoppingCardState {}

class AddShoppingCardFailedState extends AddShoppingCardState {
  final String errorMessage;

  AddShoppingCardFailedState({required this.errorMessage});
}

class AddShoppingCardLoadingState extends AddShoppingCardState {}
