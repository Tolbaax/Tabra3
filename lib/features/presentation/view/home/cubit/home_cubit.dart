import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabra3/core/params/add_case_params.dart';
import 'package:tabra3/features/domain/usecases/donor_usecase.dart';

import '../../../../data/models/urgent_case_model.dart';
import '../../../../domain/usecases/urgent_case_usecase.dart';
import 'home_states.dart';

class HomeCubit extends Cubit<HomeStates> {
  final UrgentCaseUsecase _urgentCaseUsecase;
  final DonorUseCase _donorUseCase;

  HomeCubit(this._urgentCaseUsecase, this._donorUseCase)
      : super(HomeInitialState());

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

  Future<void> getAllDonors() async {
    emit(GetAllDonorLoading());

    final result = await _donorUseCase.getAllDonors();

    result.fold(
      (l) => emit(GetAllDonorError()),
      (r) => emit(GetAllDonorSuccess(donor: r.result!)),
    );
  }

  Future<void> addDonor(AddCaseParams params) async {
    emit(AddDonorLoading());
    final result = await _donorUseCase.addDonor(params);

    result.fold(
      (l) => emit(AddDonorError()),
      (response) => emit(AddDonorSuccess(response: response)),
    );
  }
}
