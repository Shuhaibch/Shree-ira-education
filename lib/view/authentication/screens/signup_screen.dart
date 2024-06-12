import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shreeiraeducation/utils/size/constant_height/constant_height.dart';
import 'package:shreeiraeducation/utils/snack_bar/snackbar.dart';
import 'package:shreeiraeducation/view/authentication/bloc/authentication_bloc.dart';
import 'package:shreeiraeducation/view/authentication/screens/login_screen.dart';
import 'package:shreeiraeducation/view/authentication/widgets/custom_textfield_widget.dart';

class SignUpScreen extends StatelessWidget {
  const SignUpScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController emailController = TextEditingController();
    TextEditingController fullNameController = TextEditingController();
    TextEditingController cPasswordController = TextEditingController();
    TextEditingController passwordController = TextEditingController();
    final GlobalKey<FormState> loginKey = GlobalKey<FormState>();
    return SafeArea(
        child: Scaffold(
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
                controller: fullNameController,
                label: "Full Name *",
                validator: (value) {
                  if (value!.isEmpty) {
                    return "Enter Valid Name";
                  } else {
                    return null;
                  }
                },
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
                children: [
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(right: 5.0),
                      child: CustomTextFieldWidget(
                        controller: passwordController,
                        label: "Password *",
                        validator: (value) {
                          if (value!.length < 6) {
                            return "Password must be more than 6 digit";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 5.0),
                      child: CustomTextFieldWidget(
                        controller: cPasswordController,
                        label: "Re Password *",
                        validator: (value) {
                          if (value!.length < 6 ||
                              value != passwordController.text) {
                            return "Password and RePassword not equal";
                          } else {
                            return null;
                          }
                        },
                      ),
                    ),
                  ),
                ],
              ),
              const KHeight(size: 0.04),
              SizedBox(
                width: double.infinity,
                child: BlocConsumer<AuthenticationBloc, AuthenticationState>(
                  listener: (context, state) {
                    if (state is UserSignUpSuccessState) {
                      CSnackBar.showSuccessSnackBar(
                          context, "Account Created please Login");
                      Navigator.of(context).pushAndRemoveUntil(
                        MaterialPageRoute(
                          builder: (context) => const LoginScreen(),
                        ),
                        (Route<dynamic> route) => false,
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
                    return ElevatedButton(
                      onPressed: () async {
                        if (loginKey.currentState!.validate()) {
                          var parts = fullNameController.text.split(' ');
                          var fname = parts[0].trim(); // prefix: "date"
                          var lname = parts.sublist(1).join(' ').trim();
                          if (lname == '') {
                            lname = fname;
                          }
                          context.read<AuthenticationBloc>().add(
                                UserSignUpEvent(
                                  firstName: fname,
                                  lastName: lname,
                                  email: emailController.text.trim(),
                                  password: passwordController.text.trim(),
                                ),
                              );
                        }
                      },
                      style: ButtonStyle(
                        shape: const WidgetStatePropertyAll(
                          RoundedRectangleBorder(),
                        ),
                        backgroundColor:
                            WidgetStateProperty.all<Color>(Colors.orange),
                        foregroundColor:
                            WidgetStateProperty.all<Color>(Colors.white),
                      ),
                      child: const Text('Sign Up'),
                    );
                  },
                ),
              ),
              const KHeight(size: 0.08),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "Not registered yet? ",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  InkWell(
                    onTap: () {
                      Navigator.pop(context);
                    },
                    child: const Text(
                      "Login now",
                      style: TextStyle(
                          color: Colors.red, fontWeight: FontWeight.bold),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    ));
  }
}
