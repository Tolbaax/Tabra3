import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/params/add_case_params.dart';
import '../../../../domain/usecases/recipient_usecase.dart';
import 'recipient_states.dart';

class RecipientCubit extends Cubit<RecipientStates> {
  final RecipientUseCase _donorUseCase;

  RecipientCubit(this._donorUseCase) : super(RecipientInitialState());

  static RecipientCubit get(context) => BlocProvider.of(context);

  Future<void> getAllRecipients() async {
    emit(GetAllRecipientLoading());

    final result = await _donorUseCase.getAllRecipients();

    result.fold(
      (l) => emit(GetAllRecipientError()),
      (r) => emit(GetAllRecipientSuccess(donor: r.result!)),
    );
  }


  Future<void> addRecipient(AddCaseParams params) async {
    emit(AddRecipientLoading());
    final result = await _donorUseCase.addRecipient(params);

    result.fold(
          (l) => emit(AddRecipientError()),
          (response) => emit(AddRecipientSuccess(response: response)),
    );
  }
}
