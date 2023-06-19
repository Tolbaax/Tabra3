import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/urgent_case_usecase.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final UrgentCaseUsecase _urgentCaseUsecase;

  HomeCubit(this._urgentCaseUsecase) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  Future<void> getAllUrgentCases() async {
    emit(GetAllUrgentCaseLoading());

    final result = await _urgentCaseUsecase.getAllUrgentCases();

    result.fold(
      (l) => emit(GetAllUrgentCaseError()),
      (r) => emit(GetAllUrgentCaseSuccess(urgentCase: r.result!)),
    );
  }
}
