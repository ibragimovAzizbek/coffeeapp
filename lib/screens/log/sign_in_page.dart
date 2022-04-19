import 'package:coffeeapp/core/constants/color_const.dart';
import 'package:coffeeapp/core/widgets/elevetad_button.dart';
import 'package:coffeeapp/core/widgets/input_icon_widget.dart';
import 'package:coffeeapp/core/widgets/my_appbar.dart';
import 'package:coffeeapp/providers/show_password_provider.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:provider/provider.dart';

class SignIn extends StatefulWidget {
  SignIn({Key? key}) : super(key: key);

  @override
  State<SignIn> createState() => _SignInState();
}

class _SignInState extends State<SignIn> {
  TextEditingController emailController = TextEditingController();

  TextEditingController passwordController = TextEditingController();

  final fromKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              MyAppBar(
                context: context,
                title: 'Coffee Shop Login',
                color: Colors.transparent,
              ),
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
                    SizedBox(height: MediaQuery.of(context).size.height * 0.06),
                    InputIconOnWidget(
                        text: "Password", path: 'assets/icons/Lock.svg'),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.01),
                    Padding(
                      padding: EdgeInsets.symmetric(
                          horizontal: MediaQuery.of(context).size.width * 0.04),
                      child: TextFormField(
                        controller: passwordController,
                        obscureText:
                            context.watch<ShowPasswdProvider>().isNotShow,
                        keyboardType: TextInputType.visiblePassword,
                        textInputAction: TextInputAction.done,
                        decoration: InputDecoration(
                          hintText: "* * * * * * * * * * * *",
                          suffixIcon: TextButton(
                            child: Text(
                              context.watch<ShowPasswdProvider>().isNotShow
                                  ? 'Show'
                                  : 'Hiddin',
                              style: TextStyle(
                                  fontSize:
                                      MediaQuery.of(context).size.width * 0.05),
                            ),
                            onPressed: () {
                              context.read<ShowPasswdProvider>().showPassword();
                            },
                          ),
                        ),
                        validator: (password) {
                          if (password!.length < 6) {
                            return "Password should not be less than 6 characters";
                          }
                          return null;
                        },
                      ),
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.07),
                    MyElevetedButton(
                      buttonText: 'Sign In',
                      keyGlobal: fromKey,
                      email: emailController.text,
                      password: passwordController.text,
                    ),
                    SizedBox(height: MediaQuery.of(context).size.height * 0.03),
                    TextButton(
                      child: Text(
                        "Create account",
                        style: TextStyle(
                            fontSize: MediaQuery.of(context).size.width * 0.04),
                      ),
                      onPressed: () {
                        Navigator.pushNamed(context, '/signup');
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
}
