import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'nothing_model.dart';
export 'nothing_model.dart';

class NothingWidget extends StatefulWidget {
  const NothingWidget({super.key});

  @override
  State<NothingWidget> createState() => _NothingWidgetState();
}

class _NothingWidgetState extends State<NothingWidget> {
  late NothingModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => NothingModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
        color: FlutterFlowTheme.of(context).secondaryBackground,
      ),
      child: Container(
        width: 100.0,
        height: 200.0,
        decoration: BoxDecoration(
          color: FlutterFlowTheme.of(context).secondaryBackground,
        ),
        child: Align(
          alignment: const AlignmentDirectional(0.0, 0.0),
          child: Text(
            'NOTHING TO SHOW',
            style: FlutterFlowTheme.of(context).headlineLarge.override(
                  fontFamily: 'Poppins',
                  letterSpacing: 0.0,
                ),
          ),
        ),
      ),
    );
  }
}
