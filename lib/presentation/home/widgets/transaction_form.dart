import 'package:finance_helper/presentation/home/controllers/home_view_controller.dart';
import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class TransactionForm extends HookConsumerWidget {
  final TextEditingController controller = TextEditingController();
  TransactionForm({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final homeController = ref.read(homeViewProvider);
    final keyForm = GlobalKey<FormState>();

    final MediaQueryData mediaQueryData = MediaQuery.of(context);
    return Padding(
      padding: mediaQueryData.viewInsets,
      child: SingleChildScrollView(
        child: Container(
          padding: const EdgeInsets.symmetric(horizontal: 40.0, vertical: 40),
          child: Form(
            key: keyForm,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const _CategoryDropdownButton(),
                _DescriptionInput(homeController: homeController),
                SizedBox(height: mediaQueryData.size.height * 0.05),
                _AmountInput(homeController: homeController),
                SizedBox(height: mediaQueryData.size.height * 0.05),
                _SubmitButton(
                    colors: Theme.of(context).colorScheme, keyForm: keyForm)
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class _DescriptionInput extends StatelessWidget {
  const _DescriptionInput({
    required this.homeController,
  });

  final HomeViewController homeController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      decoration: const InputDecoration(
        labelText: 'Descripcion',
      ),
    );
  }
}

class _AmountInput extends StatelessWidget {
  const _AmountInput({
    required this.homeController,
  });

  final HomeViewController homeController;

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      validator: homeController.textInputEmptyValidator,
      keyboardType: TextInputType.number,
      decoration: const InputDecoration(
        labelText: 'Amount',
      ),
    );
  }
}

class _CategoryDropdownButton extends StatefulWidget {
  const _CategoryDropdownButton();

  @override
  State<_CategoryDropdownButton> createState() =>
      _CategoryDropdownButtonState();
}

const List<String> categories = <String>['Supermercado', 'Alquiler'];

class _CategoryDropdownButtonState extends State<_CategoryDropdownButton> {
  String dropdownValue = categories.first;

  @override
  Widget build(BuildContext context) {
    final colors = Theme.of(context).colorScheme;
    return DropdownButton<String>(
      value: dropdownValue,
      icon: const Icon(Icons.arrow_downward),
      underline: Container(
        height: 2,
        color: colors.primary,
      ),
      onChanged: (String? value) {
        setState(() {
          dropdownValue = value!;
        });
      },
      items: categories.map<DropdownMenuItem<String>>((String value) {
        return DropdownMenuItem<String>(
          value: value,
          child: Text(value),
        );
      }).toList(),
    );
  }
}

class _SubmitButton extends StatelessWidget {
  const _SubmitButton({
    required this.colors,
    required this.keyForm,
  });

  final ColorScheme colors;
  final GlobalKey<FormState> keyForm;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      child: FloatingActionButton.extended(
        label: Text('Registrar',
            style: Theme.of(context)
                .textTheme
                .displaySmall!
                .copyWith(color: Colors.white70, fontWeight: FontWeight.w900)),
        onPressed: () {
          if (keyForm.currentState!.validate()) {
            context.pushReplacement(
              '/home-view',
            );
          }
        },
      ),
    );
  }
}
