import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../components/account_settings_widget.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:barcode_widget/barcode_widget.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_barcode_scanner/flutter_barcode_scanner.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class HomeWidget extends StatefulWidget {
  const HomeWidget({Key? key}) : super(key: key);

  @override
  _HomeWidgetState createState() => _HomeWidgetState();
}

class _HomeWidgetState extends State<HomeWidget> {
  ContactsRecord? newContact;
  var profileURL = '';
  final _unfocusNode = FocusNode();
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _unfocusNode.dispose();
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
        List<ContactsRecord> homeContactsRecordList = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
          appBar: AppBar(
            backgroundColor: FlutterFlowTheme.of(context).primaryColor,
            automaticallyImplyLeading: false,
            title: Text(
              'Welcome back!',
              style: FlutterFlowTheme.of(context).title1.override(
                    fontFamily: 'Poppins',
                    color: FlutterFlowTheme.of(context).primaryBtnText,
                  ),
            ),
            actions: [],
            centerTitle: false,
            elevation: 0,
          ),
          body: SafeArea(
            child: GestureDetector(
              onTap: () => FocusScope.of(context).requestFocus(_unfocusNode),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    if (currentUserDisplayName != null &&
                        currentUserDisplayName != '')
                      Align(
                        alignment: AlignmentDirectional(0, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Container(
                            constraints: BoxConstraints(
                              maxWidth: 550,
                            ),
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                            ),
                            child: SingleChildScrollView(
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Container(
                                    height: 160,
                                    child: Stack(
                                      children: [
                                        Container(
                                          width: double.infinity,
                                          height: 100,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 25, 16, 12),
                                          child: InkWell(
                                            onTap: () async {
                                              context.goNamed('editProfile');
                                            },
                                            child: Container(
                                              height: 120,
                                              decoration: BoxDecoration(
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .secondaryBackground,
                                                boxShadow: [
                                                  BoxShadow(
                                                    blurRadius: 4,
                                                    color: Color(0x1F000000),
                                                    offset: Offset(0, 2),
                                                  )
                                                ],
                                                borderRadius:
                                                    BorderRadius.circular(8),
                                                border: Border.all(
                                                  color: FlutterFlowTheme.of(
                                                          context)
                                                      .primaryBackground,
                                                  width: 1,
                                                ),
                                              ),
                                              child: Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 0, 12, 0),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Container(
                                                        width: 120,
                                                        height: 120,
                                                        clipBehavior:
                                                            Clip.antiAlias,
                                                        decoration:
                                                            BoxDecoration(
                                                          shape:
                                                              BoxShape.circle,
                                                        ),
                                                        child: Image.network(
                                                          valueOrDefault<
                                                              String>(
                                                            currentUserPhoto,
                                                            'gs://nexl-business-card.appspot.com/public/contactDefault.jpeg',
                                                          ),
                                                          fit: BoxFit.cover,
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(12, 12,
                                                                  12, 12),
                                                      child: Column(
                                                        mainAxisSize:
                                                            MainAxisSize.max,
                                                        mainAxisAlignment:
                                                            MainAxisAlignment
                                                                .center,
                                                        crossAxisAlignment:
                                                            CrossAxisAlignment
                                                                .start,
                                                        children: [
                                                          Text(
                                                            currentUserDisplayName,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .title3,
                                                          ),
                                                          Text(
                                                            currentUserEmail,
                                                            style: FlutterFlowTheme
                                                                    .of(context)
                                                                .subtitle2,
                                                          ),
                                                        ],
                                                      ),
                                                    ),
                                                    Expanded(
                                                      child: Align(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                1, 0),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(0,
                                                                      0, 8, 0),
                                                          child: Icon(
                                                            Icons
                                                                .keyboard_arrow_right,
                                                            color: Colors.black,
                                                            size: 24,
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
                                      ],
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 8, 0, 0),
                                    child: Text(
                                      'Share your profile',
                                      textAlign: TextAlign.start,
                                      style: FlutterFlowTheme.of(context)
                                          .subtitle1,
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: Container(
                                      width: double.infinity,
                                      height: 350,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryBackground,
                                        boxShadow: [
                                          BoxShadow(
                                            blurRadius: 4,
                                            color: Color(0x1F000000),
                                            offset: Offset(0, 2),
                                          )
                                        ],
                                        borderRadius: BorderRadius.circular(8),
                                      ),
                                      child: Padding(
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            12, 12, 12, 12),
                                        child: Column(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.center,
                                          crossAxisAlignment:
                                              CrossAxisAlignment.start,
                                          children: [
                                            Padding(
                                              padding: EdgeInsetsDirectional
                                                  .fromSTEB(0, 12, 0, 0),
                                              child:
                                                  StreamBuilder<ProfilesRecord>(
                                                stream:
                                                    ProfilesRecord.getDocument(
                                                        currentUserDocument!
                                                            .profile!),
                                                builder: (context, snapshot) {
                                                  // Customize what your widget looks like when it's loading.
                                                  if (!snapshot.hasData) {
                                                    return Center(
                                                      child: SizedBox(
                                                        width: 50,
                                                        height: 50,
                                                        child:
                                                            CircularProgressIndicator(
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                        ),
                                                      ),
                                                    );
                                                  }
                                                  final rowProfilesRecord =
                                                      snapshot.data!;
                                                  return Row(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    children: [
                                                      Stack(
                                                        alignment:
                                                            AlignmentDirectional(
                                                                0, 0),
                                                        children: [
                                                          Align(
                                                            alignment:
                                                                AlignmentDirectional(
                                                                    0, 0),
                                                            child: InkWell(
                                                              onTap: () async {
                                                                await launchURL(
                                                                    rowProfilesRecord
                                                                        .publicProfileId!);
                                                              },
                                                              child:
                                                                  BarcodeWidget(
                                                                data:
                                                                    valueOrDefault<
                                                                        String>(
                                                                  rowProfilesRecord
                                                                      .publicProfileId,
                                                                  'https://nexl.cloud',
                                                                ),
                                                                barcode: Barcode
                                                                    .qrCode(),
                                                                width: 200,
                                                                height: 200,
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                backgroundColor:
                                                                    Colors
                                                                        .transparent,
                                                                errorBuilder:
                                                                    (_context,
                                                                            _error) =>
                                                                        SizedBox(
                                                                  width: 200,
                                                                  height: 200,
                                                                ),
                                                                drawText: false,
                                                              ),
                                                            ),
                                                          ),
                                                        ],
                                                      ),
                                                    ],
                                                  );
                                                },
                                              ),
                                            ),
                                            Divider(
                                              height: 24,
                                              thickness: 1,
                                              color: Color(0xFF6AA3B8),
                                            ),
                                            Row(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              children: [
                                                Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 0, 0, 8),
                                                      child: Text(
                                                        'Scan to get my details',
                                                        textAlign:
                                                            TextAlign.center,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryText,
                                                                  fontSize: 20,
                                                                ),
                                                      ),
                                                    ),
                                                    Text(
                                                      'powered by Nexl™',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2
                                                              .override(
                                                                fontFamily:
                                                                    'Poppins',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .secondaryText,
                                                              ),
                                                    ),
                                                  ],
                                                ),
                                              ],
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 12, 16, 0),
                                    child: InkWell(
                                      onTap: () async {
                                        context.pushNamed('myContacts');
                                      },
                                      child: Container(
                                        width: double.infinity,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryBackground,
                                          boxShadow: [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x1F000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          borderRadius:
                                              BorderRadius.circular(8),
                                          border: Border.all(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            width: 1,
                                          ),
                                        ),
                                        child: Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.center,
                                            children: [
                                              Padding(
                                                padding: EdgeInsetsDirectional
                                                    .fromSTEB(12, 8, 16, 4),
                                                child: Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  mainAxisAlignment:
                                                      MainAxisAlignment.start,
                                                  children: [
                                                    Container(
                                                      width: 60,
                                                      height: 60,
                                                      decoration: BoxDecoration(
                                                        color: FlutterFlowTheme
                                                                .of(context)
                                                            .primaryBackground,
                                                        shape: BoxShape.circle,
                                                      ),
                                                      alignment:
                                                          AlignmentDirectional(
                                                              0, 0),
                                                      child: Card(
                                                        clipBehavior: Clip
                                                            .antiAliasWithSaveLayer,
                                                        color:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .tertiaryColor,
                                                        shape:
                                                            RoundedRectangleBorder(
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(40),
                                                        ),
                                                        child: Padding(
                                                          padding:
                                                              EdgeInsetsDirectional
                                                                  .fromSTEB(
                                                                      12,
                                                                      12,
                                                                      12,
                                                                      12),
                                                          child: Icon(
                                                            Icons
                                                                .group_outlined,
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryBtnText,
                                                            size: 24,
                                                          ),
                                                        ),
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  12, 0, 0, 0),
                                                      child: Text(
                                                        valueOrDefault<String>(
                                                          functions
                                                              .getLength(
                                                                  homeContactsRecordList
                                                                      .toList())
                                                              .toString(),
                                                          '0',
                                                        ),
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      ),
                                                    ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  8, 0, 0, 0),
                                                      child: Text(
                                                        'Contacts',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle1,
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 16, 16, 0),
                                    child: Container(
                                      width: MediaQuery.of(context).size.width,
                                      decoration: BoxDecoration(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryText,
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
                                        padding: EdgeInsetsDirectional.fromSTEB(
                                            24, 16, 16, 16),
                                        child: Row(
                                          mainAxisSize: MainAxisSize.max,
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceBetween,
                                          children: [
                                            Column(
                                              mainAxisSize: MainAxisSize.max,
                                              mainAxisAlignment:
                                                  MainAxisAlignment.center,
                                              crossAxisAlignment:
                                                  CrossAxisAlignment.start,
                                              children: [
                                                Row(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (isiOS &&
                                                        responsiveVisibility(
                                                          context: context,
                                                          tablet: false,
                                                          tabletLandscape:
                                                              false,
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
                                                              'profile':
                                                                  serializeParam(
                                                                functions
                                                                    .getProfileFromURL(
                                                                        profileURL!),
                                                                ParamType
                                                                    .DocumentReference,
                                                              ),
                                                            }.withoutNulls,
                                                          );

                                                          setState(() {});
                                                        },
                                                        child: Text(
                                                          'Scan QR code',
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .subtitle1
                                                              .override(
                                                                fontFamily:
                                                                    'Outfit',
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryBackground,
                                                                fontSize: 20,
                                                                fontWeight:
                                                                    FontWeight
                                                                        .w500,
                                                                decoration:
                                                                    TextDecoration
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
                                                newContact = ContactsRecord
                                                    .getDocumentFromData(
                                                        contactsCreateData,
                                                        contactsRecordReference);

                                                context.pushNamed(
                                                  'editContact',
                                                  queryParams: {
                                                    'contactRef':
                                                        serializeParam(
                                                      newContact!.reference,
                                                      ParamType
                                                          .DocumentReference,
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
                                                color:
                                                    FlutterFlowTheme.of(context)
                                                        .primaryColor,
                                                textStyle:
                                                    FlutterFlowTheme.of(context)
                                                        .subtitle2
                                                        .override(
                                                          fontFamily: 'Outfit',
                                                          color: Colors.white,
                                                          fontSize: 16,
                                                          fontWeight:
                                                              FontWeight.normal,
                                                        ),
                                                elevation: 3,
                                                borderSide: BorderSide(
                                                  color: Colors.transparent,
                                                  width: 1,
                                                ),
                                                borderRadius:
                                                    BorderRadius.circular(100),
                                              ),
                                            ),
                                          ],
                                        ),
                                      ),
                                    ),
                                  ),
                                  Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        16, 64, 16, 0),
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.spaceBetween,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 0, 12),
                                          child: InkWell(
                                            onTap: () async {
                                              await launchURL(
                                                  'https://nexl.cloud');
                                            },
                                            child: Text(
                                              'Learn more about Nexl',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2,
                                            ),
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  16, 0, 12, 12),
                                          child: InkWell(
                                            onTap: () async {
                                              await showModalBottomSheet(
                                                isScrollControlled: true,
                                                backgroundColor:
                                                    Colors.transparent,
                                                enableDrag: false,
                                                context: context,
                                                builder: (context) {
                                                  return Padding(
                                                    padding:
                                                        MediaQuery.of(context)
                                                            .viewInsets,
                                                    child:
                                                        AccountSettingsWidget(),
                                                  );
                                                },
                                              ).then(
                                                  (value) => setState(() {}));
                                            },
                                            child: Text(
                                              'User Account',
                                              style:
                                                  FlutterFlowTheme.of(context)
                                                      .bodyText2
                                                      .override(
                                                        fontFamily: 'Poppins',
                                                        decoration:
                                                            TextDecoration
                                                                .underline,
                                                      ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                    if (currentUserDisplayName == null ||
                        currentUserDisplayName == '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 75, 0, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) => Row(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Container(
                                width: MediaQuery.of(context).size.width,
                                height: 100,
                                decoration: BoxDecoration(),
                                child: Text(
                                  'Let\'s get started with setting up your profile!',
                                  textAlign: TextAlign.center,
                                  style: FlutterFlowTheme.of(context).title1,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    if (currentUserDisplayName == null ||
                        currentUserDisplayName == '')
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(0, 35, 0, 0),
                        child: AuthUserStreamWidget(
                          builder: (context) => FFButtonWidget(
                            onPressed: () async {
                              FFAppState().update(() {
                                FFAppState().firstLogin = false;
                              });

                              context.pushNamed('editProfile');
                            },
                            text: 'Create your profile',
                            options: FFButtonOptions(
                              width: 250,
                              height: 40,
                              color: FlutterFlowTheme.of(context).primaryColor,
                              textStyle: FlutterFlowTheme.of(context)
                                  .subtitle2
                                  .override(
                                    fontFamily: 'Poppins',
                                    color: Colors.white,
                                  ),
                              borderSide: BorderSide(
                                color: Colors.transparent,
                                width: 1,
                              ),
                              borderRadius: BorderRadius.circular(8),
                            ),
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
  }
}
