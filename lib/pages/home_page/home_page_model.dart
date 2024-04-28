import '/components/add_post/add_post_widget.dart';
import '/components/nav_menu/nav_menu_widget.dart';
import '/components/stories/stories_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'home_page_widget.dart' show HomePageWidget;
import 'package:flutter/material.dart';

class HomePageModel extends FlutterFlowModel<HomePageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for AddPost component.
  late AddPostModel addPostModel;
  // Model for Stories component.
  late StoriesModel storiesModel;
  // Model for NavMenu component.
  late NavMenuModel navMenuModel;

  @override
  void initState(BuildContext context) {
    addPostModel = createModel(context, () => AddPostModel());
    storiesModel = createModel(context, () => StoriesModel());
    navMenuModel = createModel(context, () => NavMenuModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addPostModel.dispose();
    storiesModel.dispose();
    navMenuModel.dispose();
  }
}
