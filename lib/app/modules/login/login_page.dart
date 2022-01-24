import 'package:estatisticas_covid/shared/constants/app_colors.dart';
import 'package:estatisticas_covid/shared/widgets/app_elevated_button.dart';
import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'package:estatisticas_covid/app/modules/login/controller/login_controller.dart';
import 'package:estatisticas_covid/shared/app_assets/app_images.dart';
import 'package:estatisticas_covid/shared/widgets/app_text_field.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginController controller = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.primary.withOpacity(0.4),
      body: _buildBody(),
    );
  }

  Widget _buildBody() {
    return SafeArea(
      child: Scrollbar(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const SizedBox(height: kToolbarHeight),
                _buildImage(),
                Container(
                  padding:
                      const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  decoration: BoxDecoration(
                    color: AppColors.background,
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.stretch,
                    children: [
                      const SizedBox(height: 16),
                      _buildEmailField(),
                      const SizedBox(height: 16),
                      _buildPasswordField(),
                      const SizedBox(height: 16),
                      _buildLoginButton(),
                    ],
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildImage() {
    return Padding(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        children: [
          SizedBox(
            height: 200,
            child: AppImages.logo,
          ),
        ],
      ),
    );
  }

  Widget _buildEmailField() {
    return AppTextField(
      label: 'e-mail',
      onChanged: controller.emailOnChanged,
    );
  }

  Widget _buildPasswordField() {
    return Observer(builder: (_) {
      return AppTextField(
        label: 'password',
        obscureText: !controller.isPasswordVisible,
        onChanged: controller.passwordOnChanged,
        suffixWidget: IconButton(
          onPressed: controller.togglePasswordVisibility,
          icon: Observer(builder: (_) {
            return Icon(
              controller.isPasswordVisible
                  ? Icons.visibility
                  : Icons.visibility_off,
              color: AppColors.primary,
            );
          }),
        ),
      );
    });
  }

  Widget _buildLoginButton() {
    return Observer(builder: (_) {
      return AppElevatedButton(
        onPressed: controller.isLoginAvaliable
            ? () => controller.login(context)
            : null,
        child: controller.loading
            ? const Padding(
                padding: EdgeInsets.all(8.0),
                child: SizedBox(
                  child: CircularProgressIndicator(color: Colors.white),
                ),
              )
            : const Text('Entrar'),
      );
    });
  }
}
