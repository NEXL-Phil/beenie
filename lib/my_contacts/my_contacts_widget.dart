import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/contact_sheet_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:easy_debounce/easy_debounce.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';
import 'package:text_search/text_search.dart';

class MyContactsWidget extends StatefulWidget {
  const MyContactsWidget({Key? key}) : super(key: key);

  @override
  _MyContactsWidgetState createState() => _MyContactsWidgetState();
}

class _MyContactsWidgetState extends State<MyContactsWidget>
    with TickerProviderStateMixin {
  ContactsRecord? newContact;
  var profileURL = '';
  List<ContactsRecord> simpleSearchResults = [];
  TextEditingController? textController;
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      setState(() {
        FFAppState().viewAll = true;
      });
    });

    textController = TextEditingController();
    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
    textController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return StreamBuilder<List<ContactsRecord>>(
      stream: queryContactsRecord(
        parent: currentUserReference,
      ),
      builder: (context, snapshot) {
        // Customize what your widget looks like when it's loading.
        if (!snapshot.hasData) {
          return Center(
            child: SizedBox(
              width: 50,
              height: 50,
              child: CircularProgressIndicator(
                color: FlutterFlowTheme.of(context).primaryColor,
              ),
            ),
          );
        }
        List<ContactsRecord> myContactsContactsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            automaticallyImplyLeading: false,
            leading: FlutterFlowIconButton(
              borderColor: Colors.transparent,
              borderRadius: 30,
              borderWidth: 1,
              buttonSize: 60,
              icon: Icon(
                Icons.arrow_back_rounded,
                color: FlutterFlowTheme.of(context).primaryText,
                size: 30,
              ),
              onPressed: () async {
                context.pushNamed('Home');
              },
            ),
            title: Text(
              'My Contacts',
              style: FlutterFlowTheme.of(context).title3,
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 500,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
                  child: Column(
                    mainAxisSize: MainAxisSize.max,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 4, 16, 0),
                        child: TextFormField(
                          controller: textController,
                          onChanged: (_) => EasyDebounce.debounce(
                            'textController',
                            Duration(milliseconds: 2000),
                            () async {
                              if (textController!.text != null &&
                                  textController!.text != '') {
                                FFAppState().update(() {
                                  FFAppState().viewAll = false;
                                });
                              } else {
                                FFAppState().update(() {
                                  FFAppState().viewAll = true;
                                });
                              }

                              setState(() {
                                simpleSearchResults = TextSearch(
                                  myContactsContactsRecordList
                                      .map(
                                        (record) => TextSearchItem(record, [
                                          record.firstName!,
                                          record.lastName!,
                                          record.emailAddress!,
                                          record.companyName!
                                        ]),
                                      )
                                      .toList(),
                                )
                                    .search(textController!.text)
                                    .map((r) => r.object)
                                    .toList();
                              });
                            },
                          ),
                          obscureText: false,
                          decoration: InputDecoration(
                            labelText: 'Search for contacts...',
                            labelStyle: FlutterFlowTheme.of(context).bodyText2,
                            enabledBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            errorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            focusedErrorBorder: OutlineInputBorder(
                              borderSide: BorderSide(
                                color: Color(0x00000000),
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(30),
                            ),
                            filled: true,
                            fillColor:
                                FlutterFlowTheme.of(context).primaryBackground,
                            prefixIcon: Icon(
                              Icons.search_outlined,
                              color: FlutterFlowTheme.of(context).secondaryText,
                            ),
                            suffixIcon: textController!.text.isNotEmpty
                                ? InkWell(
                                    onTap: () async {
                                      textController?.clear();
                                      if (textController!.text != null &&
                                          textController!.text != '') {
                                        FFAppState().update(() {
                                          FFAppState().viewAll = false;
                                        });
                                      } else {
                                        FFAppState().update(() {
                                          FFAppState().viewAll = true;
                                        });
                                      }

                                      setState(() {
                                        simpleSearchResults = TextSearch(
                                          myContactsContactsRecordList
                                              .map(
                                                (record) => TextSearchItem(
                                                    record, [
                                                  record.firstName!,
                                                  record.lastName!,
                                                  record.emailAddress!,
                                                  record.companyName!
                                                ]),
                                              )
                                              .toList(),
                                        )
                                            .search(textController!.text)
                                            .map((r) => r.object)
                                            .toList();
                                      });
                                      setState(() {});
                                    },
                                    child: Icon(
                                      Icons.clear,
                                      color: Color(0xFF757575),
                                      size: 22,
                                    ),
                                  )
                                : null,
                          ),
                          style: FlutterFlowTheme.of(context).bodyText1,
                        ),
                      ),
                      if (FFAppState().viewAll)
                        Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.start,
                          children: [
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(16, 12, 0, 0),
                              child: Text(
                                'All Contacts',
                                style: FlutterFlowTheme.of(context).bodyText2,
                              ),
                            ),
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(4, 12, 16, 0),
                              child: Text(
                                valueOrDefault<String>(
                                  functions
                                      .getLength(
                                          myContactsContactsRecordList.toList())
                                      .toString(),
                                  '0',
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyText2
                                    .override(
                                      fontFamily: 'Poppins',
                                      color: FlutterFlowTheme.of(context)
                                          .primaryColor,
                                    ),
                              ),
                            ),
                          ],
                        ),
                      if (FFAppState().viewAll)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                            child: StreamBuilder<List<ContactsRecord>>(
                              stream: queryContactsRecord(
                                parent: currentUserReference,
                                queryBuilder: (contactsRecord) =>
                                    contactsRecord.orderBy('first_name'),
                              ),
                              builder: (context, snapshot) {
                                // Customize what your widget looks like when it's loading.
                                if (!snapshot.hasData) {
                                  return Center(
                                    child: SizedBox(
                                      width: 50,
                                      height: 50,
                                      child: CircularProgressIndicator(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryColor,
                                      ),
                                    ),
                                  );
                                }
                                List<ContactsRecord>
                                    listViewAllContactsRecordList =
                                    snapshot.data!;
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  scrollDirection: Axis.vertical,
                                  itemCount:
                                      listViewAllContactsRecordList.length,
                                  itemBuilder: (context, listViewAllIndex) {
                                    final listViewAllContactsRecord =
                                        listViewAllContactsRecordList[
                                            listViewAllIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 1),
                                      child: InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0xB3090F13),
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: ContactSheetWidget(
                                                    contactReference:
                                                        listViewAllContactsRecord
                                                            .reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                offset: Offset(0, 1),
                                              )
                                            ],
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      listViewAllContactsRecord
                                                          .contactImage,
                                                      'https://firebasestorage.googleapis.com/v0/b/nexl-business-card.appspot.com/o/public%2FcontactDefault.jpeg?alt=media&token=75fd5b20-43da-41b7-b9a3-11dc60788acd',
                                                    ),
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          '${listViewAllContactsRecord.firstName} ${listViewAllContactsRecord.lastName}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewAllContactsRecord
                                                                    .mobilePhone!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                listViewAllContactsRecord
                                                                    .emailAddress!
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 12,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 4, 4, 4),
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
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
                        ),
                      if (!FFAppState().viewAll)
                        Expanded(
                          child: Padding(
                            padding: EdgeInsetsDirectional.fromSTEB(8, 8, 8, 0),
                            child: Builder(
                              builder: (context) {
                                final contacts = simpleSearchResults.toList();
                                return ListView.builder(
                                  padding: EdgeInsets.zero,
                                  shrinkWrap: true,
                                  scrollDirection: Axis.vertical,
                                  itemCount: contacts.length,
                                  itemBuilder: (context, contactsIndex) {
                                    final contactsItem =
                                        contacts[contactsIndex];
                                    return Padding(
                                      padding: EdgeInsetsDirectional.fromSTEB(
                                          0, 0, 0, 1),
                                      child: InkWell(
                                        onTap: () async {
                                          await showModalBottomSheet(
                                            isScrollControlled: true,
                                            backgroundColor: Colors.transparent,
                                            barrierColor: Color(0xB3090F13),
                                            enableDrag: false,
                                            context: context,
                                            builder: (context) {
                                              return Padding(
                                                padding: MediaQuery.of(context)
                                                    .viewInsets,
                                                child: Container(
                                                  height: MediaQuery.of(context)
                                                          .size
                                                          .height *
                                                      0.8,
                                                  child: ContactSheetWidget(
                                                    contactReference:
                                                        contactsItem.reference,
                                                  ),
                                                ),
                                              );
                                            },
                                          ).then((value) => setState(() {}));
                                        },
                                        child: Container(
                                          width: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryBackground,
                                            boxShadow: [
                                              BoxShadow(
                                                blurRadius: 0,
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .lineColor,
                                                offset: Offset(0, 1),
                                              )
                                            ],
                                          ),
                                          child: Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    8, 8, 8, 8),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                ClipRRect(
                                                  borderRadius:
                                                      BorderRadius.circular(40),
                                                  child: Image.network(
                                                    valueOrDefault<String>(
                                                      contactsItem.contactImage,
                                                      'https://firebasestorage.googleapis.com/v0/b/nexl-business-card.appspot.com/o/public%2FcontactDefault.jpeg?alt=media&token=75fd5b20-43da-41b7-b9a3-11dc60788acd',
                                                    ),
                                                    width: 60,
                                                    height: 60,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                                Expanded(
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .start,
                                                    children: [
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(12, 0,
                                                                    0, 0),
                                                        child: Text(
                                                          '${contactsItem.firstName} ${contactsItem.lastName}',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1,
                                                        ),
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Row(
                                                          mainAxisSize:
                                                              MainAxisSize.max,
                                                          children: [
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          12,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                contactsItem
                                                                    .mobilePhone!,
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                              ),
                                                            ),
                                                            Padding(
                                                              padding:
                                                                  EdgeInsetsDirectional
                                                                      .fromSTEB(
                                                                          4,
                                                                          0,
                                                                          0,
                                                                          0),
                                                              child: Text(
                                                                contactsItem
                                                                    .emailAddress!
                                                                    .maybeHandleOverflow(
                                                                  maxChars: 12,
                                                                  replacement:
                                                                      '…',
                                                                ),
                                                                style: FlutterFlowTheme.of(
                                                                        context)
                                                                    .bodyText2,
                                                              ),
                                                            ),
                                                          ],
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Card(
                                                  clipBehavior: Clip
                                                      .antiAliasWithSaveLayer,
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  elevation: 1,
                                                  shape: RoundedRectangleBorder(
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            40),
                                                  ),
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                4, 4, 4, 4),
                                                    child: Icon(
                                                      Icons
                                                          .keyboard_arrow_right_rounded,
                                                      color:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .secondaryText,
                                                      size: 24,
                                                    ),
                                                  ),
                                                ),
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
                        ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(16, 0, 16, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).primaryText,
                            boxShadow: [
                              BoxShadow(
                                blurRadius: 4,
                                color: Color(0x55000000),
                                offset: Offset(0, 2),
                              )
                            ],
                            borderRadius: BorderRadius.circular(40),
                          ),
                          child: Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(24, 16, 16, 16),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Row(
                                      mainAxisSize: MainAxisSize.max,
                                      children: [
                                        if (isiOS &&
                                            responsiveVisibility(
                                              context: context,
                                              tablet: false,
                                              tabletLandscape: false,
                                              desktop: false,
                                            ))
                                          InkWell(
                                            onTap: () async {
                                              profileURL =
                                                  await FlutterBarcodeScanner
                                                      .scanBarcode(
                                                '#C62828', // scanning line color
                                                'Cancel', // cancel button text
                                                true, // whether to show the flash icon
                                                ScanMode.QR,
                                              );

                                              context.pushNamed(
                                                'publicProfile',
                                                params: {
                                                  'profile': serializeParam(
                                                    functions.getProfileFromURL(
                                                        profileURL!),
                                                    ParamType.DocumentReference,
                                                  ),
                                                }.withoutNulls,
                                              );

                                              setState(() {});
                                            },
                                            child: Text(
                                              'Scan QR code',
                                              style: FlutterFlowTheme.of(
                                                      context)
                                                  .subtitle1
                                                  .override(
                                                    fontFamily: 'Outfit',
                                                    color: FlutterFlowTheme.of(
                                                            context)
                                                        .primaryBackground,
                                                    fontSize: 20,
                                                    fontWeight: FontWeight.w500,
                                                    decoration: TextDecoration
                                                        .underline,
                                                  ),
                                            ),
                                          ),
                                      ],
                                    ),
                                  ],
                                ),
                                FFButtonWidget(
                                  onPressed: () async {
                                    final contactsCreateData =
                                        createContactsRecordData();
                                    var contactsRecordReference =
                                        ContactsRecord.createDoc(
                                            currentUserReference!);
                                    await contactsRecordReference
                                        .set(contactsCreateData);
                                    newContact =
                                        ContactsRecord.getDocumentFromData(
                                            contactsCreateData,
                                            contactsRecordReference);

                                    context.pushNamed(
                                      'editContact',
                                      queryParams: {
                                        'contactRef': serializeParam(
                                          newContact!.reference,
                                          ParamType.DocumentReference,
                                        ),
                                        'isNew': serializeParam(
                                          true,
                                          ParamType.bool,
                                        ),
                                      }.withoutNulls,
                                    );

                                    setState(() {});
                                  },
                                  text: '+ Add contact',
                                  options: FFButtonOptions(
                                    width: 130,
                                    height: 50,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryColor,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .subtitle2
                                        .override(
                                          fontFamily: 'Outfit',
                                          color: Colors.white,
                                          fontSize: 16,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 3,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                    borderRadius: BorderRadius.circular(100),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
