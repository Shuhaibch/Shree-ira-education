import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/utils/colors/colors.dart';
import 'package:shreeiraeducation/utils/helper/string_remove.dart';
import 'package:shreeiraeducation/utils/text/custom_text.dart';
import 'package:shreeiraeducation/view/home/widgets/drawer/terms_condition/bloc/terms_condition/termscondition_bloc.dart';

class TermsConditionScreen extends StatelessWidget {
  const TermsConditionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.orange,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: whiteColor,
          ),
        ),
        title: const Center(
          child: CustomText(
            text: "Terms & Conditions",
            color: whiteColor,
          ),
        ),
        actions: const [
          Icon(
            Icons.more_vert_rounded,
            color: whiteColor,
          ),
        ],
      ),
      body: BlocBuilder<TermsconditionBloc, TermsconditionState>(
        buildWhen: (previous, current) =>
            current is GetTermsAndConditionSuccessState,
        builder: (context, state) {
          if (state is GetTermsAndConditionSuccessState) {
            return SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(18.0),
                child: CustomText(
                    text: StringHelper.parseHtmlString(
                        state.termsCondition.termDescription ?? "Terms")),
              ),
            );
          }
          if (state is GetTermsAndConditionLoadingState) {
            return const Center(
              child: CircularProgressIndicator(
                color: Colors.orange,
              ),
            );
          }
          return const CustomText(text: '');
        },
      ),
    );
  }
}
