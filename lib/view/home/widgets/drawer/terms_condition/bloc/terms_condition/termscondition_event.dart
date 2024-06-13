part of 'termscondition_bloc.dart';

sealed class TermsconditionEvent extends Equatable {
  const TermsconditionEvent();

  @override
  List<Object> get props => [];
}
final class GetTermsAndConditionEvent  extends TermsconditionEvent{}
final class GetPrivacyPolicyEvent  extends TermsconditionEvent{}