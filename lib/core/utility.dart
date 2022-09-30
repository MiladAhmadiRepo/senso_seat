import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:senso_seat/screens/widgets/network.dart';

import '../screens/widgets/bluethooth.dart';
import 'constants.dart';

class Utility {
  final Connectivity _connectivity = Connectivity();

  Widget checkBluetoothConnectivity() {
    return StreamBuilder<BluetoothState>(
      stream: FlutterBluePlus.instance.state,
      initialData: BluetoothState.unknown,
      builder: (c, snapshot) {
        final state = snapshot.data;
        if (state == BluetoothState.on) {
          return BlueToothWidgets.activeBlueTooth();
        }
        return BlueToothWidgets.deActiveBlueTooth();
      },
    );
  }

  Widget checkNetworkConnectivity() {
    return StreamBuilder<ConnectivityResult>(
      stream: _connectivity.onConnectivityChanged,
      initialData: ConnectivityResult.none,
      builder: (c, snapshot) {
        final state = snapshot.data;
        if (state == ConnectivityResult.mobile || state == ConnectivityResult.wifi ) {
          return NetworkWidgets.activeNetwork();
        }
        return NetworkWidgets.deActiveNetwork();
      },
    );
  }

  String? fieldValidation(String? value,bool isPassword){
    if (value != null && value.isEmpty) {
      return isPassword? pleaseEnterPasswordString:pleaseEnterUsernameString;
    }
    if (value != null && value.length < 3) {
      return mustBeMoreThanString;
    }
    return null;
  }
}
