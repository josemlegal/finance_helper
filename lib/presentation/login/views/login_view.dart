import 'package:animate_do/animate_do.dart';
import 'package:finance_helper/presentation/login/controllers/login_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginView extends HookConsumerWidget {
  final TextEditingController controller = TextEditingController();
  LoginView({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final loginController = ref.read(loginViewProvider);
    final keyForm = GlobalKey<FormState>();
    final colors = Theme.of(context).colorScheme;

    return Scaffold(
      body: FadeIn(
        duration: const Duration(seconds: 2),
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 40.0),
          child: Form(
            key: keyForm,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Container(
                //   height: 180,
                //   width: 150,
                //   decoration: const BoxDecoration(
                //     image: DecorationImage(
                //       image: AssetImage('assets/images/logo.png'),
                //     ),
                //   ),
                // ),
                _UsernameInput(loginController: loginController),
                _PasswordInput(loginController: loginController),
                const SizedBox(
                  height: 30,
                ),
                _SubmitButton(
                    colors: colors,
                    keyForm: keyForm,
                    onPressed: loginController.goToHomeView)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _UsernameInput extends StatelessWidget {
  const _UsernameInput({
    required this.loginController,
  });

  final LoginViewController loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [FilteringTextInputFormatter.deny(RegExp(r'\d'))],
      validator: loginController.textInputEmptyValidator,
      decoration: const InputDecoration(
        labelText: 'Username',
      ),
    );
  }
}

class _PasswordInput extends StatelessWidget {
  const _PasswordInput({
    required this.loginController,
  });

  final LoginViewController loginController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      inputFormatters: [
        LengthLimitingTextInputFormatter(5),
      ],
      validator: loginController.textInputEmptyValidator,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Password',
      ),
    );
  }
}

class _SubmitButton extends StatefulHookConsumerWidget {
  const _SubmitButton({
    required this.onPressed,
    required this.colors,
    required this.keyForm,
  });

  final ColorScheme colors;
  final GlobalKey<FormState> keyForm;
  final VoidCallback onPressed;

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _SubmitButtonState();
}

class _SubmitButtonState extends ConsumerState<_SubmitButton> {
  @override
  Widget build(BuildContext context) {
    return FadeInUpBig(
      child: SizedBox(
        width: double.infinity,
        child: FloatingActionButton.extended(
          backgroundColor: widget.colors.primary,
          label: Text('Login',
              style: Theme.of(context).textTheme.displaySmall!.copyWith(
                  color: Colors.white70, fontWeight: FontWeight.w900)),
          onPressed: () {
            if (widget.keyForm.currentState!.validate()) {
              widget.onPressed();
            }
          },
        ),
      ),
    );
  }
}
