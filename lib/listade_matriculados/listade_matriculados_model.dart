import '/custom_components/custom_components_util.dart';
import 'listade_matriculados_widget.dart' show ListadeMatriculadosWidget;
import 'package:flutter/material.dart';

class ListadeMatriculadosModel extends CustomModel<ListadeMatriculadosWidget> {
  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();

  /// Initialization and disposal methods.

  void initState(BuildContext context) {}

  void dispose() {
    unfocusNode.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
