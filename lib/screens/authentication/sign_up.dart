import 'package:flutter/material.dart';
import 'package:modal_progress_hud_nsn/modal_progress_hud_nsn.dart';
import 'package:provider/provider.dart';

import 'package:todoey/models/task_data.dart';
import 'package:todoey/screens/authentication/sign_in.dart';
import 'package:todoey/screens/tasks_screen.dart';
import 'package:todoey/services/auth_service.dart';
import 'package:todoey/services/validator.dart';
import 'package:todoey/utilities/constants.dart';
import 'package:todoey/widgets/password_visibility.dart';
import 'package:todoey/widgets/rounded_button.dart';
import 'package:todoey/widgets/snack_bar.dart';
import 'package:todoey/widgets/styled_text_field.dart';
import 'package:todoey/widgets/title_container.dart';

class SignUp extends StatefulWidget {
  static String id = 'sign_up';

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  final _formKey = GlobalKey<FormState>();
  final _passwordFieldKey = GlobalKey<FormFieldState<String>>();
  TextEditingController? _nameController = TextEditingController();
  TextEditingController? _emailController = TextEditingController();
  TextEditingController? _passwordController = TextEditingController();
  TextEditingController? _confirmPasswordController = TextEditingController();
  Validator _validator = Validator();
  late AuthService _authService;

  @override
  void initState() {
    _authService = AuthService(
      formKey: _formKey,
      snakeBar: snakeBar,
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<TaskData>(context);
    return Scaffold(
      backgroundColor: kScaffoldBackgroundColor,
      body: SafeArea(
        child: ModalProgressHUD(
          inAsyncCall: Provider.of<TaskData>(context).showSpinner,
          child: Column(
            children: [
              TitleContainer(
                titleLabel: 'Sign Up',
              ),
              Expanded(
                child: Container(
                  padding: kSignUpContentConainterPadding,
                  decoration: kContainerDecoration,
                  child: SingleChildScrollView(
                    child: Form(
                      key: _formKey,
                      child: Column(
                        children: [
                          /// Full Name Text Form Field
                          StyledTextField(
                            controller: _nameController,
                            keyboardType: TextInputType.name,
                            validator: _validator.validName,
                            decoration: kTextFormFieldDecoration.copyWith(
                              prefixIcon: Icon(
                                Icons.person,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),

                          /// Email Text Form Field
                          StyledTextField(
                            controller: _emailController,
                            keyboardType: TextInputType.emailAddress,
                            validator: _validator.validEmail,
                            decoration: kTextFormFieldDecoration.copyWith(
                              hintText: 'Email',
                              prefixIcon: Icon(
                                Icons.email,
                                color: Colors.lightBlueAccent,
                              ),
                            ),
                          ),

                          /// Password Text Form Field
                          StyledTextField(
                            passwordFieldKey: _passwordFieldKey,
                            controller: _passwordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: provider.firstObscureText,
                            validator: _validator.validPassword,
                            decoration: kTextFormFieldDecoration.copyWith(
                              hintText: 'Password',
                              suffixIcon: PasswordVisibility(
                                label: 'password',
                                obscureText: provider.firstObscureText,
                              ),
                            ),
                          ),

                          /// Confirm Password Text Form Field
                          StyledTextField(
                            controller: _confirmPasswordController,
                            keyboardType: TextInputType.visiblePassword,
                            obscureText: provider.secondObscureText,
                            decoration: kTextFormFieldDecoration.copyWith(
                              hintText: 'Confirm Password',
                              suffixIcon: PasswordVisibility(
                                obscureText: provider.secondObscureText,
                              ),
                            ),
                            validator: (value) {
                              return _validator.validConfirmPassword(
                                  value, _passwordFieldKey);
                            },
                          ),

                          /// SignUp Button
                          RoundedButton(
                            buttonLabel: 'Sign Up',
                            onPressed: signUpOnPressed,
                          ),

                          /// After the Sign Up button
                          SizedBox(
                            height: 10.0,
                          ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Already have an account ?',
                                style: TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                              TextButton(
                                onPressed: () =>
                                    Navigator.pushNamed(context, SignIn.id),
                                child: Text(
                                  'Sign In',
                                  style: TextStyle(
                                    fontSize: 18.0,
                                    color: Colors.lightBlueAccent,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future<void> signUpOnPressed() async {
    /// make the showSpinner = true;
    Provider.of<TaskData>(context, listen: false).toggleSpinner();

    /// to call the [createUserWithEmailAndPassword] and create user.
    var _signUpResult = await _authService.createUserWithEmailAndPassword(
      email: _emailController!.text,
      password: _passwordController!.text,
      name: _nameController!.text,
    );

    /// Make the showSpinner = false;
    Provider.of<TaskData>(context, listen: false).toggleSpinner();

    /// Check if the user is created
    /// And navigate to the [TaskScreen] page
    if (_signUpResult != null) {
      Navigator.pushNamed(context, TasksScreen.id);
      _nameController!.clear();
      _emailController!.clear();
      _passwordController!.clear();
      _confirmPasswordController!.clear();
    }
  }

  /// create a custom snake bar from the [CustomSnakeBar] class
  void snakeBar(content) {
    CustomSnakeBar customSnakeBar = CustomSnakeBar();
    customSnakeBar.showSnackBar(context, content);
  }
}
