import 'dart:convert';
import 'dart:io';

import 'package:device_info/device_info.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/services.dart';
import 'package:path/path.dart';
import 'package:shared_preferences/shared_preferences.dart';

class Prefs {
  Future<SharedPreferences> _prefs = SharedPreferences.getInstance();
  bool get isSignedIn => token != null && token != '';
  String token;
  String transactionSort;
  Locale locale;
  Map<String, dynamic> deviceInfo;
  Map<String, dynamic> setting;
  bool push;

  Prefs._();

  static final single = Prefs._();

  Future init() async {

    // init shared preferences
    var pref = await _prefs;

    // 
    push = pref.getBool('push') ?? true;
    if (pref.getString('locale') != null)
      locale = Locale(pref.getString('locale').split('-')[0],
          pref.getString('locale').split('-')[1]);
    token = pref.getString('token');
    if (pref.getString('deviceInfo') == null)
      await saveDeviceInfo(await _getDeviceInfo());
    deviceInfo = jsonDecode(pref.getString('deviceInfo'));
    transactionSort = pref.getString('transactionSort') ?? 'By time';
    if (pref.getString('setting') != null)
      setting = jsonDecode(pref.getString('setting'));
    // token = 'e880314c-458f-11eb-bf4d-d09466848fec';
  }

  Future saveSetting(Map json) async {
    var pref = await _prefs;
    await pref.setString('setting', jsonEncode(json));
  }

  Future savePush(bool pushToSave) async {
    push = pushToSave;
    var pref = await _prefs;
    await pref.setBool('push', pushToSave);
  }

  Future saveToken(String tokenToSave) async {
    token = tokenToSave;
    var pref = await _prefs;
    await pref.setString('token', tokenToSave);
  }

  Future saveDeviceInfo(Map<String, dynamic> deviceInfoToSave) async {
    var pref = await _prefs;
    deviceInfo = deviceInfoToSave;
    await pref.setString('deviceInfo', jsonEncode(deviceInfoToSave));
  }

  Future saveTransactionSort(String transactionSortToSave) async {
    var pref = await _prefs;
    transactionSort = transactionSortToSave;
    await pref.setString('transactionSort', transactionSortToSave);
  }

  Future saveLocale(Locale localeToSave) async {
    locale = localeToSave;
    var pref = await _prefs;
    localeToSave == Locale('vi', 'VN')
        ? await pref.setString('locale', 'vi-VN')
        : await pref.setString('locale', 'en-US');
  }

  Future deleteAll() async {
    var pref = await _prefs;
    await pref.setString('token', null);
    await pref.setString('deviceInfo', null);
    await pref.setString('transactionSort', null);
    await pref.setString('setting', null);
    token = null;
    deviceInfo = null;
    transactionSort = null;
    setting = null;
  }

  Future _getDeviceInfo() async {
    final DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    Map<String, dynamic> deviceData;
    try {
      if (Platform.isAndroid) {
        deviceData = _readAndroidBuildData(await deviceInfoPlugin.androidInfo);
      } else if (Platform.isIOS) {
        deviceData = _readIosDeviceInfo(await deviceInfoPlugin.iosInfo);
      }
    } on PlatformException {
      deviceData = <String, dynamic>{
        'Error:': 'Failed to get platform version.'
      };
    }
    return deviceData;
  }

  Map<String, dynamic> _readAndroidBuildData(AndroidDeviceInfo build) {
    return <String, dynamic>{
      "version.securityPatch": build.version.securityPatch,
      "version.sdkInt": build.version.sdkInt,
      "version.release": build.version.release,
      "version.previewSdkInt": build.version.previewSdkInt,
      "version.incremental": build.version.incremental,
      "version.codename": build.version.codename,
      "version.baseOS": build.version.baseOS,
      "board": build.board,
      "bootloader": build.bootloader,
      "brand": build.brand,
      "device": build.device,
      "display": build.display,
      "fingerprint": build.fingerprint,
      "hardware": build.hardware,
      "host": build.host,
      "id": build.id,
      "manufacturer": build.manufacturer,
      "model": build.model,
      "product": build.product,
      "supported32BitAbis": build.supported32BitAbis,
      "supported64BitAbis": build.supported64BitAbis,
      "supportedAbis": build.supportedAbis,
      "tags": build.tags,
      "type": build.type,
      "isPhysicalDevice": build.isPhysicalDevice,
      "androidId": build.androidId,
      "systemFeatures": build.systemFeatures,
    };
  }

  Map<String, dynamic> _readIosDeviceInfo(IosDeviceInfo data) {
    return <String, dynamic>{
      "name": data.name,
      "systemName": data.systemName,
      "systemVersion": data.systemVersion,
      "model": data.model,
      "localizedModel": data.localizedModel,
      "identifierForVendor": data.identifierForVendor,
      "isPhysicalDevice": data.isPhysicalDevice,
      "utsname.sysname:": data.utsname.sysname,
      "utsname.nodename:": data.utsname.nodename,
      "utsname.release:": data.utsname.release,
      "utsname.version:": data.utsname.version,
      "utsname.machine:": data.utsname.machine,
    };
  }
}
