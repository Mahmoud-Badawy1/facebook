import '/flutter_flow/flutter_flow_util.dart';
import '/flutter_flow/form_field_controller.dart';
import 'add_post_widget.dart' show AddPostWidget;
import 'package:flutter/material.dart';

class AddPostModel extends FlutterFlowModel<AddPostWidget> {
  ///  Local state fields for this component.

  List<String> imageUrl = [];
  void addToImageUrl(String item) => imageUrl.add(item);
  void removeFromImageUrl(String item) => imageUrl.remove(item);
  void removeAtIndexFromImageUrl(int index) => imageUrl.removeAt(index);
  void insertAtIndexInImageUrl(int index, String item) =>
      imageUrl.insert(index, item);
  void updateImageUrlAtIndex(int index, Function(String) updateFn) =>
      imageUrl[index] = updateFn(imageUrl[index]);

  ///  State fields for stateful widgets in this component.

  final formKey = GlobalKey<FormState>();
  // State field(s) for TextField widget.
  FocusNode? textFieldFocusNode;
  TextEditingController? textController;
  String? Function(BuildContext, String?)? textControllerValidator;
  String? _textControllerValidator(BuildContext context, String? val) {
    if (val == null || val.isEmpty) {
      return 'Field is required';
    }

    return null;
  }

  bool isDataUploading = false;
  List<FFUploadedFile> uploadedLocalFiles = [];
  List<String> uploadedFileUrls = [];

  // State field(s) for DropDown widget.
  String? dropDownValue;
  FormFieldController<String>? dropDownValueController;

  @override
  void initState(BuildContext context) {
    textControllerValidator = _textControllerValidator;
  }

  @override
  void dispose() {
    textFieldFocusNode?.dispose();
    textController?.dispose();
  }
}
