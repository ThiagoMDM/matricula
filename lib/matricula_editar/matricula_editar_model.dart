import '/backend/api_requests/api_calls.dart';
import '/custom_components/custom_components_util.dart';
import 'matricula_editar_widget.dart' show MatriculaEditarWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MatriculaEditarModel extends CustomModel<MatriculaEditarWidget> {
  ///  Local state fields for this page.

  Color? selecionaItem;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for NomeComp1Update widget.
  FocusNode? nomeComp1UpdateFocusNode;
  TextEditingController? nomeComp1UpdateController;
  String? Function(BuildContext, String?)? nomeComp1UpdateControllerValidator;
  // State field(s) for Idade1Update widget.
  FocusNode? idade1UpdateFocusNode;
  TextEditingController? idade1UpdateController;
  String? Function(BuildContext, String?)? idade1UpdateControllerValidator;
  // State field(s) for E-mail1 widget.
  FocusNode? eMail1FocusNode;
  TextEditingController? eMail1Controller;
  String? Function(BuildContext, String?)? eMail1ControllerValidator;
  // State field(s) for Fone1 widget.
  FocusNode? fone1FocusNode;
  TextEditingController? fone1Controller;
  final fone1Mask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? fone1ControllerValidator;
  // State field(s) for Genero1 widget.
  FocusNode? genero1FocusNode;
  TextEditingController? genero1Controller;
  String? Function(BuildContext, String?)? genero1ControllerValidator;
  // State field(s) for cpf1 widget.
  FocusNode? cpf1FocusNode;
  TextEditingController? cpf1Controller;
  final cpf1Mask = MaskTextInputFormatter(mask: '###.###.###-##');
  String? Function(BuildContext, String?)? cpf1ControllerValidator;
  // State field(s) for DataNascimento1 widget.
  FocusNode? dataNascimento1FocusNode;
  TextEditingController? dataNascimento1Controller;
  final dataNascimento1Mask = MaskTextInputFormatter(mask: '##/##/####');
  String? Function(BuildContext, String?)? dataNascimento1ControllerValidator;
  // State field(s) for Rg1 widget.
  FocusNode? rg1FocusNode;
  TextEditingController? rg1Controller;
  String? Function(BuildContext, String?)? rg1ControllerValidator;
  // State field(s) for CEP1 widget.
  FocusNode? cep1FocusNode;
  TextEditingController? cep1Controller;
  final cep1Mask = MaskTextInputFormatter(mask: '#####-###');
  String? Function(BuildContext, String?)? cep1ControllerValidator;
  // Stores action output result for [Backend Call - API (BuscaCEP)] action in IconButton widget.
  ApiCallResponse? respostaAPI;
  // State field(s) for Rua1 widget.
  FocusNode? rua1FocusNode;
  TextEditingController? rua1Controller;
  String? Function(BuildContext, String?)? rua1ControllerValidator;
  // State field(s) for numero1 widget.
  FocusNode? numero1FocusNode;
  TextEditingController? numero1Controller;
  String? Function(BuildContext, String?)? numero1ControllerValidator;
  // State field(s) for cidade1 widget.
  FocusNode? cidade1FocusNode;
  TextEditingController? cidade1Controller;
  String? Function(BuildContext, String?)? cidade1ControllerValidator;
  // State field(s) for uf1 widget.
  FocusNode? uf1FocusNode;
  TextEditingController? uf1Controller;
  String? Function(BuildContext, String?)? uf1ControllerValidator;

  /// Initialization and disposal methods.

  @override
  void initState(BuildContext context) {}

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeComp1UpdateFocusNode?.dispose();
    nomeComp1UpdateController?.dispose();

    idade1UpdateFocusNode?.dispose();
    idade1UpdateController?.dispose();

    eMail1FocusNode?.dispose();
    eMail1Controller?.dispose();

    fone1FocusNode?.dispose();
    fone1Controller?.dispose();

    genero1FocusNode?.dispose();
    genero1Controller?.dispose();

    cpf1FocusNode?.dispose();
    cpf1Controller?.dispose();

    dataNascimento1FocusNode?.dispose();
    dataNascimento1Controller?.dispose();

    rg1FocusNode?.dispose();
    rg1Controller?.dispose();

    cep1FocusNode?.dispose();
    cep1Controller?.dispose();

    rua1FocusNode?.dispose();
    rua1Controller?.dispose();

    numero1FocusNode?.dispose();
    numero1Controller?.dispose();

    cidade1FocusNode?.dispose();
    cidade1Controller?.dispose();

    uf1FocusNode?.dispose();
    uf1Controller?.dispose();
  }

  /// Action blocks are added here.

  /// Additional helper methods are added here.
}
