import '../backend/backend.dart';
import '../detail_vetement/detail_vetement_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

class AcheterWidget extends StatefulWidget {
  const AcheterWidget({Key key}) : super(key: key);

  @override
  _AcheterWidgetState createState() => _AcheterWidgetState();
}

class _AcheterWidgetState extends State<AcheterWidget> {
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Color(0xFFF5F5F5),
      body: SafeArea(
        child: Stack(
          children: [
            Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                SingleChildScrollView(
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(15, 40, 0, 0),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              'Produits',
                              style: FlutterFlowTheme.bodyText1,
                            )
                          ],
                        ),
                      )
                    ],
                  ),
                )
              ],
            ),
            Align(
              alignment: AlignmentDirectional(0, 0),
              child: Padding(
                padding: EdgeInsetsDirectional.fromSTEB(0, 100, 0, 0),
                child: StreamBuilder<List<ProductsRecord>>(
                  stream: queryProductsRecord(),
                  builder: (context, snapshot) {
                    // Customize what your widget looks like when it's loading.
                    if (!snapshot.hasData) {
                      return Center(
                        child: SizedBox(
                          width: 50,
                          height: 50,
                          child: CircularProgressIndicator(
                            color: FlutterFlowTheme.primaryColor,
                          ),
                        ),
                      );
                    }
                    List<ProductsRecord> listViewProductsRecordList =
                        snapshot.data;
                    return ListView.builder(
                      padding: EdgeInsets.zero,
                      scrollDirection: Axis.vertical,
                      itemCount: listViewProductsRecordList.length,
                      itemBuilder: (context, listViewIndex) {
                        final listViewProductsRecord =
                            listViewProductsRecordList[listViewIndex];
                        return Padding(
                          padding: EdgeInsetsDirectional.fromSTEB(0, 0, 0, 30),
                          child: Card(
                            clipBehavior: Clip.antiAliasWithSaveLayer,
                            color: Color(0xFFF5F5F5),
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                color: Color(0xFFEEEEEE),
                              ),
                              child: SingleChildScrollView(
                                scrollDirection: Axis.horizontal,
                                child: Row(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Image.network(
                                      listViewProductsRecord.image,
                                      width: 200,
                                      height: 100,
                                      fit: BoxFit.cover,
                                    ),
                                    Column(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        AutoSizeText(
                                          listViewProductsRecord.titre
                                              .maybeHandleOverflow(
                                            maxChars: 23,
                                            replacement: '…',
                                          ),
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                        AutoSizeText(
                                          listViewProductsRecord.taille,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                        AutoSizeText(
                                          listViewProductsRecord.prix,
                                          textAlign: TextAlign.center,
                                          style: FlutterFlowTheme.bodyText1,
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  40, 10, 0, 0),
                                          child: FFButtonWidget(
                                            onPressed: () async {
                                              await Navigator.push(
                                                context,
                                                PageTransition(
                                                  type: PageTransitionType
                                                      .leftToRight,
                                                  duration: Duration(
                                                      milliseconds: 300),
                                                  reverseDuration: Duration(
                                                      milliseconds: 300),
                                                  child: DetailVetementWidget(
                                                    detailTitre:
                                                        listViewProductsRecord
                                                            .reference,
                                                    detailImage:
                                                        listViewProductsRecord
                                                            .reference,
                                                    detailPrix:
                                                        listViewProductsRecord
                                                            .reference,
                                                    detailTaille:
                                                        listViewProductsRecord
                                                            .reference,
                                                    detailDescription:
                                                        listViewProductsRecord
                                                            .reference,
                                                    detailMarque:
                                                        listViewProductsRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                            text: 'Voir',
                                            options: FFButtonOptions(
                                              width: 70,
                                              height: 20,
                                              color: Color(0xFF2B2727),
                                              textStyle: FlutterFlowTheme
                                                  .subtitle2
                                                  .override(
                                                fontFamily: 'Poppins',
                                                color: Colors.white,
                                                fontWeight: FontWeight.normal,
                                              ),
                                              borderSide: BorderSide(
                                                color: Colors.transparent,
                                                width: 1,
                                              ),
                                              borderRadius: 20,
                                            ),
                                          ),
                                        )
                                      ],
                                    )
                                  ],
                                ),
                              ),
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
