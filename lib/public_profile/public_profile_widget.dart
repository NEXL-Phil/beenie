import '../auth/auth_util.dart';
import '../auth/firebase_user_provider.dart';
import '../backend/backend.dart';
import '../components/share_contact_sheet_offline_widget.dart';
import '../components/share_contact_sheet_widget.dart';
import '../flutter_flow/flutter_flow_animations.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter_animate/flutter_animate.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class PublicProfileWidget extends StatefulWidget {
  const PublicProfileWidget({
    Key? key,
    this.profile,
    this.profileID,
  }) : super(key: key);

  final DocumentReference? profile;
  final String? profileID;

  @override
  _PublicProfileWidgetState createState() => _PublicProfileWidgetState();
}

class _PublicProfileWidgetState extends State<PublicProfileWidget>
    with TickerProviderStateMixin {
  ContactsRecord? newContact;
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

    return StreamBuilder<ProfilesRecord>(
      stream: ProfilesRecord.getDocument(widget.profile!),
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
        final publicProfileProfilesRecord = snapshot.data!;
        return Scaffold(
          key: scaffoldKey,
          backgroundColor: FlutterFlowTheme.of(context).primaryBackground,
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
                    color: FlutterFlowTheme.of(context).primaryBackground,
                  ),
                  child: SingleChildScrollView(
                    child: Column(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        if (loggedIn)
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    12, 12, 12, 0),
                                child: InkWell(
                                  onTap: () async {
                                    context.pop();
                                  },
                                  child: Icon(
                                    Icons.chevron_left,
                                    color: FlutterFlowTheme.of(context)
                                        .secondaryText,
                                    size: 24,
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 0, 12, 0),
                                child: Image.network(
                                  '',
                                  width: 100,
                                  height: 50,
                                  fit: BoxFit.fitWidth,
                                ),
                              ),
                            ],
                          ),
                        Column(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  16, 12, 16, 12),
                              child: Container(
                                height: 70,
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
                                  border: Border.all(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 1,
                                  ),
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      12, 0, 12, 0),
                                  child: InkWell(
                                    onTap: () async {
                                      await launchURL(
                                          'https://${publicProfileProfilesRecord.domain}');
                                    },
                                    child: Row(
                                      mainAxisSize: MainAxisSize.max,
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        Container(
                                          width: 40,
                                          height: 40,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .primaryBackground,
                                            shape: BoxShape.circle,
                                          ),
                                          alignment: AlignmentDirectional(0, 0),
                                          child: Stack(
                                            children: [
                                              if (publicProfileProfilesRecord
                                                          .companyLogo !=
                                                      null &&
                                                  publicProfileProfilesRecord
                                                          .companyLogo !=
                                                      '')
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    publicProfileProfilesRecord
                                                        .companyLogo!,
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                              if (publicProfileProfilesRecord
                                                          .companyLogo ==
                                                      null ||
                                                  publicProfileProfilesRecord
                                                          .companyLogo ==
                                                      '')
                                                Container(
                                                  width: 40,
                                                  height: 40,
                                                  clipBehavior: Clip.antiAlias,
                                                  decoration: BoxDecoration(
                                                    shape: BoxShape.circle,
                                                  ),
                                                  child: Image.network(
                                                    'https://logo.clearbit.com/${publicProfileProfilesRecord.domain}',
                                                    fit: BoxFit.cover,
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 12, 12, 12),
                                          child: Column(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            crossAxisAlignment:
                                                CrossAxisAlignment.start,
                                            children: [
                                              Text(
                                                publicProfileProfilesRecord
                                                    .companyName!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText1,
                                              ),
                                              Text(
                                                publicProfileProfilesRecord
                                                    .country!,
                                                style:
                                                    FlutterFlowTheme.of(context)
                                                        .bodyText2,
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
                          ],
                        ),
                        SingleChildScrollView(
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            crossAxisAlignment: CrossAxisAlignment.center,
                            children: [
                              Padding(
                                padding: EdgeInsetsDirectional.fromSTEB(
                                    16, 12, 16, 0),
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
                                    borderRadius: BorderRadius.circular(8),
                                    border: Border.all(
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                      width: 1,
                                    ),
                                  ),
                                  child: Padding(
                                    padding: EdgeInsetsDirectional.fromSTEB(
                                        1, 0, 0, 32),
                                    child: Column(
                                      mainAxisSize: MainAxisSize.max,
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 16, 0, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Container(
                                                width: 120,
                                                height: 120,
                                                clipBehavior: Clip.antiAlias,
                                                decoration: BoxDecoration(
                                                  shape: BoxShape.circle,
                                                ),
                                                child: Image.network(
                                                  valueOrDefault<String>(
                                                    publicProfileProfilesRecord
                                                        .profileImage,
                                                    'https://firebasestorage.googleapis.com/v0/b/nexl-business-card.appspot.com/o/public%2FcontactDefault.jpeg?alt=media&token=75fd5b20-43da-41b7-b9a3-11dc60788acd',
                                                  ),
                                                  fit: BoxFit.cover,
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 8, 16, 4),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.center,
                                            children: [
                                              Expanded(
                                                child: Padding(
                                                  padding: EdgeInsetsDirectional
                                                      .fromSTEB(4, 12, 12, 12),
                                                  child: Column(
                                                    mainAxisSize:
                                                        MainAxisSize.max,
                                                    mainAxisAlignment:
                                                        MainAxisAlignment
                                                            .center,
                                                    crossAxisAlignment:
                                                        CrossAxisAlignment
                                                            .center,
                                                    children: [
                                                      Text(
                                                        '${publicProfileProfilesRecord.firstName} ${publicProfileProfilesRecord.lastName}',
                                                        textAlign:
                                                            TextAlign.center,
                                                        maxLines: 2,
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .title1,
                                                      ),
                                                      Padding(
                                                        padding:
                                                            EdgeInsetsDirectional
                                                                .fromSTEB(
                                                                    0, 4, 0, 0),
                                                        child: Text(
                                                          publicProfileProfilesRecord
                                                              .jobTitle!,
                                                          textAlign:
                                                              TextAlign.center,
                                                          maxLines: 2,
                                                          style: FlutterFlowTheme
                                                                  .of(context)
                                                              .bodyText2,
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  0, 0, 0, 16),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            mainAxisAlignment:
                                                MainAxisAlignment.spaceEvenly,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  children: [
                                                    if (!valueOrDefault<bool>(
                                                      loggedIn,
                                                      false,
                                                    ))
                                                      StreamBuilder<
                                                          VCardsRecord>(
                                                        stream: VCardsRecord
                                                            .getDocument(
                                                                publicProfileProfilesRecord
                                                                    .vCardRef!),
                                                        builder: (context,
                                                            snapshot) {
                                                          // Customize what your widget looks like when it's loading.
                                                          if (!snapshot
                                                              .hasData) {
                                                            return Center(
                                                              child: SizedBox(
                                                                width: 50,
                                                                height: 50,
                                                                child:
                                                                    CircularProgressIndicator(
                                                                  color: FlutterFlowTheme.of(
                                                                          context)
                                                                      .primaryColor,
                                                                ),
                                                              ),
                                                            );
                                                          }
                                                          final buttonVCardsRecord =
                                                              snapshot.data!;
                                                          return FFButtonWidget(
                                                            onPressed:
                                                                () async {
                                                              await launchURL(
                                                                  buttonVCardsRecord
                                                                      .vCardUrl!);
                                                            },
                                                            text:
                                                                'Download contact',
                                                            options:
                                                                FFButtonOptions(
                                                              width: 250,
                                                              height: 40,
                                                              color: FlutterFlowTheme
                                                                      .of(context)
                                                                  .secondaryBackground,
                                                              textStyle:
                                                                  FlutterFlowTheme.of(
                                                                          context)
                                                                      .subtitle2
                                                                      .override(
                                                                        fontFamily:
                                                                            'Poppins',
                                                                        color: FlutterFlowTheme.of(context)
                                                                            .primaryText,
                                                                      ),
                                                              borderSide:
                                                                  BorderSide(
                                                                color: FlutterFlowTheme.of(
                                                                        context)
                                                                    .primaryText,
                                                                width: 1,
                                                              ),
                                                              borderRadius:
                                                                  BorderRadius
                                                                      .circular(
                                                                          8),
                                                            ),
                                                          );
                                                        },
                                                      ),
                                                    if (loggedIn)
                                                      FFButtonWidget(
                                                        onPressed: () async {
                                                          final contactsCreateData =
                                                              createContactsRecordData(
                                                            firstName:
                                                                publicProfileProfilesRecord
                                                                    .firstName,
                                                            lastName:
                                                                publicProfileProfilesRecord
                                                                    .lastName,
                                                            emailAddress:
                                                                publicProfileProfilesRecord
                                                                    .emailAddress,
                                                            mobilePhone:
                                                                publicProfileProfilesRecord
                                                                    .mobilePhone,
                                                            jobTitle:
                                                                publicProfileProfilesRecord
                                                                    .jobTitle,
                                                            companyName:
                                                                publicProfileProfilesRecord
                                                                    .companyName,
                                                            linkedInUrl:
                                                                publicProfileProfilesRecord
                                                                    .linkedInUrl,
                                                            bio:
                                                                publicProfileProfilesRecord
                                                                    .bio,
                                                            contactImage:
                                                                publicProfileProfilesRecord
                                                                    .profileImage,
                                                            companyLogo:
                                                                publicProfileProfilesRecord
                                                                    .companyLogo,
                                                          );
                                                          var contactsRecordReference =
                                                              ContactsRecord
                                                                  .createDoc(
                                                                      currentUserReference!);
                                                          await contactsRecordReference
                                                              .set(
                                                                  contactsCreateData);
                                                          newContact = ContactsRecord
                                                              .getDocumentFromData(
                                                                  contactsCreateData,
                                                                  contactsRecordReference);

                                                          context.pushNamed(
                                                            'contactAdded',
                                                            queryParams: {
                                                              'contactDoc':
                                                                  serializeParam(
                                                                newContact,
                                                                ParamType
                                                                    .Document,
                                                              ),
                                                            }.withoutNulls,
                                                            extra: <String,
                                                                dynamic>{
                                                              'contactDoc':
                                                                  newContact,
                                                            },
                                                          );

                                                          setState(() {});
                                                        },
                                                        text: 'Add contact',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 250,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .secondaryBackground,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: FlutterFlowTheme.of(
                                                                            context)
                                                                        .primaryText,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: FlutterFlowTheme
                                                                    .of(context)
                                                                .primaryText,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                        showLoadingIndicator:
                                                            false,
                                                      ),
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 8, 0, 0),
                                                      child: FFButtonWidget(
                                                        onPressed: () async {
                                                          if (loggedIn) {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      ShareContactSheetWidget(
                                                                    profileDoc:
                                                                        publicProfileProfilesRecord,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          } else {
                                                            await showModalBottomSheet(
                                                              isScrollControlled:
                                                                  true,
                                                              backgroundColor:
                                                                  Colors
                                                                      .transparent,
                                                              enableDrag: false,
                                                              context: context,
                                                              builder:
                                                                  (context) {
                                                                return Padding(
                                                                  padding: MediaQuery.of(
                                                                          context)
                                                                      .viewInsets,
                                                                  child:
                                                                      ShareContactSheetOfflineWidget(
                                                                    profileDoc:
                                                                        publicProfileProfilesRecord,
                                                                  ),
                                                                );
                                                              },
                                                            ).then((value) =>
                                                                setState(
                                                                    () {}));
                                                          }
                                                        },
                                                        text:
                                                            'Share my details',
                                                        options:
                                                            FFButtonOptions(
                                                          width: 250,
                                                          height: 40,
                                                          color: FlutterFlowTheme
                                                                  .of(context)
                                                              .primaryColor,
                                                          textStyle:
                                                              FlutterFlowTheme.of(
                                                                      context)
                                                                  .subtitle2
                                                                  .override(
                                                                    fontFamily:
                                                                        'Poppins',
                                                                    color: Colors
                                                                        .white,
                                                                  ),
                                                          borderSide:
                                                              BorderSide(
                                                            color: Colors
                                                                .transparent,
                                                            width: 1,
                                                          ),
                                                          borderRadius:
                                                              BorderRadius
                                                                  .circular(8),
                                                        ),
                                                      ),
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        if (publicProfileProfilesRecord.bio !=
                                                null &&
                                            publicProfileProfilesRecord.bio !=
                                                '')
                                          Padding(
                                            padding:
                                                EdgeInsetsDirectional.fromSTEB(
                                                    12, 0, 12, 0),
                                            child: Row(
                                              mainAxisSize: MainAxisSize.max,
                                              children: [
                                                Expanded(
                                                  child: Container(
                                                    width:
                                                        MediaQuery.of(context)
                                                            .size
                                                            .width,
                                                    height: 100,
                                                    decoration: BoxDecoration(
                                                      color: FlutterFlowTheme
                                                              .of(context)
                                                          .secondaryBackground,
                                                    ),
                                                    child: Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 16, 0, 0),
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
                                                                    .fromSTEB(
                                                                        0,
                                                                        8,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              'About',
                                                              textAlign:
                                                                  TextAlign
                                                                      .start,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .subtitle1,
                                                            ),
                                                          ),
                                                          Padding(
                                                            padding:
                                                                EdgeInsetsDirectional
                                                                    .fromSTEB(
                                                                        0,
                                                                        4,
                                                                        0,
                                                                        0),
                                                            child: Text(
                                                              publicProfileProfilesRecord
                                                                  .bio!,
                                                              maxLines: 4,
                                                              style: FlutterFlowTheme
                                                                      .of(context)
                                                                  .bodyText2,
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
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 0, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              if (publicProfileProfilesRecord
                                                          .linkedInUrl !=
                                                      null &&
                                                  publicProfileProfilesRecord
                                                          .linkedInUrl !=
                                                      '')
                                                Expanded(
                                                  child: Padding(
                                                    padding:
                                                        EdgeInsetsDirectional
                                                            .fromSTEB(
                                                                0, 16, 0, 0),
                                                    child: FFButtonWidget(
                                                      onPressed: () async {
                                                        await launchURL(
                                                            publicProfileProfilesRecord
                                                                .linkedInUrl!);
                                                      },
                                                      text: 'LinkedIn',
                                                      options: FFButtonOptions(
                                                        width: 130,
                                                        height: 40,
                                                        color:
                                                            Color(0xFF0077B5),
                                                        textStyle:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .subtitle2
                                                                .override(
                                                                  fontFamily:
                                                                      'Poppins',
                                                                  color: Colors
                                                                      .white,
                                                                ),
                                                        borderSide: BorderSide(
                                                          color: Colors
                                                              .transparent,
                                                          width: 1,
                                                        ),
                                                        borderRadius:
                                                            BorderRadius
                                                                .circular(8),
                                                      ),
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 32, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Padding(
                                                      padding:
                                                          EdgeInsetsDirectional
                                                              .fromSTEB(
                                                                  0, 16, 0, 0),
                                                      child: Text(
                                                        'Email',
                                                        style:
                                                            FlutterFlowTheme.of(
                                                                    context)
                                                                .bodyText2,
                                                      ),
                                                    ),
                                                    Text(
                                                      publicProfileProfilesRecord
                                                          .emailAddress!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 16, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Mobile',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                    Text(
                                                      publicProfileProfilesRecord
                                                          .mobilePhone!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
                                                ),
                                              ),
                                            ],
                                          ),
                                        ),
                                        Padding(
                                          padding:
                                              EdgeInsetsDirectional.fromSTEB(
                                                  12, 16, 12, 0),
                                          child: Row(
                                            mainAxisSize: MainAxisSize.max,
                                            children: [
                                              Expanded(
                                                child: Column(
                                                  mainAxisSize:
                                                      MainAxisSize.max,
                                                  crossAxisAlignment:
                                                      CrossAxisAlignment.start,
                                                  children: [
                                                    Text(
                                                      'Office Direct Line',
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText2,
                                                    ),
                                                    Text(
                                                      publicProfileProfilesRecord
                                                          .directLine!,
                                                      style:
                                                          FlutterFlowTheme.of(
                                                                  context)
                                                              .bodyText1,
                                                    ),
                                                  ],
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
                              InkWell(
                                onTap: () async {
                                  await launchURL('https://nexl.cloud');
                                },
                                child: Image.network(
                                  'https://firebasestorage.googleapis.com/v0/b/nexl-business-card.appspot.com/o/public%2FNexl%20Final%20File%20V3%20No%20Border%20-%20small.png?alt=media&token=0ade3e19-b575-4ce9-b495-d78769e338f8',
                                  width: 100,
                                  height: 100,
                                  fit: BoxFit.contain,
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
          ),
        );
      },
    );
  }
}
