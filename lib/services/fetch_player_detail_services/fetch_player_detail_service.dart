import 'dart:convert';
import 'package:flutter/services.dart';
import 'package:player_pedia/model/player_detail/player_detail.dart';
import 'package:player_pedia/services/api_call_service.dart';


class FetchUserDetailService{
  // region Common Variables
  late ApiCallService apiCallService;
  // endregion

  //region Constructor
  FetchUserDetailService() {
    apiCallService = ApiCallService();
  }
  //endregion

  // region Get player detail
  Future<List<PlayerDetail>> getPlayerDetail({required int limit, required int offset}) async {
    String data = await rootBundle.loadString('assets/json_files/player_info.json');
    Map<String, dynamic> jsonData = await json.decode(data);
    
    // Assuming the JSON has a "players" array field
    List<dynamic> playersJson = jsonData['players'] ?? [];
    
    // Convert JSON to List<PlayerDetail>
    List<PlayerDetail> players = playersJson
        .map((player) => PlayerDetail.fromJson(player))
        .toList();
    
    // Apply pagination
    int start = offset;
    int end = (offset + limit).clamp(0, players.length);
    
    return players.sublist(start, end);
  }
// endregion




  // Future<SellerDeliveryStoreResponse> getDeliveryStoreSettings({required String storeRef, required String? productReference}) async {
  //   // get body [for POST request]
  //   // endregion
  //   Map<String, dynamic> response;
  //   String url = "${AppConstants.getSellerStoreDeliverySettings}store/$storeRef/product/${productReference ?? 0}/";

  //   //#region Region - Execute Request
  //   response = await httpService.getApiCall(url);
  //   // return response;

  //   if(response["message"]== "not exists"){
  //     String data = await rootBundle.loadString('assets/delivery_and_return_default_response/delivery_setting_default.json');
  //     Map<String,dynamic> deliveryJson = await json.decode(data);
  //     // Update the Map with values from the response
  //     deliveryJson['data']['is_pan_exists'] = response['is_pan_exists'];
  //     deliveryJson['data']['is_gst_exists'] = response['is_gst_exists'];
  //     deliveryJson['data']['trustcenter_location_state'] = response['trustcenter_location_state'] ?? '';


  //     // response = json.decode(data);
  //     response = deliveryJson;
  //     print("No settings");
  //   }

  //   //   final String data = await rootBundle.loadString('assets/notification.json');
  //   //   Map<String, dynamic> jsonResponse = json.decode(data);

  //   return SellerDeliveryStoreResponse.fromJson(response);
  // }


}