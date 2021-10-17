// ignore_for_file: file_names

import 'package:app/common/enums/view_state.dart';
import 'package:app/common/styles/textfield-form.dart';
import 'package:app/common/utils/validator.dart';
import 'package:app/domain/services/locator.dart';
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
                        validator: (firstname) {
                          if (firstname!.isEmpty) {
                            return 'Please enter first name';
                          }
                          return null;
                        },
                        // onChanged: (firstName) {},
                        onSaved: (firstName) {
                          widget.model.setUserModelObj(
                            widget.model.userModel
                                .copyWith(firstName: firstName),
                          );
                        },
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
                        // onFieldSubmitted: (_) {},
                        validator: (lastName) {
                          if (lastName!.isEmpty) {
                            return 'Please enter your last Name';
                          }
                          return null;
                        },
                        // onChanged: (firstName) {},
                        onSaved: (lastName) {
                          widget.model.setUserModelObj(
                            widget.model.userModel
                                .copyWith(firstName: lastName),
                          );
                        },
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
                        // onFieldSubmitted: (_) {},
                        validator: (number) {
                          if (number!.isEmpty) {
                            return 'Please Enter Phone number';
                          } else if (!number.isValidPhoneNumber()) {
                            return 'Phone number must be in the form: (area code) ### - ####';
                          }
                          return null;
                        },
                        // onChanged: (firstName) {},
                        onSaved: (number) {
                          widget.model.setUserModelObj(
                            widget.model.userModel
                                .copyWith(phoneNumber: number),
                          );
                        },
                        decoration: kTextFieldform.copyWith(
                          prefixIcon: const Icon(Icons.phone),
                          hintText: "#-###-###-####",
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
              // onFieldSubmitted: (_) {},
              validator: (String? email) {
                if (email!.isEmpty) {
                  return 'Email address must not be empty';
                } else if (!email.isValidEmail()) {
                  return 'You have entered invalid Email.';
                }
                return null;
              },
              // onChanged: (email) {},
              onSaved: (email) {
                widget.model.setUserModelObj(
                  widget.model.userModel.copyWith(email: email),
                );
              },
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
              obscureText: widget.model.showPassword ? false : true,
              textAlign: TextAlign.center,
              onSaved: (val) {},
              validator: (enteredText) {
                return null;
              },
              decoration: kTextFieldform.copyWith(
                prefixIcon: const Icon(Icons.lock),
                suffixIcon: IconButton(
                  icon: Icon(
                    widget.model.showPassword
                        ? Icons.visibility_rounded
                        : Icons.visibility_off_rounded,
                  ),
                  onPressed: widget.model.togglePassword,
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
                    validator: (confirm) {
                      if (confirm!.isEmpty) {
                        return 'Please confirm your password';
                      } else if (confirm != widget.model.userModel.password) {
                        return "confirm Password does not match with entered password";
                      }
                      return null;
                    },
                    obscureText:
                        widget.model.showConfirmedPassword ? false : true,
                    decoration: kTextFieldform.copyWith(
                      prefixIcon: const Icon(Icons.lock),
                      suffixIcon: IconButton(
                        icon: Icon(
                          widget.model.showConfirmedPassword
                              ? Icons.visibility_rounded
                              : Icons.visibility_off_rounded,
                        ),
                        onPressed: widget.model.toggleConfirmedPassword,
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
