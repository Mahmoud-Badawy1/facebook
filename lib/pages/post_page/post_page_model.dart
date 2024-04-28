import '/components/add_comment/add_comment_widget.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'post_page_widget.dart' show PostPageWidget;
import 'package:flutter/material.dart';

class PostPageModel extends FlutterFlowModel<PostPageWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // Model for addComment component.
  late AddCommentModel addCommentModel;

  @override
  void initState(BuildContext context) {
    addCommentModel = createModel(context, () => AddCommentModel());
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    addCommentModel.dispose();
  }
}
