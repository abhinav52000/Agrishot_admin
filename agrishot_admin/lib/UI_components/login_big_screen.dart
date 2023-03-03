import 'package:agrishot_admin/screen/Home_screen.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../Alert/auth_fail_alert.dart';
import '../Network/Bloc/login_bloc.dart';
import '../Network/Login_api/get_set_acceess_token.dart';
import '../Theme/text_style.dart';
import '../constant/login_screen_constant.dart';

class LoginBigScreen extends StatefulWidget {
  const LoginBigScreen({super.key});

  @override
  State<LoginBigScreen> createState() => _LoginBigScreenState();
}

class _LoginBigScreenState extends State<LoginBigScreen> {
  String? acessToken;
  @override
  void initState() {
    super.initState();
    // acessToken = ;
    // if();
  }

  @override
  Widget build(BuildContext context) {
    final bloc = Provider.of<LoginBloc>(context, listen: false);

    double height = MediaQuery.of(context).size.height;
    double width = MediaQuery.of(context).size.width;
    return Center(
      child: Row(
        mainAxisSize: MainAxisSize.max,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            constraints: BoxConstraints.tightFor(
              height: height - height * 0.15,
              width: (width < 900) ? width * 0.5 : width * 0.3,
            ),
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16.0),
              color: Colors.white,
            ),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Image.asset(
                    'Asset/logo.png',
                    scale: 2,
                  ),
                  const SizedBox(height: 20),
                  Text(
                    'AgriShots',
                    style: loginPageStyle.copyWith(
                      fontSize: 19,
                      color: const Color(
                        0xffA4A6B3,
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  Text(
                    'Log In to Agrishots Admin',
                    style: loginPageStyle.copyWith(
                      color: const Color(
                        0xff252733,
                      ),
                      fontSize: 24,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Text(
                    'Enter your email and password below',
                    style: loginPageStyle.copyWith(
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 50),
                  Row(
                    children: [
                      Text(
                        'EMAIL',
                        style: loginPageStyle,
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(horizontal: 16),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: StreamBuilder<String>(
                              stream: bloc.loginEmail,
                              builder: (context, snapshot) {
                                return TextField(
                                  onChanged: bloc.changeloginEmail,
                                  keyboardType: TextInputType.emailAddress,
                                  autofillHints: const [AutofillHints.email],
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'Email address',
                                    hintStyle: loginPageStyle,
                                  ),
                                );
                              }),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(height: 30),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        'PASSWORD',
                        style: loginPageStyle,
                      ),
                      InkWell(
                        onTap: (() {
                          print('forget typed');
                        }),
                        child: Text(
                          'Forget Password?',
                          style: loginPageStyle.copyWith(
                            fontWeight: FontWeight.w400,
                            fontSize: 10,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                    ),
                    decoration: BoxDecoration(
                      border: Border.all(
                        color: Colors.blueGrey,
                        width: 1.0,
                      ),
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          child: StreamBuilder<Object>(
                              stream: bloc.loginPassword,
                              builder: (context, snapshot) {
                                return TextField(
                                  obscureText: ispasswordhidden,
                                  onChanged: bloc.changeLoginPassword,
                                  decoration: InputDecoration(
                                    border: InputBorder.none,
                                    hintText: 'password',
                                    hintStyle: loginPageStyle,
                                  ),
                                );
                              }),
                        ),
                        IconButton(
                          onPressed: () {
                            setState(() {
                              ispasswordhidden = !ispasswordhidden;
                            });
                          },
                          icon: Icon(
                            ispasswordhidden
                                ? CupertinoIcons.eye_solid
                                : CupertinoIcons.eye_slash_fill,
                            color: Colors.grey,
                          ),
                        )
                      ],
                    ),
                  ),
                  const SizedBox(height: 50),
                  StreamBuilder<Object>(
                      stream: bloc.isValid,
                      builder: (context, snapshot) {
                        return RawMaterialButton(
                          onPressed: () async {
                            var response = await bloc.submit(context);
                            if (!response['success']) {
                              // ignore: use_build_context_synchronously
                              authAlert(response: response, context: context);
                            } else {
                              saveMyValue(response['data']['accessToken']);
                              // ignore: use_build_context_synchronously
                              Navigator.popAndPushNamed(context, HomeScreen.id);
                            }
                          },
                          fillColor: const Color(
                            0xff1D8D2F,
                          ),
                          constraints: BoxConstraints.tightFor(
                            width: 0.2 * width,
                          ),
                          padding: const EdgeInsets.all(16),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(
                              10,
                            ),
                          ),
                          child: Text(
                            'Log In',
                            style: loginPageStyle.copyWith(color: Colors.white),
                          ),
                        );
                      })
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
