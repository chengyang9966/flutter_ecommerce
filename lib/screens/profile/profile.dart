import 'package:ecommerce/components/drawer.dart';
import 'package:ecommerce/models/profile.dart';
import 'package:ecommerce/reducers/app_reducer.dart';
import 'package:ecommerce/screens/profile/edit_profile_Screen.dart';
import 'package:flutter/material.dart';
import 'package:flutter_redux/flutter_redux.dart';
import '../../constants.dart';

class ProfileScreen extends StatelessWidget {
  const ProfileScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: buildAppBar(context),
        drawer: drawerItem(context),
        body: StoreConnector<AppState, Profile>(
            converter: (store) => store.state.profile,
            builder: (context, list) {
              return Container(
                padding: const EdgeInsets.all(kDefaultPaddin),
                child: ProfileItem(profile: list),
              );
            }));
  }

  AppBar buildAppBar(BuildContext context) {
    return AppBar(
      backgroundColor: Colors.white,
      elevation: 0,
      centerTitle: true,
      title: Text(
        "Profile",
        style: Theme.of(context)
            .textTheme
            .headline5
            ?.copyWith(fontWeight: FontWeight.bold),
      ),
    );
  }
}

class ProfileItem extends StatelessWidget {
  const ProfileItem({Key? key, required this.profile}) : super(key: key);
  final Profile profile;
  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const RowTextForLabel(
          label: 'First Name',
        ),
        RowTextForTitle(
          title: profile.firstName,
        ),
        const SizedBox(height: kDefaultPaddin),
        const RowTextForLabel(
          label: 'Last Name ',
        ),
        RowTextForTitle(
          title: profile.lastName,
        ),
        const SizedBox(height: kDefaultPaddin),
        const RowTextForLabel(
          label: 'Email',
        ),
        RowTextForTitle(
          title: profile.email,
        ),
        const SizedBox(height: kDefaultPaddin),
        const RowTextForLabel(
          label: 'Phone Number',
        ),
        RowTextForTitle(
          title: profile.phoneNumber,
        ),
        const SizedBox(height: kDefaultPaddin),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
                onPressed: () => Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => const EditProfileScreen(),
                      ),
                    ),
                // style: TextButton.styleFrom(
                //     padding: const EdgeInsets.all(kDefaultPaddin / 4),
                //     primary: lighYellowColor,
                //     textStyle: const TextStyle(fontSize: 20),
                //     side: const BorderSide(color: lightGreenColor, width: 1)),
                child: const Text(
                  'Edit',
                  style: TextStyle(
                      color: lightGreenColor, fontSize: kDefaultPaddin),
                )),
          ],
        )
      ],
    );
  }
}

class RowTextForLabel extends StatelessWidget {
  const RowTextForLabel({
    Key? key,
    required this.label,
  }) : super(key: key);
  final String label;
  @override
  Widget build(BuildContext context) {
    return Text(
      label,
      style: const TextStyle(
        fontSize: 16,
        fontWeight: FontWeight.bold,
        color: Colors.grey,
      ),
    );
  }
}

class RowTextForTitle extends StatelessWidget {
  const RowTextForTitle({
    Key? key,
    required this.title,
  }) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Text(
      title,
      style: const TextStyle(
        fontSize: 20,
        fontWeight: FontWeight.bold,
      ),
    );
  }
}
