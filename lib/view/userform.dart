import 'package:flutter/material.dart';
import 'package:flutter_application_1/core/helper.dart';
import 'package:flutter_application_1/core/status_util.dart';
import 'package:flutter_application_1/core/string_const.dart';
import 'package:flutter_application_1/custom_widget/custom_button.dart';
import 'package:flutter_application_1/custom_widget/custom_dropdown.dart';
import 'package:flutter_application_1/custom_widget/custom_textformfield.dart';
import 'package:flutter_application_1/provider/firebase_provider.dart';
import 'package:provider/provider.dart';


class FirebaseForm extends StatefulWidget {
  FirebaseForm({super.key});

  @override
  State<FirebaseForm> createState() => _FirebaseFormState();
}

class _FirebaseFormState extends State<FirebaseForm> {
  final _formKey = GlobalKey<FormState>();
  @override
  
  Widget build(BuildContext context) {
    return Scaffold(
      body: Consumer<FireBaseProvider>(
        builder: (context, firebaseFormProvider, child) => Form(
          key: _formKey,
          child: SingleChildScrollView(
            child: SafeArea(
              child: Column(
                children: [
                  CustomTextformfield(
                    labelText: nameStr,
                    onChanged: (value) {
                      firebaseFormProvider.name = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return nameValidation;
                      }
                      return null;
                    },
                  ),
                  CustomTextformfield(
                    labelText: addressStr,
                    onChanged: (value) {
                      firebaseFormProvider.address = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return addressValidation;
                      }
                      return null;
                    },
                  ),
                  CustomTextformfield(
                    labelText: contactStr,
                    suffixIcon: Icon(Icons.call),
                    onChanged: (value) {
                      firebaseFormProvider.contact = value;
                    },
                    validator: (value) {
                      if (value!.isEmpty) {
                        return contactValidation;
                      } else if (value.length < 10) {
                        return contactValidation;
                      }
                      return null;
                    },
                  ),
                  CustomTextformfield(
                    labelText: passwordStr,
                    onChanged: (value) {
                      firebaseFormProvider.password = value;
                    },
                  ),
                  CustomDropDown(
                    itemList: firebaseFormProvider.genderList,
                    labelText: genderStr,
                    onChanged: (value) {
                      firebaseFormProvider.gender = value;
                    },
                  ),
                  CustomButton(
                    child:
                        firebaseFormProvider.firebaseStatus == StatusUtils.loading
                            ? const CircularProgressIndicator()
                            : Text(submitStr),
                    onPressed: () async {
                      if (_formKey.currentState!.validate()) {
                        await firebaseFormProvider.saveUser();
                        if (firebaseFormProvider.firebaseStatus ==
                            StatusUtils.success) {
                          showSnackbar(context, successStr);
                        } else if (firebaseFormProvider.firebaseStatus ==
                            StatusUtils.error) {
                          showSnackbar(context, failedStr);
                        }
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
    
  }
  
}
