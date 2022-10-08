import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:flutter/services.dart';

class NativeViewClipOval extends StatefulWidget {
  const NativeViewClipOval({Key? key}) : super(key: key);

  @override
  _NativeViewClipOvalState createState() => _NativeViewClipOvalState();
}

class _NativeViewClipOvalState extends State<NativeViewClipOval> {
  @override
  Widget build(BuildContext context) {
    // This is used in the platform side to register the view.
    const String viewType = '<native_view>';
    // Pass parameters to the platform side.
    final Map<String, dynamic> creationParams = <String, dynamic>{};

    return Scaffold(
      backgroundColor: Colors.black12,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Text(
              Platform.isAndroid ? "Clip oval Android" : "Clip oval IOS",
              style: const TextStyle(
                fontSize: 22,
                color: Colors.white,
              ),
            ),
            ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.pinkAccent,
                child: Platform.isIOS
                    ? UiKitView(
                        viewType: viewType,
                        layoutDirection: TextDirection.ltr,
                        creationParams: creationParams,
                        creationParamsCodec: const StandardMessageCodec(),
                      )
                    : PlatformViewLink(
                        viewType: viewType,
                        surfaceFactory: (BuildContext context,
                            PlatformViewController controller) {
                          return PlatformViewSurface(
                            controller: controller,
                            hitTestBehavior: PlatformViewHitTestBehavior.opaque,
                            gestureRecognizers: const <
                                Factory<OneSequenceGestureRecognizer>>{},
                          );
                        },
                        onCreatePlatformView:
                            (PlatformViewCreationParams params) {
                          return PlatformViewsService.initExpensiveAndroidView(
                            id: params.id,
                            viewType: viewType,
                            layoutDirection: TextDirection.ltr,
                            creationParams: creationParams,
                            creationParamsCodec: const StandardMessageCodec(),
                          )
                            ..addOnPlatformViewCreatedListener(
                                params.onPlatformViewCreated)
                            ..create();
                        },
                      ),
              ),
            ),
            const Text(
              "Clip oval Flutter",
              style: TextStyle(fontSize: 22, color: Colors.white),
            ),
            ClipOval(
              child: Container(
                width: 150,
                height: 150,
                color: Colors.blueAccent,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
