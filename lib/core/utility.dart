import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:flutter_blue_plus/flutter_blue_plus.dart';
import 'package:senso_seat/lib/widgets/network.dart';

import '../lib/widgets/bluethooth.dart';

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
}
