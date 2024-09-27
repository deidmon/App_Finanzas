import 'package:app_finanzas/config/app_routes.dart';
import 'package:app_finanzas/design/colors.dart';
import 'package:app_finanzas/design/copy.dart';
import 'package:app_finanzas/providers/user_provider.dart';
import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({super.key});

  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final _formLoginKey = GlobalKey<FormState>();
  var checkBoxState = false;
  late String userName;
  late BoxDecoration userContainerDecoration;
  late BoxDecoration pswContainerDecoration;
  final defaultInputBorder = InputBorder.none;
  final defaultContainerInputDecoration = const BoxDecoration(
    color: AppColors.brandSecondaryColor,
    borderRadius: BorderRadius.all(
      Radius.circular(16),
    ),
  );
  final activeContainerInputDecoration = BoxDecoration(
    color: AppColors.brandSecondaryColor,
    border: Border.all(
      color: AppColors.brandPrimaryColor,
      width: 2,
    ),
    borderRadius: const BorderRadius.all(
      Radius.circular(16),
    ),
  );
  final defaultInputLabelTheme = const TextStyle(
    fontSize: 13,
    color: AppColors.brandLightDarkColor,
    fontWeight: FontWeight.normal,
  );
  @override
  void initState() {
    super.initState();
    userContainerDecoration = defaultContainerInputDecoration;
    pswContainerDecoration = defaultContainerInputDecoration;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(16, 100, 16, 0),
          child: Column(
            children: [
              Text(
                AppCopys.hello,
                style: Theme.of(context).textTheme.labelLarge,
              ),
              Container(
                margin: const EdgeInsets.fromLTRB(16, 21, 16, 59),
                child: Text(
                  AppCopys.lorem,
                  style: Theme.of(context).textTheme.labelMedium,
                  textAlign: TextAlign.center,
                ),
              ),
              Form(
                key: _formLoginKey,
                child: Column(
                  children: [
                    Container(
                      height: 70,
                      padding: const EdgeInsets.only(left: 24, bottom: 4),
                      decoration: userContainerDecoration,
                      child: TextFormField(
                        style: Theme.of(context).textTheme.labelSmall,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppErrors.userError;
                          }
                          if (value.length >= 10) {
                            return AppErrors.userErrorLen;
                          }

                          return null;
                        },
                        onTap: () {
                          setState(() {
                            userContainerDecoration =
                                activeContainerInputDecoration;
                            pswContainerDecoration =
                                defaultContainerInputDecoration;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            userContainerDecoration =
                                defaultContainerInputDecoration;
                          });
                        },
                        onSaved: (userNameValue) {
                          userName = userNameValue!;
                        },
                        decoration: InputDecoration(
                          border: defaultInputBorder,
                          label: Text(
                            AppCopys.userInputLabel,
                            style: defaultInputLabelTheme,
                          ),
                          /* hintText: 'Recuerda ingresar el usuario', */
                        ),
                      ),
                    ),
                    Container(
                      height: 70,
                      padding: const EdgeInsets.only(left: 24, bottom: 4),
                      margin: const EdgeInsets.symmetric(vertical: 24),
                      decoration: pswContainerDecoration,
                      child: TextFormField(
                        obscureText: true,
                        validator: (value) {
                          if (value == null || value.isEmpty) {
                            return AppErrors.userPsw;
                          }
                          return null;
                        },
                        decoration: InputDecoration(
                          border: defaultInputBorder,
                          label: Text(
                            AppCopys.userPswInputLabel,
                            style: defaultInputLabelTheme,
                          ), /* hintText: 'Recuerda ingresar la contraseña' */
                        ),
                        onTap: () {
                          setState(() {
                            userContainerDecoration =
                                defaultContainerInputDecoration;
                            pswContainerDecoration =
                                activeContainerInputDecoration;
                          });
                        },
                        onTapOutside: (event) {
                          setState(() {
                            pswContainerDecoration =
                                defaultContainerInputDecoration;
                          });
                        },
                      ),
                    ),
                    Row(
                      children: [
                        Checkbox(
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(4),
                            ),
                          ),
                          value: checkBoxState,
                          onChanged: (value) {
                            setState(() {
                              checkBoxState = !checkBoxState;
                            });
                          },
                          checkColor: AppColors.brandLightColor,
                          activeColor: AppColors.brandPrimaryColor,
                        ),
                        const Expanded(
                          child: Text(
                            AppCopys.rememberMe,
                          ),
                        ),
                        TextButton(
                          onPressed: () {},
                          child: Text(
                            AppCopys.recoveryPassword,
                            style: defaultInputLabelTheme,
                          ),
                        )
                      ],
                    ),
                    Container(
                      margin: const EdgeInsets.only(top: 32, bottom: 48),
                      width: 394,
                      height: 64,
                      child: ElevatedButton(
                        onPressed: () {
                          if (_formLoginKey.currentState!.validate()) {
                            print('Todos los campos están OK');
                            _formLoginKey.currentState!.save();
                            UserProvider.of(context).userData.name = userName;
                            Navigator.of(context).pushReplacementNamed(
                              AppRoutes.home,
                              /* arguments: userName, */
                            );
                          }
                        },
                        style: ElevatedButton.styleFrom(
                          backgroundColor: AppColors.brandPrimaryColor,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                        ),
                        child: const Text('Log In'),
                      ),
                    ),
                    const Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: AppColors.brandLightColorBorder,
                            thickness: 1.0,
                          ),
                        ),
                        Padding(
                          padding: EdgeInsets.symmetric(
                            horizontal: 14,
                          ),
                          child: Text(
                            AppCopys.orContinue,
                          ),
                        ),
                        Expanded(
                          child: Divider(
                            color: AppColors.brandLightColorBorder,
                            thickness: 1.0,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      height: 42,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          width: 189,
                          height: 69,
                          decoration: const BoxDecoration(
                            color: AppColors.brandSecondaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/google.png',
                                ),
                                width: 30,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                AppCopys.google,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.brandLightDarkColor,
                                ),
                              )
                            ],
                          ),
                        ),
                        Container(
                          width: 189,
                          height: 69,
                          decoration: const BoxDecoration(
                            color: AppColors.brandSecondaryColor,
                            borderRadius: BorderRadius.all(
                              Radius.circular(16),
                            ),
                          ),
                          child: const Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Image(
                                image: AssetImage(
                                  'assets/images/facebook.png',
                                ),
                                width: 30,
                              ),
                              SizedBox(
                                width: 12,
                              ),
                              Text(
                                AppCopys.facebook,
                                style: TextStyle(
                                  fontSize: 13,
                                  fontWeight: FontWeight.bold,
                                  color: AppColors.brandLightDarkColor,
                                ),
                              )
                            ],
                          ),
                        )
                      ],
                    ),
                    const SizedBox(
                      height: 50,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const Text(
                          AppCopys.notAMember,
                        ),
                        TextButton(
                          onPressed: () {},
                          child: const Text(
                            AppCopys.registerNow,
                            style: TextStyle(
                              color: AppColors.brandPrimaryColor,
                              fontSize: 13,
                            ),
                          ),
                        )
                      ],
                    )
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
