import 'package:flutter/cupertino.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class Profiles with ChangeNotifier {
  Map<String, dynamic> profiles = {};

  Future<void> fetchandsetprofiles(String id) async {
    var url = "https://61205d9424d11c001762ec2d.mockapi.io/gstprofile/";
    try {
      final response = await http.get(Uri.parse(url));
      final extracteddata = json.decode(response.body) as List<dynamic>;

      profiles = extracteddata[0][id];
    } catch (error) {
      throw (error);
    }
  }
}
