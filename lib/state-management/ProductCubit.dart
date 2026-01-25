import 'package:flutter_bloc/flutter_bloc.dart';

class ProductCubit extends Cubit<int>{
  ProductCubit(super.initialState);

  int count = 0;

  void add(){
    count++;
    emit(count);
  }

}