import '/components/user/user_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friends_widget.dart' show FriendsWidget;
import 'package:flutter/material.dart';

class FriendsModel extends FlutterFlowModel<FriendsWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldSearchfriends widget.
  FocusNode? textFieldSearchfriendsFocusNode;
  TextEditingController? textFieldSearchfriendsTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchfriendsTextControllerValidator;
  // Model for user component.
  late UserModel userModel;

  @override
  void initState(BuildContext context) {
    userModel = createModel(context, () => UserModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldSearchfriendsFocusNode?.dispose();
    textFieldSearchfriendsTextController?.dispose();

    userModel.dispose();
  }
}
