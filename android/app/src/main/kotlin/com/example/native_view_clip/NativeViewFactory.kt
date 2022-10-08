package com.example.native_view_clip

import android.content.Context
import android.graphics.Color
import android.view.View
import android.widget.TextView
import io.flutter.plugin.common.StandardMessageCodec
import io.flutter.plugin.platform.PlatformView
import io.flutter.plugin.platform.PlatformViewFactory

class NativeViewFactory(v: View) : PlatformViewFactory(StandardMessageCodec.INSTANCE) {

    private var view: View? = null

    init {
        view = v
    }


    override fun create(context: Context, viewId: Int, args: Any?): PlatformView {
        val creationParams = args as Map<String?, Any?>?
        return NativeView(context, viewId, creationParams, view!!)
    }
}


internal class NativeView(context: Context, id: Int, creationParams: Map<String?, Any?>?,v: View) : PlatformView {
    private var view: View? = null;

    override fun getView(): View {
        return view!!
    }

    override fun dispose() {}

    init {
        view = v
    }
}