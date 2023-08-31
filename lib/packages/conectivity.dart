import 'dart:async';
import 'package:flutter/material.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

class ConectivityStatus extends StatefulWidget {
  const ConectivityStatus({Key? key}) : super(key: key);

  @override
  State<ConectivityStatus> createState() => _ConectivityStatusState();
}

class _ConectivityStatusState extends State<ConectivityStatus> {
  String connectionStatus = '...';

  late StreamSubscription sub;
  @override
  void initState() {
    super.initState();

    sub = Connectivity().onConnectivityChanged.listen(
      (ConnectivityResult result) {
        debugPrint(
          'New connectivity status: $result',
        );
      },
    );
  }

  @override
  void dispose() {
    sub.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return  Center(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              ElevatedButton(
                onPressed: checkStatus,
                child: const Text(
                  'Check Status',
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Text(
                connectionStatus,
                style: const TextStyle(
                  fontSize: 20,
                ),
              ),
              const SizedBox(
                height: 30,
              ),
            ],
          ),
        );
  }

  void checkStatus() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile) {
      debugPrint(
        'Connected to a mobile network',
      );

      setState(
        () {
          connectionStatus = 'Connected to a mobile network';
        },
      );
    } else if (connectivityResult == ConnectivityResult.wifi) {
      debugPrint(
        'Connected to a wifi network',
      );

      setState(
        () {
          connectionStatus = 'Connected to a wifi network';
        },
      );
    }else {
      setState(() {
        connectionStatus='There is no connection';
      });
      
    }
  }
}
