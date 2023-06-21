import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabra3/features/data/models/donor_model.dart';
import 'package:tabra3/features/domain/usecases/donor_usecase.dart';

import '../../../../../core/params/add_case_params.dart';
import 'donor_states.dart';

class DonorCubit extends Cubit<DonorStates> {
  final DonorUseCase _donorUseCase;

  DonorCubit(this._donorUseCase) : super(DonorInitialState());

  static DonorCubit get(context) => BlocProvider.of(context);

  List<Donor>? donors;

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
