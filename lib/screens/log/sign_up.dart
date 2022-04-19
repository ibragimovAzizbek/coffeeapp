import 'package:coffeeapp/core/widgets/elevetad_button.dart';
import 'package:coffeeapp/core/widgets/input_icon_widget.dart';
import 'package:coffeeapp/providers/show_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignUp extends StatefulWidget {
  SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();
  TextEditingController passwordController2 = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: SizedBox(
                    height: MediaQuery.of(context).size.height * 0.3,
                    child: Lottie.asset('assets/animation/coffee.json')),
              ),
              SizedBox(height: MediaQuery.of(context).size.width * 0.1),
              Form(
                key: fromKey,
                child: Column(
                  children: [
                    InputIconOnWidget(
                        text: "Email", path: 'assets/icons/Message.svg'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: TextFormField(
                        controller: emailController,
                        keyboardType: TextInputType.emailAddress,
                        textInputAction: TextInputAction.next,
                        decoration: const InputDecoration(
                            hintText: "example@gmail.com"),
                        validator: (email) {
                          if (!(RegExp(
                                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
                              .hasMatch(email!))) {
                            return "Check your email and re-enter .";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    InputIconOnWidget(
                        text: "Password", path: 'assets/icons/Lock.svg'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    passwordInput(context, passwordController),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.04),
                    InputIconOnWidget(
                        text: "Confirmation", path: 'assets/icons/Lock.svg'),
                    passwordInput(context, passwordController2),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    MyElevetedButton(
                      buttonText: 'Sign Up',
                      keyGlobal: fromKey,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    TextButton(
                      child: Text(
                        "Login account",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/login');
                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Padding passwordInput(
      BuildContext context, TextEditingController controller) {
    return Padding(
      padding: EdgeInsets.symmetric(
          horizontal: MediaQuery.of(context).size.width * 0.04),
      child: TextFormField(
        controller: controller,
        obscureText: context.watch<ShowPasswdProvider>().isNotShow,
        keyboardType: TextInputType.visiblePassword,
        textInputAction: TextInputAction.done,
        decoration: InputDecoration(
          hintText: "* * * * * * * * * * * *",
          suffixIcon: TextButton(
            child: Text(
              context.watch<ShowPasswdProvider>().isNotShow ? 'Show' : 'Hiddin',
              style:
                  TextStyle(fontSize: MediaQuery.of(context).size.width * 0.05),
            ),
            onPressed: () {
              context.read<ShowPasswdProvider>().showPassword();
            },
          ),
        ),
        validator: (password) {
          if (password!.length < 6) {
            return "Password should not be less than 6 characters";
          } else if (passwordController.text != passwordController2.text) {
            return 'Password not confirmed';
          }
        },
      ),
    );
  }
}
