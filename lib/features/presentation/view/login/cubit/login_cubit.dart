import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../../../core/params/signin_params.dart';
import '../../../../domain/usecases/auth_usecase.dart';
import 'login_states.dart';

class LoginCubit extends Cubit<LoginStates> {
  final AuthUseCase authUseCase;

  LoginCubit(this.authUseCase) : super(LoginInitialState());

  static LoginCubit get(context) => BlocProvider.of(context);

  Future<void> login(SignInParams params) async {
    emit(LoginLoadingState());
    final result = await authUseCase.signIn(params);

    result.fold(
      (l) => emit(LoginErrorState()),
      (response) => emit(LoginSuccessState(response: response)),
    );
  }
}
