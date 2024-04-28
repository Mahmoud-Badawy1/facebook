import '/components/nav_menu/nav_menu_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'friends_page_widget.dart' show FriendsPageWidget;
import 'package:flutter/material.dart';

class FriendsPageModel extends FlutterFlowModel<FriendsPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for NavMenu component.
  late NavMenuModel navMenuModel;

  @override
  void initState(BuildContext context) {
    navMenuModel = createModel(context, () => NavMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    navMenuModel.dispose();
  }
}
