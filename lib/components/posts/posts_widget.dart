import '/auth/firebase_auth/auth_util.dart';
import '/backend/backend.dart';
import '/flutter_flow/flutter_flow_theme.dart';
import '/flutter_flow/flutter_flow_toggle_icon.dart';
import '/flutter_flow/flutter_flow_util.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'posts_model.dart';
export 'posts_model.dart';

class PostsWidget extends StatefulWidget {
  const PostsWidget({super.key});

  @override
  State<PostsWidget> createState() => _PostsWidgetState();
}

class _PostsWidgetState extends State<PostsWidget> {
  late PostsModel _model;

  @override
  void setState(VoidCallback callback) {
    super.setState(callback);
    _model.onUpdate();
  }

  @override
  void initState() {
    super.initState();
    _model = createModel(context, () => PostsModel());

    WidgetsBinding.instance.addPostFrameCallback((_) => setState(() {}));
  }

  @override
  void dispose() {
    _model.maybeDispose();

    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<List<PostsRecord>>(
      stream: queryPostsRecord(
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
                  FlutterFlowTheme.of(context).primary,
                ),
              ),
            ),
          );
        }
        List<PostsRecord> containerPostsRecordList = snapshot.data!;
        // Return an empty Container when the item does not exist.
        if (snapshot.data!.isEmpty) {
          return Container();
        }
        final containerPostsRecord = containerPostsRecordList.isNotEmpty
            ? containerPostsRecordList.first
            : null;
        return Container(
          width: double.infinity,
          decoration: BoxDecoration(
            color: (containerPostsRecord?.mediaUrls != null &&
                        (containerPostsRecord?.mediaUrls)!.isNotEmpty) ==
                    true
                ? const Color(0xFFDFEBFF)
                : const Color(0xFFFFF6DF),
            boxShadow: const [
              BoxShadow(
                blurRadius: 4.0,
                color: Color(0x33000000),
                offset: Offset(
                  0.0,
                  2.0,
                ),
              )
            ],
            borderRadius: const BorderRadius.only(
              bottomLeft: Radius.circular(14.0),
              bottomRight: Radius.circular(14.0),
              topLeft: Radius.circular(14.0),
              topRight: Radius.circular(14.0),
            ),
          ),
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding:
                        const EdgeInsetsDirectional.fromSTEB(8.0, 12.0, 0.0, 0.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      children: [
                        Container(
                          width: 60.0,
                          height: 60.0,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).secondary,
                            shape: BoxShape.circle,
                          ),
                          child: ClipRRect(
                            borderRadius: const BorderRadius.only(
                              bottomLeft: Radius.circular(50.0),
                              bottomRight: Radius.circular(50.0),
                              topLeft: Radius.circular(50.0),
                              topRight: Radius.circular(50.0),
                            ),
                            child: Image.network(
                              containerPostsRecord?.postUserImage != null &&
                                      containerPostsRecord?.postUserImage != ''
                                  ? containerPostsRecord!.postUserImage
                                  : 'https://www.pexels.com/photo/man-in-brown-polo-shirt-614810/',
                              width: 200.0,
                              height: 200.0,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              5.0, 0.0, 0.0, 0.0),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            children: [
                              Text(
                                containerPostsRecord!.postUserName,
                                style: FlutterFlowTheme.of(context)
                                    .titleLarge
                                    .override(
                                      fontFamily: 'Poppins',
                                      fontSize: 20.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                              Text(
                                '@${containerPostsRecord.postUserName}',
                                style: FlutterFlowTheme.of(context)
                                    .titleMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      color: FlutterFlowTheme.of(context)
                                          .secondaryText,
                                      fontSize: 16.0,
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ]
                                .divide(const SizedBox(height: 5.0))
                                .addToStart(const SizedBox(height: 4.0)),
                          ),
                        ),
                      ],
                    ),
                  ),
                  if (containerPostsRecord.postUser == currentUserReference)
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(8.0, 0.0, 16.0, 0.0),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        children: [
                          InkWell(
                            splashColor: Colors.transparent,
                            focusColor: Colors.transparent,
                            hoverColor: Colors.transparent,
                            highlightColor: Colors.transparent,
                            onTap: () async {
                              context.pushNamed(
                                'EditPost',
                                queryParameters: {
                                  'postId': serializeParam(
                                    containerPostsRecord.reference,
                                    ParamType.DocumentReference,
                                  ),
                                }.withoutNulls,
                              );
                            },
                            child: Container(
                              width: 47.0,
                              height: 47.0,
                              decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                border: Border.all(
                                  color: const Color(0xFFD9D9D9),
                                  width: 2.0,
                                ),
                              ),
                              child: Align(
                                alignment: const AlignmentDirectional(0.0, 0.0),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  children: [
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Padding(
                                        padding: const EdgeInsetsDirectional.fromSTEB(
                                            0.0, 12.0, 0.0, 7.0),
                                        child: Container(
                                          width: 7.0,
                                          height: 7.0,
                                          decoration: BoxDecoration(
                                            color: FlutterFlowTheme.of(context)
                                                .secondaryText,
                                            shape: BoxShape.circle,
                                          ),
                                        ),
                                      ),
                                    ),
                                    Align(
                                      alignment: const AlignmentDirectional(0.0, 1.0),
                                      child: Container(
                                        width: 7.0,
                                        height: 7.0,
                                        decoration: BoxDecoration(
                                          color: FlutterFlowTheme.of(context)
                                              .secondaryText,
                                          shape: BoxShape.circle,
                                        ),
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
                ],
              ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 16.0, 16.0, 12.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  children: [
                    Container(
                      width: 300.0,
                      decoration: const BoxDecoration(),
                      child: Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(5.0, 0.0, 0.0, 0.0),
                        child: Text(
                          containerPostsRecord.body,
                          style:
                              FlutterFlowTheme.of(context).bodyMedium.override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              if (((containerPostsRecord.mediaUrls).isNotEmpty) ==
                  true)
                Padding(
                  padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 0.0, 0.0),
                  child: SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Row(
                      mainAxisSize: MainAxisSize.max,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Padding(
                          padding: const EdgeInsetsDirectional.fromSTEB(
                              0.0, 0.0, 16.0, 0.0),
                          child: Container(
                            width: 157.0,
                            height: 195.0,
                            decoration: BoxDecoration(
                              color: FlutterFlowTheme.of(context)
                                  .secondaryBackground,
                              borderRadius: BorderRadius.circular(12.0),
                            ),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12.0),
                              child: Image.network(
                                containerPostsRecord.mediaUrls.first,
                                width: 300.0,
                                height: 200.0,
                                fit: BoxFit.cover,
                              ),
                            ),
                          ),
                        ),
                        if (containerPostsRecord.mediaUrls.last != '')
                          Padding(
                            padding: const EdgeInsetsDirectional.fromSTEB(
                                0.0, 0.0, 16.0, 0.0),
                            child: Container(
                              width: 157.0,
                              height: 195.0,
                              decoration: BoxDecoration(
                                color: FlutterFlowTheme.of(context)
                                    .secondaryBackground,
                                borderRadius: BorderRadius.circular(12.0),
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(12.0),
                                child: Image.network(
                                  containerPostsRecord.mediaUrls[1],
                                  width: 300.0,
                                  height: 200.0,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                ),
              Padding(
                padding: const EdgeInsetsDirectional.fromSTEB(20.0, 0.0, 16.0, 0.0),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0.0, 0.0, 16.0, 0.0),
                      child: Container(
                        width: 118.0,
                        height: 61.0,
                        decoration: const BoxDecoration(),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Text(
                              formatNumber(
                                containerPostsRecord.likes.length,
                                formatType: FormatType.compact,
                              ),
                              style: FlutterFlowTheme.of(context)
                                  .bodyMedium
                                  .override(
                                    fontFamily: 'Inter',
                                    letterSpacing: 0.0,
                                  ),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Stack(
                                children: [
                                  if (containerPostsRecord.likes
                                          .contains(currentUserReference) ==
                                      false)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (containerPostsRecord.likes
                                                .contains(
                                                    currentUserReference) ==
                                            true) {
                                          await containerPostsRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'likes': FieldValue.arrayRemove(
                                                    [currentUserReference]),
                                              },
                                            ),
                                          });
                                        } else {
                                          await containerPostsRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'likes': FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                              },
                                            ),
                                          });
                                        }
                                      },
                                      child: Icon(
                                        Icons.favorite_border,
                                        color: FlutterFlowTheme.of(context)
                                            .secondaryText,
                                        size: 30.0,
                                      ),
                                    ),
                                  if (containerPostsRecord.likes
                                          .contains(currentUserReference) ==
                                      true)
                                    InkWell(
                                      splashColor: Colors.transparent,
                                      focusColor: Colors.transparent,
                                      hoverColor: Colors.transparent,
                                      highlightColor: Colors.transparent,
                                      onTap: () async {
                                        if (containerPostsRecord.likes
                                                .contains(
                                                    currentUserReference) ==
                                            true) {
                                          await containerPostsRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'likes': FieldValue.arrayRemove(
                                                    [currentUserReference]),
                                              },
                                            ),
                                          });
                                        } else {
                                          await containerPostsRecord.reference
                                              .update({
                                            ...mapToFirestore(
                                              {
                                                'likes': FieldValue.arrayUnion(
                                                    [currentUserReference]),
                                              },
                                            ),
                                          });
                                        }
                                      },
                                      child: const Icon(
                                        Icons.favorite_sharp,
                                        color: Color(0xFFF70917),
                                        size: 30.0,
                                      ),
                                    ),
                                ],
                              ),
                            ),
                            Text(
                              'Love',
                              style: FlutterFlowTheme.of(context)
                                  .bodyLarge
                                  .override(
                                    fontFamily: 'Inter',
                                    color: containerPostsRecord.likes
                                                .contains(
                                                    currentUserReference) ==
                                            true
                                        ? const Color(0xFFF70917)
                                        : FlutterFlowTheme.of(context)
                                            .primaryText,
                                    letterSpacing: 0.0,
                                  ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.265,
                      height: 61.0,
                      decoration: const BoxDecoration(),
                      child: InkWell(
                        splashColor: Colors.transparent,
                        focusColor: Colors.transparent,
                        hoverColor: Colors.transparent,
                        highlightColor: Colors.transparent,
                        onTap: () async {
                          context.pushNamed(
                            'postPage',
                            queryParameters: {
                              'postId': serializeParam(
                                containerPostsRecord.reference,
                                ParamType.DocumentReference,
                              ),
                            }.withoutNulls,
                          );
                        },
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: Text(
                                formatNumber(
                                  containerPostsRecord.numComments,
                                  formatType: FormatType.compact,
                                ),
                                style: FlutterFlowTheme.of(context)
                                    .bodyMedium
                                    .override(
                                      fontFamily: 'Inter',
                                      letterSpacing: 0.0,
                                    ),
                              ),
                            ),
                            const Padding(
                              padding: EdgeInsetsDirectional.fromSTEB(
                                  0.0, 0.0, 5.0, 0.0),
                              child: FaIcon(
                                FontAwesomeIcons.solidComment,
                                color: Color(0xFF57636C),
                                size: 30.0,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    Container(
                      width: MediaQuery.sizeOf(context).width * 0.124,
                      height: 46.0,
                      decoration: const BoxDecoration(),
                      child: ToggleIcon(
                        onPressed: () async {
                          final postBookmarksElement = currentUserReference;
                          final postBookmarksUpdate = containerPostsRecord
                                  .postBookmarks
                                  .contains(postBookmarksElement)
                              ? FieldValue.arrayRemove([postBookmarksElement])
                              : FieldValue.arrayUnion([postBookmarksElement]);
                          await containerPostsRecord.reference.update({
                            ...mapToFirestore(
                              {
                                'postBookmarks': postBookmarksUpdate,
                              },
                            ),
                          });
                          if (containerPostsRecord.postBookmarks
                                  .contains(currentUserReference) ==
                              true) {
                            await containerPostsRecord.reference.update({
                              ...mapToFirestore(
                                {
                                  'postBookmarks': FieldValue.arrayRemove(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          } else {
                            await containerPostsRecord.reference.update({
                              ...mapToFirestore(
                                {
                                  'postBookmarks': FieldValue.arrayUnion(
                                      [currentUserReference]),
                                },
                              ),
                            });
                          }
                        },
                        value: containerPostsRecord.postBookmarks
                            .contains(currentUserReference),
                        onIcon: Icon(
                          Icons.bookmark_sharp,
                          color: FlutterFlowTheme.of(context).warning,
                          size: 25.0,
                        ),
                        offIcon: Icon(
                          Icons.bookmark_border,
                          color: FlutterFlowTheme.of(context).secondaryText,
                          size: 25.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        );
      },
    );
  }
}
