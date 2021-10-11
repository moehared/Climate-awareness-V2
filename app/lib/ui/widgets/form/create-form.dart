// ignore_for_file: file_names

import 'package:app/common/styles/textfield-form.dart';
import 'package:app/domain/viewmodel/user-registeration-view-model/user_registeration_viewmodel.dart';
import 'package:flutter/material.dart';

class CreateRegisterationForm extends StatelessWidget {
  const CreateRegisterationForm({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UserRegisterationViewModel model;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Form(
        child: Column(
          children: [
            TextFormField(
              // focusNode: _emailFocus,
              // autovalidate: isError ? true : false,
              textInputAction: TextInputAction.next,
              keyboardType: TextInputType.emailAddress,
              textAlign: TextAlign.center,
              onFieldSubmitted: (_) {},
              validator: (enteredText) {
                return null;
              },
              onChanged: (email) {},
              onSaved: (val) {},
              decoration: kTextFieldform.copyWith(
                prefixIcon: Icon(Icons.email),
                hintText: "Enter Email",
              ),
            ),
            SizedBox(height: 20),
            TextFormField(
              // focusNode: _passFocus,
              textInputAction: TextInputAction.done,
              keyboardType: TextInputType.text,
              // obscureText: showPass ? false : true,
              textAlign: TextAlign.center,
              onSaved: (val) {},
              validator: (enteredText) {
                return null;
              },
              decoration: kTextFieldform.copyWith(
                prefixIcon: Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    // showPass
                    true
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                  onPressed: () {},
                ),
                hintText: "Enter Password",
              ),
            ),
          ],
        ),
      ),
    );
  }
}
