// ignore_for_file: file_names

import 'package:app/common/enums/view_state.dart';
import 'package:app/common/styles/textfield-form.dart';
import 'package:app/domain/services/locator.dart';
import 'package:app/domain/viewmodel/buildView_modelTemplate.dart/buildView_modelTemplate.dart';
import 'package:app/domain/viewmodel/user-registeration-view-model/user_registeration_viewmodel.dart';
import 'package:flutter/material.dart';

class CreateRegisterationForm extends StatefulWidget {
  const CreateRegisterationForm({
    Key? key,
    required this.model,
  }) : super(key: key);
  final UserRegisterationViewModel model;
  @override
  State<CreateRegisterationForm> createState() =>
      _CreateRegisterationFormState();
}

class _CreateRegisterationFormState extends State<CreateRegisterationForm>
    with SingleTickerProviderStateMixin {
  @override
  void initState() {
    widget.model.init(this);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
        horizontal: 20,
      ),
      child: Form(
        key: widget.model.formkey,
        autovalidateMode: AutovalidateMode.onUserInteraction,
        child: Column(
          children: [
            if (widget.model.authMode == AuthMode.SIGNUP)
              FadeTransition(
                opacity: widget.model.opacityAnim!,
                child: SlideTransition(
                  position: widget.model.slideAnimation!,
                  child: Column(
                    children: [
                      TextFormField(
                        // focusNode: _emailFocus,
                        // autovalidate: isError ? true : false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onFieldSubmitted: (_) {},
                        validator: (enteredText) {
                          return null;
                        },
                        onChanged: (firstName) {},
                        onSaved: (val) {},
                        decoration: kTextFieldform.copyWith(
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Enter First Name",
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        // focusNode: _emailFocus,
                        // autovalidate: isError ? true : false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.text,
                        textAlign: TextAlign.center,
                        onFieldSubmitted: (_) {},
                        validator: (enteredText) {
                          return null;
                        },
                        onChanged: (firstName) {},
                        onSaved: (val) {},
                        decoration: kTextFieldform.copyWith(
                          prefixIcon: const Icon(Icons.person),
                          hintText: "Enter Last Name",
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        // focusNode: _emailFocus,
                        // autovalidate: isError ? true : false,
                        textInputAction: TextInputAction.next,
                        keyboardType: TextInputType.number,
                        textAlign: TextAlign.center,
                        onFieldSubmitted: (_) {},
                        validator: (enteredText) {
                          return null;
                        },
                        onChanged: (firstName) {},
                        onSaved: (val) {},
                        decoration: kTextFieldform.copyWith(
                          prefixIcon: const Icon(Icons.phone),
                          hintText: "Enter Phone Number",
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            const SizedBox(height: 20),
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
                prefixIcon: const Icon(Icons.email),
                hintText: "Enter Email Address",
              ),
            ),
            const SizedBox(height: 20),
            TextFormField(
              // focusNode: _passFocus,
              textInputAction: widget.model.authMode == AuthMode.LOGIN
                  ? TextInputAction.done
                  : TextInputAction.next,
              keyboardType: TextInputType.text,
              // obscureText: showPass ? false : true,
              textAlign: TextAlign.center,
              onSaved: (val) {},
              validator: (enteredText) {
                return null;
              },
              decoration: kTextFieldform.copyWith(
                prefixIcon: const Icon(Icons.lock),
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
            if (widget.model.authMode == AuthMode.SIGNUP)
              const SizedBox(height: 20),
            if (widget.model.authMode == AuthMode.SIGNUP)
              FadeTransition(
                opacity: widget.model.opacityAnim!,
                child: SlideTransition(
                  position: widget.model.slideAnimation!,
                  child: TextFormField(
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
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          // showPass
                          true
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                        ),
                        onPressed: () {},
                      ),
                      hintText: "Confirm Password",
                    ),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }
}
