import '/backend/api_requests/api_calls.dart';
import '/backend/backend.dart';
import '/custom_components/custom_components_icon_button.dart';
import '/custom_components/custom_components_theme.dart';
import '/custom_components/custom_components_util.dart';
import '/custom_components/custom_components_widgets.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'matricula_editar_model.dart';
export 'matricula_editar_model.dart';

class MatriculaEditarWidget extends StatefulWidget {
  const MatriculaEditarWidget({
    super.key,
    required this.cadastro,
  });

  final ClientesRecord? cadastro;

  @override
  // ignore: library_private_types_in_public_api
  _MatriculaEditarWidgetState createState() => _MatriculaEditarWidgetState();
}

class _MatriculaEditarWidgetState extends State<MatriculaEditarWidget> {
  late MatriculaEditarModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => MatriculaEditarModel());

    _model.nomeComp1UpdateController ??=
        TextEditingController(text: widget.cadastro?.nome);
    _model.nomeComp1UpdateFocusNode ??= FocusNode();

    _model.idade1UpdateController ??=
        TextEditingController(text: widget.cadastro?.idade.toString());
    _model.idade1UpdateFocusNode ??= FocusNode();

    _model.eMail1Controller ??=
        TextEditingController(text: widget.cadastro?.email);
    _model.eMail1FocusNode ??= FocusNode();

    _model.fone1Controller ??=
        TextEditingController(text: widget.cadastro?.telefone);
    _model.fone1FocusNode ??= FocusNode();

    _model.genero1Controller ??=
        TextEditingController(text: widget.cadastro?.genero);
    _model.genero1FocusNode ??= FocusNode();

    _model.cpf1Controller ??= TextEditingController(text: widget.cadastro?.cpf);
    _model.cpf1FocusNode ??= FocusNode();

    _model.dataNascimento1Controller ??=
        TextEditingController(text: widget.cadastro?.dataNasc);
    _model.dataNascimento1FocusNode ??= FocusNode();

    _model.rg1Controller ??= TextEditingController(text: widget.cadastro?.rg);
    _model.rg1FocusNode ??= FocusNode();

    _model.cep1Controller ??= TextEditingController(text: widget.cadastro?.cep);
    _model.cep1FocusNode ??= FocusNode();

    _model.rua1Controller ??=
        TextEditingController(text: widget.cadastro?.endereco);
    _model.rua1FocusNode ??= FocusNode();

    _model.numero1Controller ??=
        TextEditingController(text: widget.cadastro?.numero);
    _model.numero1FocusNode ??= FocusNode();

    _model.cidade1Controller ??=
        TextEditingController(text: widget.cadastro?.cidade);
    _model.cidade1FocusNode ??= FocusNode();

    _model.uf1Controller ??= TextEditingController(text: widget.cadastro?.uf);
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
            // ignore: prefer_const_constructors
            alignment: AlignmentDirectional(0.00, 0.00),
            child: Text(
              'Matrícula',
              style: CustomTheme.of(context).headlineMedium.override(
                    fontFamily: 'Plus Jakarta Sans',
                    color: Colors.white,
                    fontSize: 22.0,
                  ),
            ),
          ),
          actions: const [],
          centerTitle: false,
          elevation: 2.0,
        ),
        body: SafeArea(
          top: true,
          child: Padding(
            padding:
                const EdgeInsetsDirectional.fromSTEB(20.0, 20.0, 20.0, 0.0),
            child: StreamBuilder<ClientesRecord>(
              stream: ClientesRecord.getDocument(widget.cadastro!.reference),
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
                // ignore: unused_local_variable
                final columnClientesRecord = snapshot.data!;
                return SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
                        child: TextFormField(
                          controller: _model.nomeComp1UpdateController,
                          focusNode: _model.nomeComp1UpdateFocusNode,
                          textCapitalization: TextCapitalization.characters,
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
                          validator: _model.nomeComp1UpdateControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
                        child: TextFormField(
                          controller: _model.idade1UpdateController,
                          focusNode: _model.idade1UpdateFocusNode,
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
                          validator: _model.idade1UpdateControllerValidator
                              .asValidator(context),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsetsDirectional.fromSTEB(
                            0.0, 0.0, 0.0, 16.0),
                        child: TextFormField(
                          controller: _model.eMail1Controller,
                          focusNode: _model.eMail1FocusNode,
                          textInputAction: TextInputAction.next,
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Email',
                            labelStyle: CustomTheme.of(context).bodyLarge,
                            hintStyle:
                                CustomTheme.of(context).bodyLarge.override(
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
                                  color: CustomTheme.of(context).primaryText,
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
                          controller: _model.genero1Controller,
                          focusNode: _model.genero1FocusNode,
                          textCapitalization: TextCapitalization.characters,
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.dataNascimento1Controller,
                                focusNode: _model.dataNascimento1FocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Data de Nascimento',
                                  hintText: 'Data de Nascimento',
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
                                keyboardType: TextInputType.datetime,
                                validator: _model
                                    .dataNascimento1ControllerValidator
                                    .asValidator(context),
                                inputFormatters: [_model.dataNascimento1Mask],
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.rg1Controller,
                                focusNode: _model.rg1FocusNode,
                                textInputAction: TextInputAction.next,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'Identidade',
                                  hintText: 'RG',
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: TextFormField(
                                controller: _model.cep1Controller,
                                focusNode: _model.cep1FocusNode,
                                textInputAction: TextInputAction.send,
                                obscureText: false,
                                decoration: InputDecoration(
                                  labelText: 'CEP',
                                  hintText: 'CEP',
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
                              borderColor: CustomTheme.of(context).primary,
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
                                _model.respostaAPI = await BuscaCEPCall.call(
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
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
                                        color:
                                            CustomTheme.of(context).alternate,
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
                                  validator: _model.rua1ControllerValidator
                                      .asValidator(context),
                                ),
                              ),
                            ),
                          ),
                          Align(
                            alignment: const AlignmentDirectional(1.00, 0.00),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 0.0, 16.0),
                              child: SizedBox(
                                width: MediaQuery.sizeOf(context).width * 0.4,
                                child: TextFormField(
                                  controller: _model.numero1Controller,
                                  focusNode: _model.numero1FocusNode,
                                  textCapitalization: TextCapitalization.none,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Número',
                                    hintText: 'Número',
                                    hintStyle:
                                        CustomTheme.of(context).bodyLarge,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color:
                                            CustomTheme.of(context).alternate,
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
                                  validator: _model.numero1ControllerValidator
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
                              padding: const EdgeInsetsDirectional.fromSTEB(
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
                                validator: _model.cidade1ControllerValidator
                                    .asValidator(context),
                              ),
                            ),
                          ),
                          Expanded(
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
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
                                await widget.cadastro!.reference
                                    .update(createClientesRecordData(
                                  nome: _model.nomeComp1UpdateController.text,
                                  idade: double.tryParse(
                                      _model.idade1UpdateController.text),
                                  email: _model.eMail1Controller.text,
                                  ctoStatus: false,
                                  telefone: _model.fone1Controller.text,
                                  genero: _model.genero1Controller.text,
                                  dataNasc:
                                      _model.dataNascimento1Controller.text,
                                  cidade: _model.cidade1Controller.text,
                                  cpf: _model.cpf1Controller.text,
                                  rg: _model.rg1Controller.text,
                                  endereco: _model.rua1Controller.text,
                                  cep: _model.cep1Controller.text,
                                  uf: _model.uf1Controller.text,
                                  nomeResp: '',
                                  numero: _model.numero1Controller.text,
                                ));

                                // ignore: use_build_context_synchronously
                                context.pushNamed('ListadeMatriculados');
                              },
                              text: 'ATUALIZAR',
                              options: CustomButtonOptions(
                                width: 150.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFFF0101),
                                textStyle:
                                    CustomTheme.of(context).titleSmall.override(
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
                                await widget.cadastro!.reference.delete();

                                // ignore: use_build_context_synchronously
                                context.pushNamed('ListadeMatriculados');
                              },
                              text: 'DELETAR',
                              options: CustomButtonOptions(
                                width: 150.0,
                                height: 40.0,
                                padding: const EdgeInsetsDirectional.fromSTEB(
                                    24.0, 0.0, 24.0, 0.0),
                                iconPadding:
                                    const EdgeInsetsDirectional.fromSTEB(
                                        0.0, 0.0, 0.0, 0.0),
                                color: const Color(0xFFA52525),
                                textStyle:
                                    CustomTheme.of(context).titleSmall.override(
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
                  ),
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
