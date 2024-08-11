import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/connectivity_provider.dart';
import 'package:lottie/lottie.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    final connectivityProvider = Provider.of<ConnectivityProvider>(context);

    String connectionStatus =
        _getConnectionStatus(connectivityProvider.connectivityResult);

    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Connectivity Checker',
          style: TextStyle(fontSize: 25),
        ),
      ),
      body: ListView(
        children: [
          getLottieImage(context, connectivityProvider.connectivityResult),
          Center(
              child: Text(
            connectionStatus,
            style: const TextStyle(fontSize: 25, fontWeight: FontWeight.w400),
          ))
        ],
      ),
    );
  }

  String _getConnectionStatus(ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return 'Connected To Mobile Internet';
      case ConnectivityResult.wifi:
        return 'Connected To Wifi';
      case ConnectivityResult.ethernet:
        return 'Connected To Ethernet';
      case ConnectivityResult.vpn:
        return 'Connected To VPN Connection';
      case ConnectivityResult.none:
        return 'No Internet Connection';
      default:
        return 'No Internet Connection';
    }
  }

  LottieBuilder getLottieImage(
      BuildContext context, ConnectivityResult result) {
    switch (result) {
      case ConnectivityResult.mobile:
        return commonLottieConf(context, 'assets/lottie/mobile_internet.json');
      case ConnectivityResult.wifi:
        return commonLottieConf(context, 'assets/lottie/wifi_internet.json');
      case ConnectivityResult.ethernet:
        return commonLottieConf(context, 'assets/lottie/ethernet.json');
      case ConnectivityResult.vpn:
        return commonLottieConf(context, 'assets/lottie/vpn.json');
      case ConnectivityResult.none:
        return commonLottieConf(context, 'assets/lottie/no_internet.json');
      default:
        return commonLottieConf(context, 'assets/lottie/no_internet.json');
    }
  }

  LottieBuilder commonLottieConf(BuildContext context, String location) {
    return Lottie.asset(
      location,
      height: MediaQuery.of(context).size.height * 0.5,
      width: MediaQuery.of(context).size.width * 0.70,
    );
  }
}
