import '/backend/backend.dart';
import '/custom_components/custom_components_icon_button.dart';
import '/custom_components/custom_components_theme.dart';
import '/custom_components/custom_components_util.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'listade_matriculados_model.dart';
export 'listade_matriculados_model.dart';

class ListadeMatriculadosWidget extends StatefulWidget {
  const ListadeMatriculadosWidget({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _ListadeMatriculadosWidgetState createState() =>
      _ListadeMatriculadosWidgetState();
}

class _ListadeMatriculadosWidgetState extends State<ListadeMatriculadosWidget> {
  late ListadeMatriculadosModel _model;

  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => ListadeMatriculadosModel());

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
        body: SafeArea(
          top: true,
          child: Align(
            // ignore: prefer_const_constructors
            alignment: AlignmentDirectional(0.00, -1.00),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.max,
                children: [
                  StreamBuilder<List<ClientesRecord>>(
                    stream: queryClientesRecord(),
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
                      return ListView.builder(
                        padding: EdgeInsets.zero,
                        shrinkWrap: true,
                        scrollDirection: Axis.vertical,
                        itemCount: listViewClientesRecordList.length,
                        itemBuilder: (context, listViewIndex) {
                          final listViewClientesRecord =
                              listViewClientesRecordList[listViewIndex];
                          return Padding(
                            // ignore: prefer_const_constructors
                            padding: EdgeInsetsDirectional.fromSTEB(
                                10.0, 0.0, 10.0, 0.0),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              children: [
                                Container(
                                  width: 100.0,
                                  height: 100.0,
                                  decoration: BoxDecoration(
                                    color: CustomTheme.of(context)
                                        .secondaryBackground,
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(8.0),
                                    child: Image.network(
                                      'https://thumbs.dreamstime.com/b/%C3%ADcone-no-estilo-liso-do-usu%C3%A1rio-da-pessoa-para-site-ilustra%C3%A7%C3%A3o-vetor-131140097.jpg',
                                      width: 300.0,
                                      height: 200.0,
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Column(
                                    mainAxisSize: MainAxisSize.max,
                                    children: [
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            listViewClientesRecord.nome,
                                            style: CustomTheme.of(context)
                                                .bodyMedium
                                                .override(
                                                  fontFamily: 'Space Grotesk',
                                                  fontSize: 18.0,
                                                  fontWeight: FontWeight.bold,
                                                ),
                                          ),
                                        ],
                                      ),
                                      Row(
                                        mainAxisSize: MainAxisSize.max,
                                        children: [
                                          Text(
                                            listViewClientesRecord.email,
                                            style: CustomTheme.of(context)
                                                .bodyMedium,
                                          ),
                                        ],
                                      ),
                                      Text(
                                        listViewClientesRecord.cidade,
                                        style: CustomTheme.of(context)
                                            .bodyMedium
                                            .override(
                                              fontFamily: 'Space Grotesk',
                                              fontSize: 18.0,
                                            ),
                                      ),
                                      Text(
                                        listViewClientesRecord.telefone,
                                        style:
                                            CustomTheme.of(context).bodyMedium,
                                      ),
                                    ],
                                  ),
                                ),
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Padding(
                                      // ignore: prefer_const_constructors
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: CustomIconButton(
                                        borderColor:
                                            CustomTheme.of(context).primary,
                                        borderRadius: 5.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor:
                                            CustomTheme.of(context).secondary,
                                        icon: Icon(
                                          Icons.edit_note,
                                          color: CustomTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed(
                                            'MatriculaEditar',
                                            queryParameters: {
                                              'cadastro': serializeParam(
                                                listViewClientesRecord,
                                                ParamType.Document,
                                              ),
                                            }.withoutNulls,
                                            extra: <String, dynamic>{
                                              'cadastro':
                                                  listViewClientesRecord,
                                            },
                                          );
                                        },
                                      ),
                                    ),
                                    Padding(
                                      // ignore: prefer_const_constructors
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0.0, 0.0, 10.0, 0.0),
                                      child: CustomIconButton(
                                        borderColor:
                                            CustomTheme.of(context).primary,
                                        borderRadius: 5.0,
                                        borderWidth: 1.0,
                                        buttonSize: 40.0,
                                        fillColor:
                                            CustomTheme.of(context).secondary,
                                        icon: Icon(
                                          Icons.home_outlined,
                                          color: CustomTheme.of(context)
                                              .primaryText,
                                          size: 24.0,
                                        ),
                                        onPressed: () async {
                                          context.pushNamed('Matricula');
                                        },
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                          );
                        },
                      );
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
