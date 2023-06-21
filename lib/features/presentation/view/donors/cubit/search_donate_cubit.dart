import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../domain/usecases/donor_usecase.dart';
import 'search_donate_states.dart';

class SearchDonateCubit extends Cubit<SearchDonateStates> {
  final DonorUseCase _donorUseCase;

  SearchDonateCubit(this._donorUseCase) : super(SearchDonorInitialState());

  static SearchDonateCubit get(context) => BlocProvider.of(context);

  Future<void> getDonorByAddress(String address) async {
    emit(GetDonorByAddressLoading());
    final result = await _donorUseCase.getDonorByAddress(address);

    result.fold(
      (l) => emit(GetDonorByAddressError()),
      (r) => emit(GetDonorByAddressSuccess(donor: r.result!)),
    );
  }
}
