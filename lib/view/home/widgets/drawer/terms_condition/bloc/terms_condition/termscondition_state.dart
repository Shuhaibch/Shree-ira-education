part of 'termscondition_bloc.dart';

sealed class TermsconditionState extends Equatable {
  const TermsconditionState();

  @override
  List<Object> get props => [];
}

final class TermsconditionInitial extends TermsconditionState {}

final class GetTermsAndConditionSuccessState extends TermsconditionState {
  final TermsCondition termsCondition;
  final Policy policy;

  const GetTermsAndConditionSuccessState( {required this.termsCondition ,required this.policy,});
}

final class GetTermsAndConditionLoadingState extends TermsconditionState {}

final class GetTermsAndConditionFailedState extends TermsconditionState {}

final class GetPrivacyPolicySuccessState extends TermsconditionState {
  final Policy policy;

  const GetPrivacyPolicySuccessState({required this.policy});
}

final class GetPrivacyPolicyLoadingState extends TermsconditionState {}

final class GetPrivacyPolicyFailedState extends TermsconditionState {}
