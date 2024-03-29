// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

import '../../../models/user_model_mxh.dart';
import '../widget/user_profile.dart';

class UserProfileView extends ConsumerWidget {
  static route(UserModelMxh userModel) => MaterialPageRoute(
        builder: (context) => UserProfileView(
          userModel: userModel,
        ),
      );
  final UserModelMxh userModel;
  UserProfileView({
    required this.userModel,
  });

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(body: UserProfile(user: userModel));
  }
}
