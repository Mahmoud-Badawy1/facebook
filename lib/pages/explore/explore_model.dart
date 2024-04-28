import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'explore_widget.dart' show ExploreWidget;
import 'package:flutter/material.dart';

class ExploreModel extends FlutterFlowModel<ExploreWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for TextFieldSearchfriends widget.
  FocusNode? textFieldSearchfriendsFocusNode;
  TextEditingController? textFieldSearchfriendsTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchfriendsTextControllerValidator;
  List<UsersRecord> simpleSearchResults = [];

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    textFieldSearchfriendsFocusNode?.dispose();
    textFieldSearchfriendsTextController?.dispose();
  }
}
