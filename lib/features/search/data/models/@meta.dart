// /// server_time : 1750933320
// /// server_timezone : "CET"
// /// api_version : 2
// /// execution_time : "0 ms"
//
// class @meta {
//   @meta({
//       this.serverTime,
//       this.serverTimezone,
//       this.apiVersion,
//       this.executionTime,});
//
//   @meta.fromJson(dynamic json) {
//     serverTime = json['server_time'];
//     serverTimezone = json['server_timezone'];
//     apiVersion = json['api_version'];
//     executionTime = json['execution_time'];
//   }
//   int? serverTime;
//   String? serverTimezone;
//   int? apiVersion;
//   String? executionTime;
//
//   Map<String, dynamic> toJson() {
//     final map = <String, dynamic>{};
//     map['server_time'] = serverTime;
//     map['server_timezone'] = serverTimezone;
//     map['api_version'] = apiVersion;
//     map['execution_time'] = executionTime;
//     return map;
//   }
//
// }