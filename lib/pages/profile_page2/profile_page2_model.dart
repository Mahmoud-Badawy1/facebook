import '/components/nav_menu/nav_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'profile_page2_widget.dart' show ProfilePage2Widget;
import 'package:flutter/material.dart';

class ProfilePage2Model extends FlutterFlowModel<ProfilePage2Widget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  bool isDataUploading = false;
  FFUploadedFile uploadedLocalFile =
      FFUploadedFile(bytes: Uint8List.fromList([]));
  String uploadedFileUrl = '';

  // State field(s) for TabBar widget.
  TabController? tabBarController;
  int get tabBarCurrentIndex =>
      tabBarController != null ? tabBarController!.index : 0;

  // State field(s) for TextFieldSearchfriends widget.
  FocusNode? textFieldSearchfriendsFocusNode;
  TextEditingController? textFieldSearchfriendsTextController;
  String? Function(BuildContext, String?)?
      textFieldSearchfriendsTextControllerValidator;
  // Model for NavMenu component.
  late NavMenuModel navMenuModel;

  @override
  void initState(BuildContext context) {
    navMenuModel = createModel(context, () => NavMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    tabBarController?.dispose();
    textFieldSearchfriendsFocusNode?.dispose();
    textFieldSearchfriendsTextController?.dispose();

    navMenuModel.dispose();
  }
}
