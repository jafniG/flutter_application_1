// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

import 'package:flutter_application_1/model/products/categories_data_model.dart';

class ShopDetailsDataModel {
  final bool? error;
  final ShopDetailsSubDataModel data;
  ShopDetailsDataModel({this.error, required this.data});

  ShopDetailsDataModel copyWith({bool? error, ShopDetailsSubDataModel? data}) {
    return ShopDetailsDataModel(
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'error': error, 'data': data.toMap()};
  }

  factory ShopDetailsDataModel.fromMap(Map<String, dynamic> map) {
    return ShopDetailsDataModel(
      error: map['error'] != null ? map['error'] as bool : null,
      data: ShopDetailsSubDataModel.fromMap(
        map['data'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopDetailsDataModel.fromJson(String source) =>
      ShopDetailsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ShopDetailsDataModel(error: $error, data: $data)';

  @override
  bool operator ==(covariant ShopDetailsDataModel other) {
    if (identical(this, other)) return true;

    return other.error == error && other.data == data;
  }

  @override
  int get hashCode => error.hashCode ^ data.hashCode;
}

class ShopDetailsSubDataModel {
  final String? id;
  final String? shopName;
  final String? shopUrl;
  final String? shopStatus;
  final String? countryCode;
  final String? mobile;
  final String? address1;
  final String? address2;
  final String? town;
  final String? postcode;
  final String? country;
  final String? currency;
  final String? currencyIcon;
  final String? timezone;
  final String? averageDeliveryTime;
  final String? averageDeliveryKm;
  final String? status;
  final String? latitude;
  final String? longitude;
  final String? photo;
  final List<OpeningHoursDataModel> openingHours;
  final List<String>? shopCategories;
  ShopDetailsSubDataModel({
    this.id,
    this.shopName,
    this.shopUrl,
    this.shopStatus,
    this.countryCode,
    this.mobile,
    this.address1,
    this.address2,
    this.town,
    this.postcode,
    this.country,
    this.currency,
    this.currencyIcon,
    this.timezone,
    this.averageDeliveryTime,
    this.averageDeliveryKm,
    this.status,
    this.latitude,
    this.longitude,
    this.photo,
    required this.openingHours,
    this.shopCategories,
  });

  ShopDetailsSubDataModel copyWith({
    String? id,
    String? shopName,
    String? shopUrl,
    String? shopStatus,
    String? countryCode,
    String? mobile,
    String? address1,
    String? address2,
    String? town,
    String? postcode,
    String? country,
    String? currency,
    String? currencyIcon,
    String? timezone,
    String? averageDeliveryTime,
    String? averageDeliveryKm,
    String? status,
    String? latitude,
    String? longitude,
    String? photo,
    List<OpeningHoursDataModel>? openingHours,
    List<String>? shopCategories,
  }) {
    return ShopDetailsSubDataModel(
      id: id ?? this.id,
      shopName: shopName ?? this.shopName,
      shopUrl: shopUrl ?? this.shopUrl,
      shopStatus: shopStatus ?? this.shopStatus,
      countryCode: countryCode ?? this.countryCode,
      mobile: mobile ?? this.mobile,
      address1: address1 ?? this.address1,
      address2: address2 ?? this.address2,
      town: town ?? this.town,
      postcode: postcode ?? this.postcode,
      country: country ?? this.country,
      currency: currency ?? this.currency,
      currencyIcon: currencyIcon ?? this.currencyIcon,
      timezone: timezone ?? this.timezone,
      averageDeliveryTime: averageDeliveryTime ?? this.averageDeliveryTime,
      averageDeliveryKm: averageDeliveryKm ?? this.averageDeliveryKm,
      status: status ?? this.status,
      latitude: latitude ?? this.latitude,
      longitude: longitude ?? this.longitude,
      photo: photo ?? this.photo,
      openingHours: openingHours ?? this.openingHours,
      shopCategories: shopCategories ?? this.shopCategories,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'shopName': shopName,
      'shopUrl': shopUrl,
      'shopStatus': shopStatus,
      'countryCode': countryCode,
      'mobile': mobile,
      'address1': address1,
      'address2': address2,
      'town': town,
      'postcode': postcode,
      'country': country,
      'currency': currency,
      'currencyIcon': currencyIcon,
      'timezone': timezone,
      'averageDeliveryTime': averageDeliveryTime,
      'averageDeliveryKm': averageDeliveryKm,
      'status': status,
      'latitude': latitude,
      'longitude': longitude,
      'photo': photo,
      'openingHours': openingHours.map((x) => x.toMap()).toList(),
      'shopCategories': shopCategories,
    };
  }

  factory ShopDetailsSubDataModel.fromMap(Map<String, dynamic> map) {
    return ShopDetailsSubDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      shopName: map['shopName'] != null ? map['shopName'] as String : null,
      shopUrl: map['shopUrl'] != null ? map['shopUrl'] as String : null,
      shopStatus: map['shopStatus'] != null
          ? map['shopStatus'] as String
          : null,
      countryCode: map['countryCode'] != null
          ? map['countryCode'] as String
          : null,
      mobile: map['mobile'] != null ? map['mobile'] as String : null,
      address1: map['address1'] != null ? map['address1'] as String : null,
      address2: map['address2'] != null ? map['address2'] as String : null,
      town: map['town'] != null ? map['town'] as String : null,
      postcode: map['postcode'] != null ? map['postcode'] as String : null,
      country: map['country'] != null ? map['country'] as String : null,
      currency: map['currency'] != null ? map['currency'] as String : null,
      currencyIcon: map['currencyIcon'] != null
          ? map['currencyIcon'] as String
          : null,
      timezone: map['timezone'] != null ? map['timezone'] as String : null,
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
    );
  }

  String toJson() => json.encode(toMap());

  factory ShopDetailsSubDataModel.fromJson(String source) =>
      ShopDetailsSubDataModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'ShopDetailsSubDataModel(id: $id, shopName: $shopName, shopUrl: $shopUrl, shopStatus: $shopStatus, countryCode: $countryCode, mobile: $mobile, address1: $address1, address2: $address2, town: $town, postcode: $postcode, country: $country, currency: $currency, currencyIcon: $currencyIcon, timezone: $timezone, averageDeliveryTime: $averageDeliveryTime, averageDeliveryKm: $averageDeliveryKm, status: $status, latitude: $latitude, longitude: $longitude, photo: $photo, openingHours: $openingHours, shopCategories: $shopCategories)';
  }

  @override
  bool operator ==(covariant ShopDetailsSubDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.shopName == shopName &&
        other.shopUrl == shopUrl &&
        other.shopStatus == shopStatus &&
        other.countryCode == countryCode &&
        other.mobile == mobile &&
        other.address1 == address1 &&
        other.address2 == address2 &&
        other.town == town &&
        other.postcode == postcode &&
        other.country == country &&
        other.currency == currency &&
        other.currencyIcon == currencyIcon &&
        other.timezone == timezone &&
        other.averageDeliveryTime == averageDeliveryTime &&
        other.averageDeliveryKm == averageDeliveryKm &&
        other.status == status &&
        other.latitude == latitude &&
        other.longitude == longitude &&
        other.photo == photo &&
        listEquals(other.openingHours, openingHours) &&
        listEquals(other.shopCategories, shopCategories);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        shopName.hashCode ^
        shopUrl.hashCode ^
        shopStatus.hashCode ^
        countryCode.hashCode ^
        mobile.hashCode ^
        address1.hashCode ^
        address2.hashCode ^
        town.hashCode ^
        postcode.hashCode ^
        country.hashCode ^
        currency.hashCode ^
        currencyIcon.hashCode ^
        timezone.hashCode ^
        averageDeliveryTime.hashCode ^
        averageDeliveryKm.hashCode ^
        status.hashCode ^
        latitude.hashCode ^
        longitude.hashCode ^
        photo.hashCode ^
        openingHours.hashCode ^
        shopCategories.hashCode;
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
