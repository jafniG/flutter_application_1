// ignore_for_file: public_member_api_docs, sort_constructors_first
import 'dart:convert';

import 'package:flutter/foundation.dart';

class CategoriesDataModel {
  final bool? error;
  final SubDataModel data;
  CategoriesDataModel({this.error, required this.data});

  CategoriesDataModel copyWith({bool? error, SubDataModel? data}) {
    return CategoriesDataModel(
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'error': error, 'data': data.toMap()};
  }

  factory CategoriesDataModel.fromMap(Map<String, dynamic> map) {
    return CategoriesDataModel(
      error: map['error'] != null ? map['error'] as bool : null,
      data: SubDataModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesDataModel.fromJson(String source) =>
      CategoriesDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CategoriesDataModel(error: $error, data: $data)';

  @override
  bool operator ==(covariant CategoriesDataModel other) {
    if (identical(this, other)) return true;

    return other.error == error && other.data == data;
  }

  @override
  int get hashCode => error.hashCode ^ data.hashCode;
}

class SubDataModel {
  final MenuDataModel menuDetails;
  final List<ItemsDataModel> items;
  SubDataModel({required this.menuDetails, required this.items});

  SubDataModel copyWith({
    MenuDataModel? menuDetails,
    List<ItemsDataModel>? items,
  }) {
    return SubDataModel(
      menuDetails: menuDetails ?? this.menuDetails,
      items: items ?? this.items,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'menuDetails': menuDetails.toMap(),
      'items': items.map((x) => x.toMap()).toList(),
    };
  }

  factory SubDataModel.fromMap(Map<String, dynamic> map) {
    return SubDataModel(
      menuDetails: MenuDataModel.fromMap(
        map['menuDetails'] as Map<String, dynamic>,
      ),
      items: List<ItemsDataModel>.from(
        (map['items'] as List<dynamic>).map<ItemsDataModel>(
          (x) => ItemsDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory SubDataModel.fromJson(String source) =>
      SubDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'SubDataModel(menuDetails: $menuDetails, items: $items)';

  @override
  bool operator ==(covariant SubDataModel other) {
    if (identical(this, other)) return true;

    return other.menuDetails == menuDetails && listEquals(other.items, items);
  }

  @override
  int get hashCode => menuDetails.hashCode ^ items.hashCode;
}

class MenuDataModel {
  final String? id;
  final String? shopID;
  final String? title;
  MenuDataModel({this.id, this.shopID, this.title});

  MenuDataModel copyWith({String? id, String? shopID, String? title}) {
    return MenuDataModel(
      id: id ?? this.id,
      shopID: shopID ?? this.shopID,
      title: title ?? this.title,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'shopID': shopID, 'title': title};
  }

  factory MenuDataModel.fromMap(Map<String, dynamic> map) {
    return MenuDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      shopID: map['shopID'] != null ? map['shopID'] as String : null,
      title: map['title'] != null ? map['title'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuDataModel.fromJson(String source) =>
      MenuDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'MenuDataModel(id: $id, shopID: $shopID, title: $title)';

  @override
  bool operator ==(covariant MenuDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.shopID == shopID && other.title == title;
  }

  @override
  int get hashCode => id.hashCode ^ shopID.hashCode ^ title.hashCode;
}

class ItemsDataModel {
  final String? cID;
  final String? name;
  final String? description;
  final String? shopId;
  final String? shopSpecificID;
  final String? status;
  final String? categoryStatus;
  final String? parentId;
  final String? defaultFlag;
  final String? sortOrder;
  final String? image;
  final CountDataModel productsCount;
  final List<ChildrensDataModel> childrens;
  ItemsDataModel({
    this.cID,
    this.name,
    this.description,
    this.shopId,
    this.shopSpecificID,
    this.status,
    this.categoryStatus,
    this.parentId,
    this.defaultFlag,
    this.sortOrder,
    this.image,
    required this.productsCount,
    this.childrens = const [],
  });

  ItemsDataModel copyWith({
    String? cID,
    String? name,
    String? description,
    String? shopId,
    String? shopSpecificID,
    String? status,
    String? categoryStatus,
    String? parentId,
    String? defaultFlag,
    String? sortOrder,
    String? image,
    CountDataModel? productsCount,
    List<ChildrensDataModel>? childrens,
  }) {
    return ItemsDataModel(
      cID: cID ?? this.cID,
      name: name ?? this.name,
      description: description ?? this.description,
      shopId: shopId ?? this.shopId,
      shopSpecificID: shopSpecificID ?? this.shopSpecificID,
      status: status ?? this.status,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      parentId: parentId ?? this.parentId,
      defaultFlag: defaultFlag ?? this.defaultFlag,
      sortOrder: sortOrder ?? this.sortOrder,
      image: image ?? this.image,
      productsCount: productsCount ?? this.productsCount,
      childrens: childrens ?? this.childrens,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cID': cID,
      'name': name,
      'description': description,
      'shopId': shopId,
      'shopSpecificID': shopSpecificID,
      'status': status,
      'categoryStatus': categoryStatus,
      'parentId': parentId,
      'defaultFlag': defaultFlag,
      'sortOrder': sortOrder,
      'image': image,
      'productsCount': productsCount.toMap(),
      'childrens': childrens.map((x) => x.toMap()).toList(),
    };
  }

  factory ItemsDataModel.fromMap(Map<String, dynamic> map) {
    return ItemsDataModel(
      cID: map['cID'] != null ? map['cID'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      shopId: map['shopId'] != null ? map['shopId'] as String : null,
      shopSpecificID: map['shopSpecificID'] != null
          ? map['shopSpecificID'] as String
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      categoryStatus: map['categoryStatus'] != null
          ? map['categoryStatus'] as String
          : null,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      defaultFlag: map['defaultFlag'] != null
          ? map['defaultFlag'] as String
          : null,
      sortOrder: map['sortOrder'] != null ? map['sortOrder'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      productsCount: CountDataModel.fromMap(
        map['productsCount'] as Map<String, dynamic>,
      ),
      childrens: map['childrens'] != null
          ? List<ChildrensDataModel>.from(
              (map['childrens'] as List<dynamic>).map<ChildrensDataModel>(
                (x) => ChildrensDataModel.fromMap(x as Map<String, dynamic>),
              ),
            )
          : [],
    );
  }

  String toJson() => json.encode(toMap());

  factory ItemsDataModel.fromJson(String source) =>
      ItemsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ItemsDataModel(cID: $cID, name: $name, description: $description, shopId: $shopId, shopSpecificID: $shopSpecificID, status: $status, categoryStatus: $categoryStatus, parentId: $parentId, defaultFlag: $defaultFlag, sortOrder: $sortOrder, image: $image, productsCount: $productsCount, childrens: $childrens)';
  }

  @override
  bool operator ==(covariant ItemsDataModel other) {
    if (identical(this, other)) return true;

    return other.cID == cID &&
        other.name == name &&
        other.description == description &&
        other.shopId == shopId &&
        other.shopSpecificID == shopSpecificID &&
        other.status == status &&
        other.categoryStatus == categoryStatus &&
        other.parentId == parentId &&
        other.defaultFlag == defaultFlag &&
        other.sortOrder == sortOrder &&
        other.image == image &&
        other.productsCount == productsCount &&
        listEquals(other.childrens, childrens);
  }

  @override
  int get hashCode {
    return cID.hashCode ^
        name.hashCode ^
        description.hashCode ^
        shopId.hashCode ^
        shopSpecificID.hashCode ^
        status.hashCode ^
        categoryStatus.hashCode ^
        parentId.hashCode ^
        defaultFlag.hashCode ^
        sortOrder.hashCode ^
        image.hashCode ^
        productsCount.hashCode ^
        childrens.hashCode;
  }
}

class CountDataModel {
  final int? online;
  final int? dininge;
  CountDataModel({this.online, this.dininge});

  CountDataModel copyWith({int? online, int? dininge}) {
    return CountDataModel(
      online: online ?? this.online,
      dininge: dininge ?? this.dininge,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'online': online, 'dininge': dininge};
  }

  factory CountDataModel.fromMap(Map<String, dynamic> map) {
    return CountDataModel(
      online: map['online'] != null ? map['online'] as int : null,
      dininge: map['dininge'] != null ? map['dininge'] as int : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CountDataModel.fromJson(String source) =>
      CountDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'CountDataModel(online: $online, dininge: $dininge)';

  @override
  bool operator ==(covariant CountDataModel other) {
    if (identical(this, other)) return true;

    return other.online == online && other.dininge == dininge;
  }

  @override
  int get hashCode => online.hashCode ^ dininge.hashCode;
}

class ChildrensDataModel {
  final String? cID;
  final String? name;
  final String? description;
  final String? shopId;
  final String? shopSpecificID;
  final String? status;
  final String? categoryStatus;
  final String? parentId;
  final String? defaultFlag;
  final String? sortOrder;
  final String? image;
  final CountDataModel productsCount;
  ChildrensDataModel({
    this.cID,
    this.name,
    this.description,
    this.shopId,
    this.shopSpecificID,
    this.status,
    this.categoryStatus,
    this.parentId,
    this.defaultFlag,
    this.sortOrder,
    this.image,
    required this.productsCount,
  });

  ChildrensDataModel copyWith({
    String? cID,
    String? name,
    String? description,
    String? shopId,
    String? shopSpecificID,
    String? status,
    String? categoryStatus,
    String? parentId,
    String? defaultFlag,
    String? sortOrder,
    String? image,
    CountDataModel? productsCount,
  }) {
    return ChildrensDataModel(
      cID: cID ?? this.cID,
      name: name ?? this.name,
      description: description ?? this.description,
      shopId: shopId ?? this.shopId,
      shopSpecificID: shopSpecificID ?? this.shopSpecificID,
      status: status ?? this.status,
      categoryStatus: categoryStatus ?? this.categoryStatus,
      parentId: parentId ?? this.parentId,
      defaultFlag: defaultFlag ?? this.defaultFlag,
      sortOrder: sortOrder ?? this.sortOrder,
      image: image ?? this.image,
      productsCount: productsCount ?? this.productsCount,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'cID': cID,
      'name': name,
      'description': description,
      'shopId': shopId,
      'shopSpecificID': shopSpecificID,
      'status': status,
      'categoryStatus': categoryStatus,
      'parentId': parentId,
      'defaultFlag': defaultFlag,
      'sortOrder': sortOrder,
      'image': image,
      'productsCount': productsCount.toMap(),
    };
  }

  factory ChildrensDataModel.fromMap(Map<String, dynamic> map) {
    return ChildrensDataModel(
      cID: map['cID'] != null ? map['cID'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      shopId: map['shopId'] != null ? map['shopId'] as String : null,
      shopSpecificID: map['shopSpecificID'] != null
          ? map['shopSpecificID'] as String
          : null,
      status: map['status'] != null ? map['status'] as String : null,
      categoryStatus: map['categoryStatus'] != null
          ? map['categoryStatus'] as String
          : null,
      parentId: map['parentId'] != null ? map['parentId'] as String : null,
      defaultFlag: map['defaultFlag'] != null
          ? map['defaultFlag'] as String
          : null,
      sortOrder: map['sortOrder'] != null ? map['sortOrder'] as String : null,
      image: map['image'] != null ? map['image'] as String : null,
      productsCount: CountDataModel.fromMap(
        map['productsCount'] as Map<String, dynamic>,
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory ChildrensDataModel.fromJson(String source) =>
      ChildrensDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'ChildrensDataModel(cID: $cID, name: $name, description: $description, shopId: $shopId, shopSpecificID: $shopSpecificID, status: $status, categoryStatus: $categoryStatus, parentId: $parentId, defaultFlag: $defaultFlag, sortOrder: $sortOrder, image: $image, productsCount: $productsCount)';
  }

  @override
  bool operator ==(covariant ChildrensDataModel other) {
    if (identical(this, other)) return true;

    return other.cID == cID &&
        other.name == name &&
        other.description == description &&
        other.shopId == shopId &&
        other.shopSpecificID == shopSpecificID &&
        other.status == status &&
        other.categoryStatus == categoryStatus &&
        other.parentId == parentId &&
        other.defaultFlag == defaultFlag &&
        other.sortOrder == sortOrder &&
        other.image == image &&
        other.productsCount == productsCount;
  }

  @override
  int get hashCode {
    return cID.hashCode ^
        name.hashCode ^
        description.hashCode ^
        shopId.hashCode ^
        shopSpecificID.hashCode ^
        status.hashCode ^
        categoryStatus.hashCode ^
        parentId.hashCode ^
        defaultFlag.hashCode ^
        sortOrder.hashCode ^
        image.hashCode ^
        productsCount.hashCode;
  }
}
