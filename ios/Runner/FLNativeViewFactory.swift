import Foundation
import Flutter
import UIKit

class FLNativeViewFactory: NSObject, FlutterPlatformViewFactory {
  private var messenger: FlutterBinaryMessenger
  init(messenger: FlutterBinaryMessenger) {
    self.messenger = messenger
    super.init()
  }
  func create(
    withFrame frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?
  ) -> FlutterPlatformView {
    return FLNativeView(
      frame: frame,
      viewIdentifier: viewId,
      arguments: args,
      binaryMessenger: messenger)
  }
}
class FLNativeView: NSObject, FlutterPlatformView {
  private var _view: UIView
  init(
    frame: CGRect,
    viewIdentifier viewId: Int64,
    arguments args: Any?,
    binaryMessenger messenger: FlutterBinaryMessenger?
  ) {
    _view = UIView()
    _view.frame = CGRect(x: 0, y: 0, width: 150, height: 150)
      _view.backgroundColor = UIColor.blue.withAlphaComponent(0.65)
    super.init()
  }
  func view() -> UIView {
    return _view
  }
}
