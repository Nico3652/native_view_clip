package com.example.native_view_clip

import android.view.LayoutInflater
import android.view.View
import io.flutter.embedding.android.FlutterActivity
import io.flutter.embedding.engine.FlutterEngine

class MainActivity: FlutterActivity() {
    override fun configureFlutterEngine(flutterEngine: FlutterEngine) {
        super.configureFlutterEngine(flutterEngine)

        val view: View = LayoutInflater.from(this).inflate(R.layout.test_view, null)

        flutterEngine
            .platformViewsController
            .registry
            .registerViewFactory("<native_view>", NativeViewFactory(view))
    }
}
