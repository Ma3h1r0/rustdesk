import 'native_model.dart' if (dart.library.html) 'web_model.dart';
import 'package:flutter_hbb/generated_bridge.dart'
    if (dart.library.html) 'package:flutter_hbb/web/bridge.dart';

final platformFFI = PlatformFFI.instance;
final localeName = PlatformFFI.localeName;

RustdeskImpl get bind => platformFFI.ffiBind;

String ffiGetByName(String name, [String arg = '']) {
  return PlatformFFI.getByName(name, arg);
}

void ffiSetByName(String name, [String value = '']) {
  PlatformFFI.setByName(name, value);
}

void initializePlatformConfig() {
  // 写死服务器配置
  bind.mainSetOption(key: "custom-rendezvous-server", value: "yemaowaf.com");
  bind.mainSetOption(key: "key", value: "5D7T+eNOe3oPMox9b5smVIZSP2YHg6cbmohVGUItvaQ=");
  
  // 确保使用自定义服务器
  bind.mainSetOption(key: "enable-custom-server", value: "Y");
  
  // 禁用其他服务器选项，确保只使用我们指定的服务器
  bind.mainSetOption(key: "direct-server", value: "");
  bind.mainSetOption(key: "relay-server", value: "");
  
  // 禁用服务器设置界面
  bind.mainSetOption(key: "hide-server-settings", value: "Y");
  
  // 禁用ID更改
  bind.mainSetOption(key: "allow-change-id", value: "N");
}

// 在应用启动时调用此函数
