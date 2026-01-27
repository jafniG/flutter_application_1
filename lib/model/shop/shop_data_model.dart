// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class ShopDataModel {
  final bool? error;
  final SubDataModel? data;
  ShopDataModel({this.error, this.data});

  ShopDataModel copyWith({bool? error, SubDataModel? data}) {
    return ShopDataModel(error: error ?? this.error, data: data ?? this.data);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'error': error, 'data': data?.toMap()};
  }

  factory ShopDataModel.fromMap(Map<String, dynamic> map) {
    return ShopDataModel(
      error: map['error'] != null ? map['error'] as bool : null,
      data: map['data'] != null
          ? SubDataModel.fromMap(map['data'] as Map<String, dynamic>)
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopDataModel.fromJson(String source) =>
      ShopDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShopDataModel(error: $error, data: $data)';

  @override
  bool operator ==(covariant ShopDataModel other) {
    if (identical(this, other)) return true;

    return other.error == error && other.data == data;
  }

  @override
  int get hashCode => error.hashCode ^ data.hashCode;
}

class SubDataModel {
  final List<ShopListDataModel> shopList;
  SubDataModel({required this.shopList});

  SubDataModel copyWith({List<ShopListDataModel>? shopList}) {
    return SubDataModel(shopList: shopList ?? this.shopList);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'shopList': shopList.map((x) => x.toMap()).toList(),
    };
  }

  factory SubDataModel.fromMap(Map<String, dynamic> map) {
    return SubDataModel(
      shopList: List<ShopListDataModel>.from(
        (map['shopList'] as List<dynamic>).map<ShopListDataModel>(
          (x) => ShopListDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubDataModel.fromJson(String source) =>
      SubDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubDataModel(shopList: $shopList)';

  @override
  bool operator ==(covariant SubDataModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.shopList, shopList);
  }

  @override
  int get hashCode => shopList.hashCode;
}

class ShopListDataModel {
  final String? id;
  final String? shopName;
  final String? shopUrl;
  final String? shopStatus;
  final String? address1;
  final String? address2;
  final String? town;
  final String? postcode;
  final String? averageDeliveryTime;
  final String? averageDeliveryKm;
  final String? status;
  final String? latitude;
  final String? longitude;
  final String? photo;
  final List<OpeningHoursDataModel> openingHours;
  final List<String>? shopCategories;
  final bool? isFavourite;
  final int? favouriteId;
  ShopListDataModel({
    this.id,
    this.shopName,
    this.shopUrl,
    this.shopStatus,
    this.address1,
    this.address2,
    this.town,
    this.postcode,
    this.averageDeliveryTime,
    this.averageDeliveryKm,
    this.status,
    this.latitude,
    this.longitude,
    this.photo,
    required this.openingHours,
    this.shopCategories,
    this.isFavourite,
    this.favouriteId,
  });

  ShopListDataModel copyWith({
    String? id,
    String? shopName,
    String? shopUrl,
    String? shopStatus,
    String? address1,
    String? address2,
    String? town,
    String? postcode,
    String? averageDeliveryTime,
    String? averageDeliveryKm,
    String? status,
    String? latitude,
    String? longitude,
    String? photo,
    List<OpeningHoursDataModel>? openingHours,
    List<String>? shopCategories,
    bool? isFavourite,
    int? favouriteId,
  }) {
    return ShopListDataModel(
      id: id ?? this.id,
      shopName: shopName ?? this.shopName,
      shopUrl: shopUrl ?? this.shopUrl,
      shopStatus: shopStatus ?? this.shopStatus,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      town: town ?? this.town,
      postcode: postcode ?? this.postcode,
      averageDeliveryTime: averageDeliveryTime ?? this.averageDeliveryTime,
      averageDeliveryKm: averageDeliveryKm ?? this.averageDeliveryKm,
      status: status ?? this.status,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      photo: photo ?? this.photo,
      openingHours: openingHours ?? this.openingHours,
      shopCategories: shopCategories ?? this.shopCategories,
      isFavourite: isFavourite ?? this.isFavourite,
      favouriteId: favouriteId ?? this.favouriteId,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'shopName': shopName,
      'shopUrl': shopUrl,
      'shopStatus': shopStatus,
      'address1': address1,
      'address2': address2,
      'town': town,
      'postcode': postcode,
      'averageDeliveryTime': averageDeliveryTime,
      'averageDeliveryKm': averageDeliveryKm,
      'status': status,
      'latitude': latitude,
      'longitude': longitude,
      'photo': photo,
      'openingHours': openingHours.map((x) => x.toMap()).toList(),
      'shopCategories': shopCategories,
      'isFavourite': isFavourite,
      'favouriteId': favouriteId,
    };
  }

  factory ShopListDataModel.fromMap(Map<String, dynamic> map) {
    return ShopListDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      shopName: map['shopName'] != null ? map['shopName'] as String : null,
      shopUrl: map['shopUrl'] != null ? map['shopUrl'] as String : null,
      shopStatus: map['shopStatus'] != null
          ? map['shopStatus'] as String
          : null,
      address1: map['address1'] != null ? map['address1'] as String : null,
      address2: map['address2'] != null ? map['address2'] as String : null,
      town: map['town'] != null ? map['town'] as String : null,
      postcode: map['postcode'] != null ? map['postcode'] as String : null,
      averageDeliveryTime: map['averageDeliveryTime'] != null
          ? map['averageDeliveryTime'] as String
          : null,
      averageDeliveryKm: map['averageDeliveryKm'] != null
          ? map['averageDeliveryKm'] as String
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      latitude: map['latitude'] != null ? map['latitude'] as String : null,
      longitude: map['longitude'] != null ? map['longitude'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      openingHours: List<OpeningHoursDataModel>.from(
        (map['openingHours'] as List<dynamic>).map<OpeningHoursDataModel>(
          (x) => OpeningHoursDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      shopCategories: map['shopCategories'] != null
          ? List<String>.from((map['shopCategories'] as List<dynamic>))
          : null,
      isFavourite: map['isFavourite'] != null
          ? map['isFavourite'] as bool
          : null,
      favouriteId: map['favouriteId'] != null
          ? map['favouriteId'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopListDataModel.fromJson(String source) =>
      ShopListDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ShopListDataModel(id: $id, shopName: $shopName, shopUrl: $shopUrl, shopStatus: $shopStatus, address1: $address1, address2: $address2, town: $town, postcode: $postcode, averageDeliveryTime: $averageDeliveryTime, averageDeliveryKm: $averageDeliveryKm, status: $status, latitude: $latitude, longitude: $longitude, photo: $photo, openingHours: $openingHours, shopCategories: $shopCategories, isFavourite: $isFavourite, favouriteId: $favouriteId)';
  }

  @override
  bool operator ==(covariant ShopListDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.shopName == shopName &&
        other.shopUrl == shopUrl &&
        other.shopStatus == shopStatus &&
        other.address1 == address1 &&
        other.address2 == address2 &&
        other.town == town &&
        other.postcode == postcode &&
        other.averageDeliveryTime == averageDeliveryTime &&
        other.averageDeliveryKm == averageDeliveryKm &&
        other.status == status &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.photo == photo &&
        listEquals(other.openingHours, openingHours) &&
        listEquals(other.shopCategories, shopCategories) &&
        other.isFavourite == isFavourite &&
        other.favouriteId == favouriteId;
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopName.hashCode ^
        shopUrl.hashCode ^
        shopStatus.hashCode ^
        address1.hashCode ^
        address2.hashCode ^
        town.hashCode ^
        postcode.hashCode ^
        averageDeliveryTime.hashCode ^
        averageDeliveryKm.hashCode ^
        status.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        photo.hashCode ^
        openingHours.hashCode ^
        shopCategories.hashCode ^
        isFavourite.hashCode ^
        favouriteId.hashCode;
  }
}

class OpeningHoursDataModel {
  final String? daytitle;
  final String? start_time;
  final String? end_time;
  OpeningHoursDataModel({this.daytitle, this.start_time, this.end_time});

  OpeningHoursDataModel copyWith({
    String? daytitle,
    String? start_time,
    String? end_time,
  }) {
    return OpeningHoursDataModel(
      daytitle: daytitle ?? this.daytitle,
      start_time: start_time ?? this.start_time,
      end_time: end_time ?? this.end_time,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'daytitle': daytitle,
      'start_time': start_time,
      'end_time': end_time,
    };
  }

  factory OpeningHoursDataModel.fromMap(Map<String, dynamic> map) {
    return OpeningHoursDataModel(
      daytitle: map['daytitle'] != null ? map['daytitle'] as String : null,
      start_time: map['start_time'] != null
          ? map['start_time'] as String
          : null,
      end_time: map['end_time'] != null ? map['end_time'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OpeningHoursDataModel.fromJson(String source) =>
      OpeningHoursDataModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'OpeningHoursDataModel(daytitle: $daytitle, start_time: $start_time, end_time: $end_time)';

  @override
  bool operator ==(covariant OpeningHoursDataModel other) {
    if (identical(this, other)) return true;

    return other.daytitle == daytitle &&
        other.start_time == start_time &&
        other.end_time == end_time;
  }

  @override
  int get hashCode =>
      daytitle.hashCode ^ start_time.hashCode ^ end_time.hashCode;
}
