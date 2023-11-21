import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/custom_components/custom_components_drop_down.dart';
import '/custom_components/custom_components_icon_button.dart';
import '/custom_components/custom_components_theme.dart';
import '/custom_components/custom_components_util.dart';
import '/custom_components/custom_components_widgets.dart';
import '/custom_components/form_field_controller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'matricula_model.dart';
export 'matricula_model.dart';

class MatriculaWidget extends StatefulWidget {
  const MatriculaWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _MatriculaWidgetState createState() => _MatriculaWidgetState();
}

class _MatriculaWidgetState extends State<MatriculaWidget> {
  late MatriculaModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatriculaModel());

    _model.nomeComp1Controller ??= TextEditingController();
    _model.nomeComp1FocusNode ??= FocusNode();

    _model.idade1Controller ??= TextEditingController();
    _model.idade1FocusNode ??= FocusNode();

    _model.eMail1Controller ??= TextEditingController();
    _model.eMail1FocusNode ??= FocusNode();

    _model.fone1Controller ??= TextEditingController();
    _model.fone1FocusNode ??= FocusNode();

    _model.senha1Controller ??= TextEditingController();
    _model.senha1FocusNode ??= FocusNode();

    _model.confirmsenha1Controller ??= TextEditingController();
    _model.confirmsenha1FocusNode ??= FocusNode();

    _model.genero1Controller ??= TextEditingController();
    _model.genero1FocusNode ??= FocusNode();

    _model.cpf1Controller ??= TextEditingController();
    _model.cpf1FocusNode ??= FocusNode();

    _model.dataNascimento1Controller ??= TextEditingController();
    _model.dataNascimento1FocusNode ??= FocusNode();

    _model.rg1Controller ??= TextEditingController();
    _model.rg1FocusNode ??= FocusNode();

    _model.cep1Controller ??= TextEditingController();
    _model.cep1FocusNode ??= FocusNode();

    _model.rua1Controller ??= TextEditingController();
    _model.rua1FocusNode ??= FocusNode();

    _model.numero1Controller ??= TextEditingController();
    _model.numero1FocusNode ??= FocusNode();

    _model.cidade1Controller ??= TextEditingController();
    _model.cidade1FocusNode ??= FocusNode();

    _model.uf1Controller ??= TextEditingController();
    _model.uf1FocusNode ??= FocusNode();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.dispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    if (isiOS) {
      SystemChrome.setSystemUIOverlayStyle(
        SystemUiOverlayStyle(
          statusBarBrightness: Theme.of(context).brightness,
          systemStatusBarContrastEnforced: true,
        ),
      );
    }

    return GestureDetector(
      onTap: () => _model.unfocusNode.canRequestFocus
          ? FocusScope.of(context).requestFocus(_model.unfocusNode)
          : FocusScope.of(context).unfocus(),
      child: Scaffold(
        key: scaffoldKey,
        backgroundColor: CustomTheme.of(context).secondaryBackground,
        appBar: AppBar(
          backgroundColor: CustomTheme.of(context).primary,
          automaticallyImplyLeading: false,
          title: Align(
            alignment: const AlignmentDirectional(0.00, 0.00),
            child: Text(
              'Matrícula',
              style: CustomTheme.of(context).headlineMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          // ignore: prefer_const_literals_to_create_immutables
          actions: [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            // ignore: prefer_const_constructors
            padding: EdgeInsetsDirectional.fromSTEB(15.0, 30.0, 15.0, 0.0),
            child: StreamBuilder<List<ClientesRecord>>(
              stream: queryClientesRecord(
                singleRecord: true,
              ),
              builder: (context, snapshot) {
                // Customize what your widget looks like when it's loading.
                if (!snapshot.hasData) {
                  return Center(
                    child: SizedBox(
                      width: 50.0,
                      height: 50.0,
                      child: CircularProgressIndicator(
                        valueColor: AlwaysStoppedAnimation<Color>(
                          CustomTheme.of(context).primary,
                        ),
                      ),
                    ),
                  );
                }
                List<ClientesRecord> listViewClientesRecordList =
                    snapshot.data!;
                // Return an empty Container when the item does not exist.
                if (snapshot.data!.isEmpty) {
                  return Container();
                }
                // ignore: unused_local_variable
                final listViewClientesRecord =
                    listViewClientesRecordList.isNotEmpty
                        ? listViewClientesRecordList.first
                        : null;
                return ListView(
                  padding: EdgeInsets.zero,
                  scrollDirection: Axis.vertical,
                  children: [
                    Padding(
                      padding: const EdgeInsetsDirectional.fromSTEB(
                          0.0, 0.0, 0.0, 10.0),
                      child: StreamBuilder<List<PlanosRecord>>(
                        stream: queryPlanosRecord(
                          singleRecord: true,
                        ),
                        builder: (context, snapshot) {
                          // Customize what your widget looks like when it's loading.
                          if (!snapshot.hasData) {
                            return Center(
                              child: SizedBox(
                                width: 50.0,
                                height: 50.0,
                                child: CircularProgressIndicator(
                                  valueColor: AlwaysStoppedAnimation<Color>(
                                    CustomTheme.of(context).primary,
                                  ),
                                ),
                              ),
                            );
                          }
                          List<PlanosRecord> escolherServPlanosRecordList =
                              snapshot.data!;
                          // Return an empty Container when the item does not exist.
                          if (snapshot.data!.isEmpty) {
                            return Container();
                          }
                          final escolherServPlanosRecord =
                              escolherServPlanosRecordList.isNotEmpty
                                  ? escolherServPlanosRecordList.first
                                  : null;
                          return CustomDropDown<String>(
                            controller: _model.escolherServValueController ??=
                                FormFieldController<String>(null),
                            options: escolherServPlanosRecord!.nome,
                            onChanged: (val) =>
                                setState(() => _model.escolherServValue = val),
                            width: 332.0,
                            height: 50.0,
                            textStyle: CustomTheme.of(context).bodyMedium,
                            hintText: 'Escolha o Plano',
                            icon: Icon(
                              Icons.keyboard_arrow_down_rounded,
                              color: CustomTheme.of(context).secondaryText,
                              size: 24.0,
                            ),
                            fillColor:
                                CustomTheme.of(context).secondaryBackground,
                            elevation: 2.0,
                            borderColor: CustomTheme.of(context).alternate,
                            borderWidth: 2.0,
                            borderRadius: 8.0,
                            margin: const EdgeInsetsDirectional.fromSTEB(
                                16.0, 4.0, 16.0, 4.0),
                            hidesUnderline: true,
                            isSearchable: false,
                            isMultiSelect: false,
                          );
                        },
                      ),
                    ),
                    StreamBuilder<List<ClientesRecord>>(
                      stream: queryClientesRecord(
                        singleRecord: true,
                      ),
                      builder: (context, snapshot) {
                        // Customize what your widget looks like when it's loading.
                        if (!snapshot.hasData) {
                          return Center(
                            child: SizedBox(
                              width: 50.0,
                              height: 50.0,
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  CustomTheme.of(context).primary,
                                ),
                              ),
                            ),
                          );
                        }
                        List<ClientesRecord> columnClientesRecordList =
                            snapshot.data!;
                        // Return an empty Container when the item does not exist.
                        if (snapshot.data!.isEmpty) {
                          return Container();
                        }
                        // ignore: unused_local_variable
                        final columnClientesRecord =
                            columnClientesRecordList.isNotEmpty
                                ? columnClientesRecordList.first
                                : null;
                        return Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.nomeComp1Controller,
                                focusNode: _model.nomeComp1FocusNode,
                                textCapitalization:
                                    TextCapitalization.characters,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Nome Completo',
                                  hintStyle: CustomTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: CustomTheme.of(context).bodyLarge,
                                validator: _model.nomeComp1ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.idade1Controller,
                                focusNode: _model.idade1FocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Idade',
                                  hintStyle: CustomTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    // ignore: prefer_const_constructors
                                    borderSide: BorderSide(
                                      color: const Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    // ignore: prefer_const_constructors
                                    borderSide: BorderSide(
                                      color: const Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: CustomTheme.of(context).bodyLarge,
                                keyboardType: TextInputType.number,
                                validator: _model.idade1ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              // ignore: prefer_const_constructors
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.eMail1Controller,
                                focusNode: _model.eMail1FocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Email',
                                  labelStyle: CustomTheme.of(context).bodyLarge,
                                  hintStyle: CustomTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Space Grotesk',
                                        color: const Color(0xFFFF0101),
                                      ),
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: CustomTheme.of(context).bodyLarge,
                                keyboardType: TextInputType.emailAddress,
                                validator: _model.eMail1ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.fone1Controller,
                                focusNode: _model.fone1FocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Telefone/Whatsapp',
                                  labelStyle: CustomTheme.of(context)
                                      .bodyLarge
                                      .override(
                                        fontFamily: 'Space Grotesk',
                                        color:
                                            CustomTheme.of(context).primaryText,
                                      ),
                                  hintStyle: CustomTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: CustomTheme.of(context).bodyLarge,
                                keyboardType: TextInputType.phone,
                                validator: _model.fone1ControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.fone1Mask],
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.senha1Controller,
                                focusNode: _model.senha1FocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: !_model.senha1Visibility,
                                decoration: InputDecoration(
                                  labelText: 'Crie sua senha',
                                  hintStyle: CustomTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.senha1Visibility =
                                          !_model.senha1Visibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.senha1Visibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color:
                                          CustomTheme.of(context).secondaryText,
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                                style: CustomTheme.of(context).bodyLarge,
                                validator: _model.senha1ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.confirmsenha1Controller,
                                focusNode: _model.confirmsenha1FocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: !_model.confirmsenha1Visibility,
                                decoration: InputDecoration(
                                  labelText: 'Digite novamente sua senha',
                                  hintStyle: CustomTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                  suffixIcon: InkWell(
                                    onTap: () => setState(
                                      () => _model.confirmsenha1Visibility =
                                          !_model.confirmsenha1Visibility,
                                    ),
                                    focusNode: FocusNode(skipTraversal: true),
                                    child: Icon(
                                      _model.confirmsenha1Visibility
                                          ? Icons.visibility_outlined
                                          : Icons.visibility_off_outlined,
                                      color:
                                          CustomTheme.of(context).secondaryText,
                                      size: 22.0,
                                    ),
                                  ),
                                ),
                                style: CustomTheme.of(context).bodyLarge,
                                validator: _model
                                    .confirmsenha1ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.genero1Controller,
                                focusNode: _model.genero1FocusNode,
                                textCapitalization:
                                    TextCapitalization.characters,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Genero',
                                  hintText: 'Genero',
                                  hintStyle: CustomTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: CustomTheme.of(context).bodyLarge,
                                validator: _model.genero1ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.cpf1Controller,
                                focusNode: _model.cpf1FocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'CPF',
                                  hintText: 'CPF',
                                  hintStyle: CustomTheme.of(context).bodyLarge,
                                  enabledBorder: OutlineInputBorder(
                                    borderSide: BorderSide(
                                      color: CustomTheme.of(context).alternate,
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  errorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  focusedErrorBorder: OutlineInputBorder(
                                    borderSide: const BorderSide(
                                      color: Color(0x00000000),
                                      width: 2.0,
                                    ),
                                    borderRadius: BorderRadius.circular(12.0),
                                  ),
                                  contentPadding:
                                      const EdgeInsetsDirectional.fromSTEB(
                                          20.0, 24.0, 20.0, 24.0),
                                ),
                                style: CustomTheme.of(context).bodyLarge,
                                keyboardType: TextInputType.number,
                                validator: _model.cpf1ControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.cpf1Mask],
                              ),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: TextFormField(
                                      controller:
                                          _model.dataNascimento1Controller,
                                      focusNode:
                                          _model.dataNascimento1FocusNode,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Data de Nascimento',
                                        hintText: 'Data de Nascimento',
                                        hintStyle:
                                            CustomTheme.of(context).bodyLarge,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: CustomTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(
                                                20.0, 24.0, 20.0, 24.0),
                                      ),
                                      style: CustomTheme.of(context).bodyLarge,
                                      keyboardType: TextInputType.datetime,
                                      validator: _model
                                          .dataNascimento1ControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [
                                        _model.dataNascimento1Mask
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.rg1Controller,
                                      focusNode: _model.rg1FocusNode,
                                      textInputAction: TextInputAction.next,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Identidade',
                                        hintText: 'RG',
                                        hintStyle:
                                            CustomTheme.of(context).bodyLarge,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: CustomTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(
                                                20.0, 24.0, 20.0, 24.0),
                                      ),
                                      style: CustomTheme.of(context).bodyLarge,
                                      validator: _model.rg1ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.cep1Controller,
                                      focusNode: _model.cep1FocusNode,
                                      textInputAction: TextInputAction.send,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'CEP',
                                        hintText: 'CEP',
                                        hintStyle:
                                            CustomTheme.of(context).bodyLarge,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: CustomTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(
                                                20.0, 24.0, 20.0, 24.0),
                                      ),
                                      style: CustomTheme.of(context).bodyLarge,
                                      keyboardType: TextInputType.number,
                                      validator: _model.cep1ControllerValidator
                                          .asValidator(context),
                                      inputFormatters: [_model.cep1Mask],
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      0.0, 0.0, 0.0, 16.0),
                                  child: CustomIconButton(
                                    borderColor:
                                        CustomTheme.of(context).primary,
                                    borderRadius: 20.0,
                                    borderWidth: 1.0,
                                    buttonSize: 40.0,
                                    fillColor: const Color(0xFFCE272A),
                                    icon: const Icon(
                                      Icons.check_rounded,
                                      color: Colors.white,
                                      size: 24.0,
                                    ),
                                    onPressed: () async {
                                      _model.respostaAPI =
                                          await BuscaCEPCall.call(
                                        cepbuscado: _model.cep1Controller.text,
                                      );
                                      setState(() {
                                        _model.rua1Controller?.text =
                                            '${BuscaCEPCall.rua(
                                          (_model.respostaAPI?.jsonBody ?? ''),
                                        ).toString()}, ${BuscaCEPCall.bairro(
                                          (_model.respostaAPI?.jsonBody ?? ''),
                                        ).toString()}';
                                      });
                                      setState(() {
                                        _model.numero1Controller?.text =
                                            BuscaCEPCall.numero(
                                          (_model.respostaAPI?.jsonBody ?? ''),
                                        ).toString();
                                      });
                                      setState(() {
                                        _model.cidade1Controller?.text =
                                            BuscaCEPCall.cidade(
                                          (_model.respostaAPI?.jsonBody ?? ''),
                                        ).toString();
                                      });
                                      setState(() {
                                        _model.uf1Controller?.text =
                                            BuscaCEPCall.estado(
                                          (_model.respostaAPI?.jsonBody ?? ''),
                                        ).toString();
                                      });

                                      setState(() {});
                                    },
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Flexible(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: SizedBox(
                                      width: double.infinity,
                                      child: TextFormField(
                                        controller: _model.rua1Controller,
                                        focusNode: _model.rua1FocusNode,
                                        textCapitalization:
                                            TextCapitalization.characters,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Rua/Bairro',
                                          hintText: 'Rua/Bairro',
                                          hintStyle:
                                              CustomTheme.of(context).bodyLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: CustomTheme.of(context)
                                                  .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                        ),
                                        style:
                                            CustomTheme.of(context).bodyLarge,
                                        validator: _model
                                            .rua1ControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                                Align(
                                  alignment:
                                      const AlignmentDirectional(1.00, 0.00),
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: SizedBox(
                                      width: MediaQuery.sizeOf(context).width *
                                          0.4,
                                      child: TextFormField(
                                        controller: _model.numero1Controller,
                                        focusNode: _model.numero1FocusNode,
                                        textCapitalization:
                                            TextCapitalization.none,
                                        obscureText: false,
                                        decoration: InputDecoration(
                                          labelText: 'Número',
                                          hintText: 'Número',
                                          hintStyle:
                                              CustomTheme.of(context).bodyLarge,
                                          enabledBorder: OutlineInputBorder(
                                            borderSide: BorderSide(
                                              color: CustomTheme.of(context)
                                                  .alternate,
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          errorBorder: OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          focusedErrorBorder:
                                              OutlineInputBorder(
                                            borderSide: const BorderSide(
                                              color: Color(0x00000000),
                                              width: 2.0,
                                            ),
                                            borderRadius:
                                                BorderRadius.circular(12.0),
                                          ),
                                          contentPadding:
                                              const EdgeInsetsDirectional
                                                  .fromSTEB(
                                                  20.0, 24.0, 20.0, 24.0),
                                        ),
                                        style:
                                            CustomTheme.of(context).bodyLarge,
                                        keyboardType: TextInputType.number,
                                        validator: _model
                                            .numero1ControllerValidator
                                            .asValidator(context),
                                      ),
                                    ),
                                  ),
                                ),
                              ].divide(const SizedBox(width: 1.0)),
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.cidade1Controller,
                                      focusNode: _model.cidade1FocusNode,
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Cidade',
                                        hintText: 'Cidade',
                                        hintStyle:
                                            CustomTheme.of(context).bodyLarge,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: CustomTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(
                                                20.0, 24.0, 20.0, 24.0),
                                      ),
                                      style: CustomTheme.of(context).bodyLarge,
                                      keyboardType: TextInputType.phone,
                                      validator: _model
                                          .cidade1ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 0.0, 0.0, 16.0),
                                    child: TextFormField(
                                      controller: _model.uf1Controller,
                                      focusNode: _model.uf1FocusNode,
                                      textCapitalization:
                                          TextCapitalization.characters,
                                      obscureText: false,
                                      decoration: InputDecoration(
                                        labelText: 'Estado',
                                        hintText: 'Estado',
                                        hintStyle:
                                            CustomTheme.of(context).bodyLarge,
                                        enabledBorder: OutlineInputBorder(
                                          borderSide: BorderSide(
                                            color: CustomTheme.of(context)
                                                .alternate,
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        errorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        focusedErrorBorder: OutlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 2.0,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(12.0),
                                        ),
                                        contentPadding:
                                            const EdgeInsetsDirectional
                                                .fromSTEB(
                                                20.0, 24.0, 20.0, 24.0),
                                      ),
                                      style: CustomTheme.of(context).bodyLarge,
                                      keyboardType: TextInputType.streetAddress,
                                      validator: _model.uf1ControllerValidator
                                          .asValidator(context),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 20.0),
                                  child: CustomButtonWidget(
                                    onPressed: () async {
                                      await ClientesRecord.collection
                                          .doc()
                                          .set(createClientesRecordData(
                                            nome:
                                                _model.nomeComp1Controller.text,
                                            idade: double.tryParse(
                                                _model.idade1Controller.text),
                                            telefone:
                                                _model.fone1Controller.text,
                                            email: _model.eMail1Controller.text,
                                            pgto: false,
                                            ctoStatus: true,
                                            genero:
                                                _model.genero1Controller.text,
                                            dataNasc: _model
                                                .dataNascimento1Controller.text,
                                            cidade:
                                                _model.cidade1Controller.text,
                                            cpf: _model.cpf1Controller.text,
                                            rg: _model.rg1Controller.text,
                                            endereco:
                                                _model.rua1Controller.text,
                                            cep: _model.cep1Controller.text,
                                            uf: _model.uf1Controller.text,
                                            numero:
                                                _model.numero1Controller.text,
                                            planoOption:
                                                _model.escolherServValue,
                                          ));

                                      // ignore: use_build_context_synchronously
                                      context.pushNamed('ListadeMatriculados');
                                    },
                                    text: 'Salvar e Avançar',
                                    options: CustomButtonOptions(
                                      width: 150.0,
                                      height: 40.0,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFFFF0101),
                                      textStyle: CustomTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Space Grotesk',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                                Padding(
                                  padding: const EdgeInsetsDirectional.fromSTEB(
                                      10.0, 0.0, 0.0, 20.0),
                                  child: CustomButtonWidget(
                                    onPressed: () async {
                                      context.pushNamed('ListadeMatriculados');
                                    },
                                    text: 'Ver Matriculados',
                                    options: CustomButtonOptions(
                                      width: 150.0,
                                      height: 40.0,
                                      padding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              24.0, 0.0, 24.0, 0.0),
                                      iconPadding:
                                          const EdgeInsetsDirectional.fromSTEB(
                                              0.0, 0.0, 0.0, 0.0),
                                      color: const Color(0xFFFF0101),
                                      textStyle: CustomTheme.of(context)
                                          .titleSmall
                                          .override(
                                            fontFamily: 'Space Grotesk',
                                            color: Colors.white,
                                          ),
                                      elevation: 3.0,
                                      borderSide: const BorderSide(
                                        color: Colors.transparent,
                                        width: 1.0,
                                      ),
                                      borderRadius: BorderRadius.circular(8.0),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
