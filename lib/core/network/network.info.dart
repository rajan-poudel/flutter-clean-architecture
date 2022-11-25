abstract class NetworkInfo {
  bool get isConnected;
  // Stream<DataConnectionStatus> get connectionStream;
}

class NetworkInfoImpl implements NetworkInfo {
  // final DataConnectionChecker connectionChecker;
  // NetworkInfoImpl(this.connectionChecker);

  @override
  bool get isConnected => true;

  // @override
  // Stream<DataConnectionStatus> get connectionStream => connectionChecker.onStatusChange;

}

// import 'package:connectivity_plus/connectivity_plus.dart';

// abstract class NetworkInfo {
//     Future<bool> get isConnected;

//   Future<void> get initConnectivity;
// }

// class NetworkInfoImpl implements NetworkInfo {
//        ConnectivityResult result;
//        Connectivity connectivity;

//        NetworkInfoImpl(this.result,this.connectivity);

//   // ignore: empty_constructor_bodies
//   @override
//   Future<void> get initConnectivity async {

//     try {
//       result = await connectivity.checkConnectivity();
//     } catch (e) {
//       rethrow;
//     }
//     return _updateConnectionStatus(result);
//   }

//   @override
//   Future<void> _updateConnectionStatus(ConnectivityResult result) async {
//     result;
//   }
  
//   @override
//   Future<bool> get isConnected => connectivity.checkConnectivity();
// }
