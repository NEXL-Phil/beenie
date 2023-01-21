import '../auth/auth_util.dart';
import '../backend/backend.dart';
import '../backend/firebase_storage/storage.dart';
import '../flutter_flow/flutter_flow_autocomplete_options_list.dart';
import '../flutter_flow/flutter_flow_icon_button.dart';
import '../flutter_flow/flutter_flow_theme.dart';
import '../flutter_flow/flutter_flow_util.dart';
import '../flutter_flow/flutter_flow_widgets.dart';
import '../flutter_flow/upload_media.dart';
import '../custom_code/actions/index.dart' as actions;
import '../flutter_flow/custom_functions.dart' as functions;
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:provider/provider.dart';

class EditProfileCopyWidget extends StatefulWidget {
  const EditProfileCopyWidget({
    Key? key,
    this.profile,
  }) : super(key: key);

  final ProfilesRecord? profile;

  @override
  _EditProfileCopyWidgetState createState() => _EditProfileCopyWidgetState();
}

class _EditProfileCopyWidgetState extends State<EditProfileCopyWidget> {
  bool isMediaUploading = false;
  String uploadedFileUrl = '';

  TextEditingController? companyNameController;
  final jobTitleKey = GlobalKey();
  TextEditingController? jobTitleController;
  String? jobTitleSelectedOption;
  final countryKey = GlobalKey();
  TextEditingController? countryController;
  String? countrySelectedOption;
  TextEditingController? yourOfficePhoneController;
  String? vCardUrl;
  BeeniecardsRecord? beenieCard;
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  void initState() {
    super.initState();
    // On page load action.
    SchedulerBinding.instance.addPostFrameCallback((_) async {
      beenieCard = await actions.getBeenieCardReference(
        widget.profile,
      );
    });

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    companyNameController?.dispose();
    yourOfficePhoneController?.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    context.watch<FFAppState>();

    return AuthUserStreamWidget(
      builder: (context) => StreamBuilder<ProfilesRecord>(
        stream: ProfilesRecord.getDocument(currentUserDocument!.profile!),
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
          final editProfileCopyProfilesRecord = snapshot.data!;
          return Scaffold(
            key: scaffoldKey,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            appBar: PreferredSize(
              preferredSize: Size.fromHeight(100),
              child: AppBar(
                backgroundColor:
                    FlutterFlowTheme.of(context).secondaryBackground,
                automaticallyImplyLeading: false,
                actions: [],
                flexibleSpace: FlexibleSpaceBar(
                  title: Column(
                    mainAxisSize: MainAxisSize.max,
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          if (currentUserDisplayName != null &&
                              currentUserDisplayName != '')
                            Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(12, 0, 0, 0),
                              child: FlutterFlowIconButton(
                                borderColor: Colors.transparent,
                                borderRadius: 30,
                                borderWidth: 1,
                                buttonSize: 50,
                                icon: Icon(
                                  Icons.arrow_back_rounded,
                                  color:
                                      FlutterFlowTheme.of(context).primaryText,
                                  size: 30,
                                ),
                                onPressed: () async {
                                  context.pop();
                                },
                              ),
                            ),
                        ],
                      ),
                      Padding(
                        padding: EdgeInsetsDirectional.fromSTEB(24, 0, 0, 0),
                        child: Text(
                          'Edit Profile',
                          style: FlutterFlowTheme.of(context).title2.override(
                                fontFamily: 'Poppins',
                                color: FlutterFlowTheme.of(context).primaryText,
                                fontSize: 22,
                              ),
                        ),
                      ),
                    ],
                  ),
                  centerTitle: true,
                  expandedTitleScale: 1.0,
                ),
                elevation: 0,
              ),
            ),
            body: SafeArea(
              child: Align(
                alignment: AlignmentDirectional(0, 0),
                child: Container(
                  width: double.infinity,
                  height: double.infinity,
                  constraints: BoxConstraints(
                    maxWidth: 500,
                  ),
                  decoration: BoxDecoration(
                    color: FlutterFlowTheme.of(context).secondaryBackground,
                  ),
                  child: Padding(
                    padding: EdgeInsetsDirectional.fromSTEB(0, 18, 0, 0),
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          Row(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                width: 100,
                                height: 100,
                                decoration: BoxDecoration(
                                  color: Color(0xFFDBE2E7),
                                  shape: BoxShape.circle,
                                ),
                                child: Padding(
                                  padding: EdgeInsetsDirectional.fromSTEB(
                                      2, 2, 2, 2),
                                  child: Container(
                                    width: 90,
                                    height: 90,
                                    clipBehavior: Clip.antiAlias,
                                    decoration: BoxDecoration(
                                      shape: BoxShape.circle,
                                    ),
                                    child: Image.network(
                                      valueOrDefault<String>(
                                        widget.profile!.companyLogo,
                                        'https://firebasestorage.googleapis.com/v0/b/nexl-business-card.appspot.com/o/public%2Fcompany-logo-placeholder.png?alt=media&token=e9fd1861-7953-45fd-8cda-f396fd1a0778',
                                      ),
                                      fit: BoxFit.fitWidth,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(0, 12, 0, 32),
                            child: Row(
                              mainAxisSize: MainAxisSize.max,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                FFButtonWidget(
                                  onPressed: () async {
                                    final selectedMedia =
                                        await selectMediaWithSourceBottomSheet(
                                      context: context,
                                      maxWidth: 250.00,
                                      allowPhoto: true,
                                    );
                                    if (selectedMedia != null &&
                                        selectedMedia.every((m) =>
                                            validateFileFormat(
                                                m.storagePath, context))) {
                                      setState(() => isMediaUploading = true);
                                      var downloadUrls = <String>[];
                                      try {
                                        showUploadMessage(
                                          context,
                                          'Uploading file...',
                                          showLoading: true,
                                        );
                                        downloadUrls = (await Future.wait(
                                          selectedMedia.map(
                                            (m) async => await uploadData(
                                                m.storagePath, m.bytes),
                                          ),
                                        ))
                                            .where((u) => u != null)
                                            .map((u) => u!)
                                            .toList();
                                      } finally {
                                        ScaffoldMessenger.of(context)
                                            .hideCurrentSnackBar();
                                        isMediaUploading = false;
                                      }
                                      if (downloadUrls.length ==
                                          selectedMedia.length) {
                                        setState(() => uploadedFileUrl =
                                            downloadUrls.first);
                                        showUploadMessage(context, 'Success!');
                                      } else {
                                        setState(() {});
                                        showUploadMessage(
                                            context, 'Failed to upload media');
                                        return;
                                      }
                                    }

                                    final profilesUpdateData =
                                        createProfilesRecordData(
                                      companyLogo: uploadedFileUrl,
                                    );
                                    await currentUserDocument!.profile!
                                        .update(profilesUpdateData);
                                  },
                                  text: 'Change Company Logo',
                                  options: FFButtonOptions(
                                    width: 220,
                                    height: 40,
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    textStyle: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Lexend Deca',
                                          color: FlutterFlowTheme.of(context)
                                              .primaryColor,
                                          fontSize: 14,
                                          fontWeight: FontWeight.normal,
                                        ),
                                    elevation: 1,
                                    borderSide: BorderSide(
                                      color: Colors.transparent,
                                      width: 1,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                            child: TextFormField(
                              controller: companyNameController ??=
                                  TextEditingController(
                                text: editProfileCopyProfilesRecord.companyName,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Your  Company Name',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 0, 24),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              maxLines: null,
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                            child: Autocomplete<String>(
                              initialValue: TextEditingValue(
                                  text:
                                      editProfileCopyProfilesRecord.jobTitle!),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return functions
                                    .getJobTitleList()!
                                    .toList()
                                    .where((option) {
                                  final lowercaseOption = option.toLowerCase();
                                  return lowercaseOption.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return AutocompleteOptionsList(
                                  textFieldKey: jobTitleKey,
                                  textController: jobTitleController!,
                                  options: options.toList(),
                                  onSelected: onSelected,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  textHighlightStyle: TextStyle(),
                                  elevation: 4,
                                  optionBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  optionHighlightColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  maxHeight: 200,
                                );
                              },
                              onSelected: (String selection) {
                                setState(
                                    () => jobTitleSelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                jobTitleController = textEditingController;
                                return TextFormField(
                                  key: jobTitleKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Your Job Title',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 0, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  maxLines: null,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                            child: Autocomplete<String>(
                              initialValue: TextEditingValue(
                                  text: editProfileCopyProfilesRecord.country!),
                              optionsBuilder: (textEditingValue) {
                                if (textEditingValue.text == '') {
                                  return const Iterable<String>.empty();
                                }
                                return functions
                                    .getCountryList()
                                    .toList()
                                    .where((option) {
                                  final lowercaseOption = option.toLowerCase();
                                  return lowercaseOption.contains(
                                      textEditingValue.text.toLowerCase());
                                });
                              },
                              optionsViewBuilder:
                                  (context, onSelected, options) {
                                return AutocompleteOptionsList(
                                  textFieldKey: countryKey,
                                  textController: countryController!,
                                  options: options.toList(),
                                  onSelected: onSelected,
                                  textStyle:
                                      FlutterFlowTheme.of(context).bodyText1,
                                  textHighlightStyle: TextStyle(),
                                  elevation: 4,
                                  optionBackgroundColor:
                                      FlutterFlowTheme.of(context)
                                          .primaryBackground,
                                  optionHighlightColor:
                                      FlutterFlowTheme.of(context)
                                          .secondaryBackground,
                                  maxHeight: 200,
                                );
                              },
                              onSelected: (String selection) {
                                setState(
                                    () => countrySelectedOption = selection);
                                FocusScope.of(context).unfocus();
                              },
                              fieldViewBuilder: (
                                context,
                                textEditingController,
                                focusNode,
                                onEditingComplete,
                              ) {
                                countryController = textEditingController;
                                return TextFormField(
                                  key: countryKey,
                                  controller: textEditingController,
                                  focusNode: focusNode,
                                  onEditingComplete: onEditingComplete,
                                  obscureText: false,
                                  decoration: InputDecoration(
                                    labelText: 'Country',
                                    labelStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    hintStyle:
                                        FlutterFlowTheme.of(context).bodyText2,
                                    enabledBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: FlutterFlowTheme.of(context)
                                            .primaryBackground,
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    errorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    focusedErrorBorder: OutlineInputBorder(
                                      borderSide: BorderSide(
                                        color: Color(0x00000000),
                                        width: 2,
                                      ),
                                      borderRadius: BorderRadius.circular(8),
                                    ),
                                    filled: true,
                                    fillColor: FlutterFlowTheme.of(context)
                                        .secondaryBackground,
                                    contentPadding:
                                        EdgeInsetsDirectional.fromSTEB(
                                            20, 24, 0, 24),
                                  ),
                                  style: FlutterFlowTheme.of(context).bodyText1,
                                  maxLines: null,
                                );
                              },
                            ),
                          ),
                          Padding(
                            padding:
                                EdgeInsetsDirectional.fromSTEB(20, 0, 20, 16),
                            child: TextFormField(
                              controller: yourOfficePhoneController ??=
                                  TextEditingController(
                                text: editProfileCopyProfilesRecord.directLine,
                              ),
                              obscureText: false,
                              decoration: InputDecoration(
                                labelText: 'Your Office Phone',
                                labelStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                hintStyle:
                                    FlutterFlowTheme.of(context).bodyText2,
                                enabledBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: FlutterFlowTheme.of(context)
                                        .primaryBackground,
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                errorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                focusedErrorBorder: OutlineInputBorder(
                                  borderSide: BorderSide(
                                    color: Color(0x00000000),
                                    width: 2,
                                  ),
                                  borderRadius: BorderRadius.circular(8),
                                ),
                                filled: true,
                                fillColor: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                contentPadding: EdgeInsetsDirectional.fromSTEB(
                                    20, 24, 0, 24),
                              ),
                              style: FlutterFlowTheme.of(context).bodyText1,
                              maxLines: null,
                            ),
                          ),
                          Align(
                            alignment: AlignmentDirectional(0, 0.05),
                            child: Padding(
                              padding:
                                  EdgeInsetsDirectional.fromSTEB(0, 24, 0, 0),
                              child: FFButtonWidget(
                                onPressed: isMediaUploading
                                    ? null
                                    : () async {
                                        var _shouldSetState = false;

                                        final profilesUpdateData =
                                            createProfilesRecordData(
                                          jobTitle:
                                              jobTitleController?.text ?? '',
                                          companyName:
                                              companyNameController?.text ?? '',
                                          directLine:
                                              yourOfficePhoneController?.text ??
                                                  '',
                                          country:
                                              countryController?.text ?? '',
                                        );
                                        await currentUserDocument!.profile!
                                            .update(profilesUpdateData);
                                        vCardUrl = await actions.vCard(
                                          currentUserReference,
                                          currentUserDocument!.profile,
                                        );
                                        _shouldSetState = true;

                                        final vCardsUpdateData =
                                            createVCardsRecordData(
                                          vCardUrl: vCardUrl,
                                        );
                                        await editProfileCopyProfilesRecord
                                            .vCardRef!
                                            .update(vCardsUpdateData);
                                        if (beenieCard != null) {
                                          if (beenieCard!.isActivated!) {
                                            context.pushNamed('Home');

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            final beeniecardsUpdateData =
                                                createBeeniecardsRecordData(
                                              isActivated: true,
                                            );
                                            await beenieCard!.reference
                                                .update(beeniecardsUpdateData);

                                            context.pushNamed(
                                              'activateSuccess',
                                              queryParams: {
                                                'beenieCard': serializeParam(
                                                  beenieCard,
                                                  ParamType.Document,
                                                ),
                                              }.withoutNulls,
                                              extra: <String, dynamic>{
                                                'beenieCard': beenieCard,
                                              },
                                            );

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        } else {
                                          if (currentUserEmailVerified) {
                                            context.pushNamed('Home');

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          } else {
                                            context.pushNamed(
                                                'emailAuthentication');

                                            if (_shouldSetState)
                                              setState(() {});
                                            return;
                                          }
                                        }

                                        if (_shouldSetState) setState(() {});
                                      },
                                text: 'Save Profile',
                                options: FFButtonOptions(
                                  width: 340,
                                  height: 60,
                                  color:
                                      FlutterFlowTheme.of(context).primaryColor,
                                  textStyle: FlutterFlowTheme.of(context)
                                      .subtitle2
                                      .override(
                                        fontFamily: 'Lexend Deca',
                                        color: Colors.white,
                                        fontSize: 16,
                                        fontWeight: FontWeight.normal,
                                      ),
                                  elevation: 2,
                                  borderSide: BorderSide(
                                    color: Colors.transparent,
                                    width: 1,
                                  ),
                                  disabledColor: FlutterFlowTheme.of(context)
                                      .secondaryText,
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
            ),
          );
        },
      ),
    );
  }
}
