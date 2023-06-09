import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:tabra3/core/params/signup_params.dart';
import 'package:tabra3/features/domain/usecases/auth_usecase.dart';

import 'signup_states.dart';

class SignUpCubit extends Cubit<SignUpStates> {
  final AuthUseCase authUseCase;

  SignUpCubit(this.authUseCase) : super(SignUpInitialState());

  static SignUpCubit get(context) => BlocProvider.of(context);

  Future<void> signUp(SignUpParams params) async {
    emit(SignUpLoadingState());
    final result = await authUseCase.signUp(params);
    result.fold(
      (l) => emit(SignUpErrorState()),
      (r) => emit(SignUpSuccessState()),
    );
  }
}
