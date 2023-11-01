import 'package:flutter_bloc/flutter_bloc.dart';

class CategorySelectedCubit extends Cubit<int> {
  CategorySelectedCubit() : super(0);

  void setCategory(int newValue) {
    emit(newValue);
  }
}
