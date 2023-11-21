import '/backend/api_requests/api_calls.dart';
import '/custom_components/custom_components_util.dart';
import '/custom_components/form_field_controller.dart';
import 'matricula_widget.dart' show MatriculaWidget;
import 'package:flutter/material.dart';
import 'package:mask_text_input_formatter/mask_text_input_formatter.dart';

class MatriculaModel extends CustomModel<MatriculaWidget> {
  ///  Local state fields for this page.

  Color? selecionaItem;

  ///  State fields for stateful widgets in this page.

  final unfocusNode = FocusNode();
  // State field(s) for EscolherServ widget.
  String? escolherServValue;
  FormFieldController<String>? escolherServValueController;
  // State field(s) for NomeComp1 widget.
  FocusNode? nomeComp1FocusNode;
  TextEditingController? nomeComp1Controller;
  String? Function(BuildContext, String?)? nomeComp1ControllerValidator;
  // State field(s) for Idade1 widget.
  FocusNode? idade1FocusNode;
  TextEditingController? idade1Controller;
  String? Function(BuildContext, String?)? idade1ControllerValidator;
  // State field(s) for E-mail1 widget.
  FocusNode? eMail1FocusNode;
  TextEditingController? eMail1Controller;
  String? Function(BuildContext, String?)? eMail1ControllerValidator;
  // State field(s) for Fone1 widget.
  FocusNode? fone1FocusNode;
  TextEditingController? fone1Controller;
  final fone1Mask = MaskTextInputFormatter(mask: '(##)#####-####');
  String? Function(BuildContext, String?)? fone1ControllerValidator;
  // State field(s) for senha1 widget.
  FocusNode? senha1FocusNode;
  TextEditingController? senha1Controller;
  late bool senha1Visibility;
  String? Function(BuildContext, String?)? senha1ControllerValidator;
  // State field(s) for confirmsenha1 widget.
  FocusNode? confirmsenha1FocusNode;
  TextEditingController? confirmsenha1Controller;
  late bool confirmsenha1Visibility;
  String? Function(BuildContext, String?)? confirmsenha1ControllerValidator;
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

  @override
  void initState(BuildContext context) {
    senha1Visibility = false;
    confirmsenha1Visibility = false;
  }

  @override
  void dispose() {
    unfocusNode.dispose();
    nomeComp1FocusNode?.dispose();
    nomeComp1Controller?.dispose();

    idade1FocusNode?.dispose();
    idade1Controller?.dispose();

    eMail1FocusNode?.dispose();
    eMail1Controller?.dispose();

    fone1FocusNode?.dispose();
    fone1Controller?.dispose();

    senha1FocusNode?.dispose();
    senha1Controller?.dispose();

    confirmsenha1FocusNode?.dispose();
    confirmsenha1Controller?.dispose();

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
}
