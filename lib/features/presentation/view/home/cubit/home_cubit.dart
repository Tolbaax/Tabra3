import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabra3/core/params/add_case_params.dart';

import '../../../../data/models/urgent_case_model.dart';
import '../../../../domain/usecases/urgent_case_usecase.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final UrgentCaseUsecase _urgentCaseUsecase;

  HomeCubit(this._urgentCaseUsecase) : super(HomeInitialState());

  static HomeCubit get(context) => BlocProvider.of(context);

  UrgentCase? allUrgentCases;

  Future<void> getAllUrgentCases() async {
    emit(GetAllUrgentCaseLoading());

    final result = await _urgentCaseUsecase.getAllUrgentCases();

    result.fold(
      (l) => emit(GetAllUrgentCaseError()),
      (r) => emit(GetAllUrgentCaseSuccess(urgentCase: r.result!)),
    );
  }

  Future<void> addUrgentCase(AddCaseParams params) async {
    emit(AddUrgentCaseLoading());
    final result = await _urgentCaseUsecase.addUrgentCase(params);

    result.fold(
      (l) => emit(AddUrgentCaseError()),
      (response) => emit(AddUrgentCaseSuccess(response: response)),
    );
  }
}
