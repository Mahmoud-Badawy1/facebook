import '/components/posts/posts_widget.dart';
import '/components/user/user_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page_widget.dart' show ProfilePageWidget;
import 'package:flutter/material.dart';

class ProfilePageModel extends FlutterFlowModel<ProfilePageWidget> {
  ///  State fields for stateful widgets in this component.

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // Model for posts component.
  late PostsModel postsModel;
  // State field(s) for TextFieldSearchfriends widget.
  FocusNode? textFieldSearchfriendsFocusNode;
  TextEditingController? textFieldSearchfriendsTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchfriendsTextControllerValidator;
  // Model for user component.
  late UserModel userModel;

  @override
  void initState(BuildContext context) {
    postsModel = createModel(context, () => PostsModel());
    userModel = createModel(context, () => UserModel());
  }

  @override
  void dispose() {
    tabBarController?.dispose();
    postsModel.dispose();
    textFieldSearchfriendsFocusNode?.dispose();
    textFieldSearchfriendsTextController?.dispose();

    userModel.dispose();
  }
}
