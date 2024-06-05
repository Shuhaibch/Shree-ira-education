import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/size/constant_width/constant_width.dart';
import 'package:shreeiraeducation/utils/snack_bar/snackbar.dart';
import 'package:shreeiraeducation/view/authentication/bloc/authentication_bloc.dart';
import 'package:shreeiraeducation/view/authentication/screens/login_screen.dart';
import 'package:shreeiraeducation/view/authentication/widgets/custom_textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});
  static final loginKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    TextEditingController emailController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    TextEditingController nameController = TextEditingController();
    TextEditingController confirmController = TextEditingController();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Padding(
        padding: const EdgeInsets.all(28.0),
        child: Form(
          key: loginKey,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "SHREE ",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.w900,
                      fontSize: 28,
                    ),
                  ),
                  Text(
                    "IRA",
                    style: TextStyle(
                      color: Color.fromARGB(255, 235, 160, 40),
                      fontWeight: FontWeight.w900,
                      fontSize: 28,
                    ),
                  ),
                ],
              ),
              const Text(
                "EDUCATION",
                style: TextStyle(
                  color: Colors.red,
                  fontWeight: FontWeight.w900,
                  fontSize: 28,
                ),
              ),
              const KHeight(size: 0.04),
              CustomTextFieldWidget(
                controller: nameController,
                label: "Full Name *",
              ),
              const KHeight(size: 0.02),
              CustomTextFieldWidget(
                controller: emailController,
                label: "Email address *",
                validator: (value) {
                  if (value!.isEmpty ||
                      !RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                          .hasMatch(value)) {
                    return "Enter Valid Email";
                  } else {
                    return null;
                  }
                },
              ),
              const KHeight(size: 0.02),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  SizedBox(
                    width: size.width * 0.4,
                    height: size.height * 0.07,
                    child: CustomTextFieldWidget(
                      controller: passwordController,
                      label: "Password *",
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Password is Incorrect";
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                  SizedBox(
                    width: size.width * 0.4,
                    height: size.height * 0.07,
                    child: CustomTextFieldWidget(
                      controller: confirmController,
                      label: "Re Password *",
                      validator: (value) {
                        if (value!.length < 6) {
                          return "Password is Incorrect";
                        } else if (value != passwordController.text) {
                          return 'Pasword and confirm password is not same';
                        } else {
                          return null;
                        }
                      },
                    ),
                  ),
                ],
              ),
              const KHeight(size: 0.04),
              BlocConsumer<AuthenticationBloc, AuthenticationState>(
                listener: (context, state) {
                  if (state is UserSignUpSuccessState) {
                    CSnackBar.showSnackBar(
                        context, 'Account Created Successfully');
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const LoginScreen(),
                      ),
                    );
                  }
                  if (state is UserSignUpFailedState) {
                    CSnackBar.showErrorSnackBar(context, state.errorMsg);
                  }
                },
                builder: (context, state) {
                  if (state is UserLogginLoadingState) {
                    return const Center(
                      child: CircularProgressIndicator(
                        color: Colors.orange,
                      ),
                    );
                  }
                  return SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      onPressed: () async {
                        if (loginKey.currentState!.validate()) {
                          context.read<AuthenticationBloc>().add(
                                UserSignUpEvent(
                                  firstName: nameController.text.trim(),
                                  lastName: nameController.text.trim(),
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                      style: ButtonStyle(
                        shape: const WidgetStatePropertyAll(
                            RoundedRectangleBorder()),
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.orange),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      child: const Text('Sign Up'),
                    ),
                  );
                },
              ),
              const KHeight(size: 0.08),
              const Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "Already registered",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  KWidth(size: 0.01),
                  Text(
                    "Sign In now",
                    style: TextStyle(
                      color: Colors.red,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
