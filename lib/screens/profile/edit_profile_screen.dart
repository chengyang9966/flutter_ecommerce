// ignore_for_file: file_names

import 'package:ecommerce/components/drawer.dart';
import 'package:ecommerce/components/toast_msg.dart';
import 'package:ecommerce/constants.dart';
import 'package:ecommerce/models/profile.dart';
import 'package:ecommerce/reducers/actions/profile_actions.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import 'package:flutter_svg/svg.dart';

class EditProfileScreen extends StatefulWidget {
  const EditProfileScreen({Key? key}) : super(key: key);

  @override
  _EditProfileScreenState createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  String firstName = '';
  String lastName = '';
  String email = '';
  String phoneNumber = '';
  String password = '';

  final GlobalKey<FormState> _fromKey = GlobalKey<FormState>();
  Widget _buildNameField(String text) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'First Name'),
      maxLength: 10,
      initialValue: text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (String? value) {
        firstName = value!;
      },
    );
  }

  Widget _buildEmailField(String text) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Email'),
      initialValue: text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Email is required';
        }

        if (!RegExp(
                r"[a-z0-9!#$%&'*+/=?^_`{|}~-]+(?:\.[a-z0-9!#$%&'*+/=?^_`{|}~-]+)*@(?:[a-z0-9](?:[a-z0-9-]*[a-z0-9])?\.)+[a-z0-9](?:[a-z0-9-]*[a-z0-9])?")
            .hasMatch(value)) {
          return 'Please enter a valid email Address';
        }

        return null;
      },
      onSaved: (value) {
        email = value!;
      },
    );
  }

  Widget _buildPhoneNumber(String text) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Phone number'),
      initialValue: text,
      keyboardType: TextInputType.phone,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Phone number is Required';
        }

        return null;
      },
      onSaved: (value) {
        phoneNumber = value!;
      },
    );
  }

  Widget _buildLastNameField(String text) {
    return TextFormField(
      decoration: const InputDecoration(labelText: 'Last Name'),
      initialValue: text,
      validator: (value) {
        if (value!.isEmpty) {
          return 'Name is required';
        }
      },
      onSaved: (value) {
        lastName = value!;
      },
    );
  }

  void _onChanged(String value) {
    setState(() => firstName = value);
  }

  @override
  Widget build(BuildContext context) {
    editProfile(int id) {
      StoreProvider.of<AppState>(context).dispatch(EditProfileAction(Profile(
        id: id,
        lastName: lastName,
        email: email,
        firstName: firstName,
        phoneNumber: phoneNumber,
      )));
      toastMessage('Update Profile Successfully');
      Navigator.pop(context);
    }

    return Scaffold(
        resizeToAvoidBottomInset: true,
        appBar: buildAppBar(context),
        drawer: drawerItem(context),
        body: StoreConnector<AppState, Profile>(
            converter: (store) => store.state.profile,
            builder: (context, list) {
              return SingleChildScrollView(
                child: Container(
                  margin: const EdgeInsets.all(kDefaultPaddin / 2),
                  child: Form(
                      key: _fromKey,
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: <Widget>[
                          _buildNameField(list.firstName),
                          _buildLastNameField(list.lastName),
                          _buildEmailField(list.email),
                          _buildPhoneNumber(list.phoneNumber),
                          const SizedBox(
                            height: kDefaultPaddin,
                          ),
                          TextButton(
                              onPressed: () {
                                if (!_fromKey.currentState!.validate()) {
                                  return;
                                }
                                _fromKey.currentState!.save();
                                editProfile(list.id);
                              },
                              child: const Text(
                                'Save',
                                style: TextStyle(
                                    color: lightGreenColor,
                                    fontSize: kDefaultPaddin),
                              ))
                        ],
                      )),
                ),
              );
            }));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      leading: IconButton(
        icon: SvgPicture.asset(
          'assets/icons/back.svg',
          color: Colors.black,
        ),
        onPressed: () => Navigator.pop(context),
      ),
      title: Text(
        "Edit Profile",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}
