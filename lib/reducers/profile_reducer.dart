import 'package:ecommerce/models/profile.dart';
import 'package:ecommerce/reducers/actions/profile_actions.dart';
import 'package:redux/redux.dart';

Profile profileReducer(Profile profile, dynamic action) {
  if (action is EditProfileAction) {
    return editProfile(profile, action);
  }
  return profile;
}

Profile editProfile(Profile profile, EditProfileAction action) {
  return action.profile;
}
