import 'package:flutter_bloc/flutter_bloc.dart';

import 'package:movie/core/networking/api_error_model.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeCubit() : super(HomeInitial());
}
