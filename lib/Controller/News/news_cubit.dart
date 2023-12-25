
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:forgotten_mines/Controller/Const/api_url.dart';
import 'package:forgotten_mines/Model/news_model.dart';

import 'package:forgotten_mines/helper/dio_helper.dart';
import 'package:meta/meta.dart';

part 'news_state.dart';

class NewsCubit extends Cubit<NewsState> {
  NewsCubit() : super(NewsInitial());

  static NewsCubit get(context) => BlocProvider.of(context);
  NewModel? newsModel;

  void getNews() async {
    emit(GetNewsLoading());
    DioHelper.getData(url: ApiUrl.baseUrl).then((value) {
      print(value.data);
      if (value.statusCode == 200) {
       newsModel = NewModel.fromJson(value.data);
        print('Success');
      } else {
        print('Error');
      }
      emit(GetNewsSuccess());
    }).catchError((e) {
      emit(GetNewsError());
      print(e.toString());
    });
  }
}
