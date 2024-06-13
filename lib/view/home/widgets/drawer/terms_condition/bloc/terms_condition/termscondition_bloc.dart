import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/controller/terms_conditon/terms_condition_controller.dart';
import 'package:shreeiraeducation/models/privacy_terms/privacy_policy_model.dart';
import 'package:shreeiraeducation/models/privacy_terms/terms_condition_model.dart';

part 'termscondition_event.dart';
part 'termscondition_state.dart';

class TermsconditionBloc
    extends Bloc<TermsconditionEvent, TermsconditionState> {
  final TermsAndConditionController _controller;
  TermsconditionBloc({required TermsAndConditionController controller})
      : _controller = controller,
        super(TermsconditionInitial()) {
    on<GetTermsAndConditionEvent>(_onGetTermsCondition);
    on<GetPrivacyPolicyEvent>(_onGetPrivacyPolicy);
  }

  void _onGetTermsCondition(GetTermsAndConditionEvent event,
      Emitter<TermsconditionState> emit) async {
    emit(GetTermsAndConditionLoadingState());
    final res = await _controller.getTermsAndConditions();
    final res2 = await _controller.getPrivacyPolicy();

    if (res['response'] == 'success') {
      emit(
        GetTermsAndConditionSuccessState(
            termsCondition: res['data'], policy: res2['data']),
      );
    } else {
      emit(GetTermsAndConditionFailedState());
    }
  }

  void _onGetPrivacyPolicy(
      GetPrivacyPolicyEvent event, Emitter<TermsconditionState> emit) async {
    emit(GetPrivacyPolicyLoadingState());
    final res = await _controller.getPrivacyPolicy();

    if (res['response'] == 'success') {
      emit(GetPrivacyPolicySuccessState(policy: res['data']));
    } else {
      emit(GetPrivacyPolicyFailedState());
    }
  }
}
