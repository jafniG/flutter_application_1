import 'dart:convert';

import 'package:flutter/foundation.dart';

// ignore_for_file: public_member_api_docs, sort_constructors_first

class ProductsDataModel {
  final bool? error;
  final SubProductDataModel data;
  ProductsDataModel({this.error, required this.data});

  ProductsDataModel copyWith({bool? error, SubProductDataModel? data}) {
    return ProductsDataModel(
      error: error ?? this.error,
      data: data ?? this.data,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'error': error, 'data': data.toMap()};
  }

  factory ProductsDataModel.fromMap(Map<String, dynamic> map) {
    return ProductsDataModel(
      error: map['error'] != null ? map['error'] as bool : null,
      data: SubProductDataModel.fromMap(map['data'] as Map<String, dynamic>),
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductsDataModel.fromJson(String source) =>
      ProductsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'ProductsDataModel(error: $error, data: $data)';

  @override
  bool operator ==(covariant ProductsDataModel other) {
    if (identical(this, other)) return true;

    return other.error == error && other.data == data;
  }

  @override
  int get hashCode => error.hashCode ^ data.hashCode;
}

class SubProductDataModel {
  final List<ProductItemsDataModel> items;
  final String? note;
  final String? activeMenu;
  final int? activeShopMenuID;
  SubProductDataModel({
    required this.items,
    this.note,
    this.activeMenu,
    this.activeShopMenuID,
  });

  SubProductDataModel copyWith({
    List<ProductItemsDataModel>? items,
    String? note,
    String? activeMenu,
    int? activeShopMenuID,
  }) {
    return SubProductDataModel(
      items: items ?? this.items,
      note: note ?? this.note,
      activeMenu: activeMenu ?? this.activeMenu,
      activeShopMenuID: activeShopMenuID ?? this.activeShopMenuID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'items': items.map((x) => x.toMap()).toList(),
      'note': note,
      'activeMenu': activeMenu,
      'activeShopMenuID': activeShopMenuID,
    };
  }

  factory SubProductDataModel.fromMap(Map<String, dynamic> map) {
    return SubProductDataModel(
      items: List<ProductItemsDataModel>.from(
        (map['items'] as List<dynamic>).map<ProductItemsDataModel>(
          (x) => ProductItemsDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      note: map['note'] != null ? map['note'] as String : null,
      activeMenu: map['activeMenu'] != null
          ? map['activeMenu'] as String
          : null,
      activeShopMenuID: map['activeShopMenuID'] != null
          ? map['activeShopMenuID'] as int
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory SubProductDataModel.fromJson(String source) =>
      SubProductDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'SubProductDataModel(items: $items, note: $note, activeMenu: $activeMenu, activeShopMenuID: $activeShopMenuID)';
  }

  @override
  bool operator ==(covariant SubProductDataModel other) {
    if (identical(this, other)) return true;

    return listEquals(other.items, items) &&
        other.note == note &&
        other.activeMenu == activeMenu &&
        other.activeShopMenuID == activeShopMenuID;
  }

  @override
  int get hashCode {
    return items.hashCode ^
        note.hashCode ^
        activeMenu.hashCode ^
        activeShopMenuID.hashCode;
  }
}

class ProductItemsDataModel {
  final String? pId;
  final bool? isAvailable;
  final bool? isAvailableForPreorder;
  final String? productType;
  final String? name;
  final String? type;
  final String? photo;
  final String? description;
  final bool? availability;
  final String? online;
  final String? dining;
  final String? activeStatus;
  final String? price;
  final String? priceValue;
  final bool? isMeal;
  final List<VariationsDataModel> variations;
  final bool? hasMultipleVariation;
  final List<AddonsDataModel> addons;
  final bool? hasAddons;
  final bool? hasMasterAddons;
  final List<MasterAddonsDataModel> masterAddons;
  final List<MenuListDataModel> menuList;
  final List<CategoriesListDataModel> categoriesList;
  final List<AvailableTimingDataModel> availableTiming;
  final List<String>? m_list;
  ProductItemsDataModel({
    this.pId,
    this.isAvailable,
    this.isAvailableForPreorder,
    this.productType,
    this.name,
    this.type,
    this.photo,
    this.description,
    this.availability,
    this.online,
    this.dining,
    this.activeStatus,
    this.price,
    this.priceValue,
    this.isMeal,
    required this.variations,
    this.hasMultipleVariation,
    required this.addons,
    this.hasAddons,
    this.hasMasterAddons,
    required this.masterAddons,
    required this.menuList,
    required this.categoriesList,
    required this.availableTiming,
    this.m_list,
  });

  ProductItemsDataModel copyWith({
    String? pId,
    bool? isAvailable,
    bool? isAvailableForPreorder,
    String? productType,
    String? name,
    String? type,
    String? photo,
    String? description,
    bool? availability,
    String? online,
    String? dining,
    String? activeStatus,
    String? price,
    String? priceValue,
    bool? isMeal,
    List<VariationsDataModel>? variations,
    bool? hasMultipleVariation,
    List<AddonsDataModel>? addons,
    bool? hasAddons,
    bool? hasMasterAddons,
    List<MasterAddonsDataModel>? masterAddons,
    List<MenuListDataModel>? menuList,
    List<CategoriesListDataModel>? categoriesList,
    List<AvailableTimingDataModel>? availableTiming,
    List<String>? m_list,
  }) {
    return ProductItemsDataModel(
      pId: pId ?? this.pId,
      isAvailable: isAvailable ?? this.isAvailable,
      isAvailableForPreorder:
          isAvailableForPreorder ?? this.isAvailableForPreorder,
      productType: productType ?? this.productType,
      name: name ?? this.name,
      type: type ?? this.type,
      photo: photo ?? this.photo,
      description: description ?? this.description,
      availability: availability ?? this.availability,
      online: online ?? this.online,
      dining: dining ?? this.dining,
      activeStatus: activeStatus ?? this.activeStatus,
      price: price ?? this.price,
      priceValue: priceValue ?? this.priceValue,
      isMeal: isMeal ?? this.isMeal,
      variations: variations ?? this.variations,
      hasMultipleVariation: hasMultipleVariation ?? this.hasMultipleVariation,
      addons: addons ?? this.addons,
      hasAddons: hasAddons ?? this.hasAddons,
      hasMasterAddons: hasMasterAddons ?? this.hasMasterAddons,
      masterAddons: masterAddons ?? this.masterAddons,
      menuList: menuList ?? this.menuList,
      categoriesList: categoriesList ?? this.categoriesList,
      availableTiming: availableTiming ?? this.availableTiming,
      m_list: m_list ?? this.m_list,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pId': pId,
      'isAvailable': isAvailable,
      // 'isAvailableForPreorder': isAvailableForPreorder,
      'productType': productType,
      'name': name,
      'type': type,
      'photo': photo,
      'description': description,
      'availability': availability,
      'online': online,
      'dining': dining,
      'activeStatus': activeStatus,
      'price': price,
      'priceValue': priceValue,
      'isMeal': isMeal,
      'variations': variations.map((x) => x.toMap()).toList(),
      'hasMultipleVariation': hasMultipleVariation,
      'addons': addons.map((x) => x.toMap()).toList(),
      'hasAddons': hasAddons,
      'hasMasterAddons': hasMasterAddons,
      'masterAddons': masterAddons.map((x) => x.toMap()).toList(),
      'menuList': menuList.map((x) => x.toMap()).toList(),
      'categoriesList': categoriesList.map((x) => x.toMap()).toList(),
      'availableTiming': availableTiming.map((x) => x.toMap()).toList(),
      'm_list': m_list,
    };
  }

  factory ProductItemsDataModel.fromMap(Map<String, dynamic> map) {
    return ProductItemsDataModel(
      pId: map['pId'] != null ? map['pId'] as String : null,
      isAvailable: map['isAvailable'] != null
          ? map['isAvailable'] as bool
          : null,
      // isAvailableForPreorder: map['isAvailableForPreorder'] != null
      //     ? map['isAvailableForPreorder'] as bool
      //     : null,
      productType: map['productType'] != null
          ? map['productType'] as String
          : null,
      name: map['name'] != null ? map['name'] as String : null,
      type: map['type'] != null ? map['type'] as String : null,
      photo: map['photo'] != null ? map['photo'] as String : null,
      description: map['description'] != null
          ? map['description'] as String
          : null,
      availability: map['availability'] != null
          ? map['availability'] as bool
          : null,
      online: map['online'] != null ? map['online'] as String : null,
      dining: map['dining'] != null ? map['dining'] as String : null,
      activeStatus: map['activeStatus'] != null
          ? map['activeStatus'] as String
          : null,
      price: map['price'] != null ? map['price'] as String : null,
      priceValue: map['priceValue'] != null
          ? map['priceValue'] as String
          : null,
      isMeal: map['isMeal'] != null ? map['isMeal'] as bool : null,
      variations: List<VariationsDataModel>.from(
        (map['variations'] as List<dynamic>).map<VariationsDataModel>(
          (x) => VariationsDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      hasMultipleVariation: map['hasMultipleVariation'] != null
          ? map['hasMultipleVariation'] as bool
          : null,
      addons: List<AddonsDataModel>.from(
        (map['addons'] as List<dynamic>).map<AddonsDataModel>(
          (x) => AddonsDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      hasAddons: map['hasAddons'] != null ? map['hasAddons'] as bool : null,
      hasMasterAddons: map['hasMasterAddons'] != null
          ? map['hasMasterAddons'] as bool
          : null,
      masterAddons: List<MasterAddonsDataModel>.from(
        (map['masterAddons'] as List<dynamic>).map<MasterAddonsDataModel>(
          (x) => MasterAddonsDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      menuList: List<MenuListDataModel>.from(
        (map['menuList'] as List<dynamic>).map<MenuListDataModel>(
          (x) => MenuListDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      categoriesList: List<CategoriesListDataModel>.from(
        (map['categoriesList'] as List<dynamic>).map<CategoriesListDataModel>(
          (x) => CategoriesListDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      availableTiming: List<AvailableTimingDataModel>.from(
        (map['availableTiming'] as List<dynamic>).map<AvailableTimingDataModel>(
          (x) => AvailableTimingDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      m_list: map['m_list'] != null
          ? List<String>.from((map['m_list'] as List<String>))
          : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory ProductItemsDataModel.fromJson(String source) =>
      ProductItemsDataModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'ProductItemsDataModel(pId: $pId, isAvailable: $isAvailable, isAvailableForPreorder: $isAvailableForPreorder, productType: $productType, name: $name, type: $type, photo: $photo, description: $description, availability: $availability, online: $online, dining: $dining, activeStatus: $activeStatus, price: $price, priceValue: $priceValue, isMeal: $isMeal, variations: $variations, hasMultipleVariation: $hasMultipleVariation, addons: $addons, hasAddons: $hasAddons, hasMasterAddons: $hasMasterAddons, masterAddons: $masterAddons, menuList: $menuList, categoriesList: $categoriesList, availableTiming: $availableTiming, m_list: $m_list)';
  }

  @override
  bool operator ==(covariant ProductItemsDataModel other) {
    if (identical(this, other)) return true;

    return other.pId == pId &&
        other.isAvailable == isAvailable &&
        other.isAvailableForPreorder == isAvailableForPreorder &&
        other.productType == productType &&
        other.name == name &&
        other.type == type &&
        other.photo == photo &&
        other.description == description &&
        other.availability == availability &&
        other.online == online &&
        other.dining == dining &&
        other.activeStatus == activeStatus &&
        other.price == price &&
        other.priceValue == priceValue &&
        other.isMeal == isMeal &&
        listEquals(other.variations, variations) &&
        other.hasMultipleVariation == hasMultipleVariation &&
        listEquals(other.addons, addons) &&
        other.hasAddons == hasAddons &&
        other.hasMasterAddons == hasMasterAddons &&
        listEquals(other.masterAddons, masterAddons) &&
        listEquals(other.menuList, menuList) &&
        listEquals(other.categoriesList, categoriesList) &&
        listEquals(other.availableTiming, availableTiming) &&
        listEquals(other.m_list, m_list);
  }

  @override
  int get hashCode {
    return pId.hashCode ^
        isAvailable.hashCode ^
        isAvailableForPreorder.hashCode ^
        productType.hashCode ^
        name.hashCode ^
        type.hashCode ^
        photo.hashCode ^
        description.hashCode ^
        availability.hashCode ^
        online.hashCode ^
        dining.hashCode ^
        activeStatus.hashCode ^
        price.hashCode ^
        priceValue.hashCode ^
        isMeal.hashCode ^
        variations.hashCode ^
        hasMultipleVariation.hashCode ^
        addons.hashCode ^
        hasAddons.hashCode ^
        hasMasterAddons.hashCode ^
        masterAddons.hashCode ^
        menuList.hashCode ^
        categoriesList.hashCode ^
        availableTiming.hashCode ^
        m_list.hashCode;
  }
}

class VariationsDataModel {
  final String? pvId;
  final String? name;
  final String? price;
  final String? displayPrice;
  final String? ingredients;
  final String? isUnlimitedStock;
  final String? stock;
  final List<AllergensDataModel> allergens;
  final List<String>? selectedAllergens;
  final List<AllergensDataModel> allergensMaster;
  VariationsDataModel({
    this.pvId,
    this.name,
    this.price,
    this.displayPrice,
    this.ingredients,
    this.isUnlimitedStock,
    this.stock,
    required this.allergens,
    this.selectedAllergens,
    required this.allergensMaster,
  });

  VariationsDataModel copyWith({
    String? pvId,
    String? name,
    String? price,
    String? displayPrice,
    String? ingredients,
    String? isUnlimitedStock,
    String? stock,
    List<AllergensDataModel>? allergens,
    List<String>? selectedAllergens,
    List<AllergensDataModel>? allergensMaster,
  }) {
    return VariationsDataModel(
      pvId: pvId ?? this.pvId,
      name: name ?? this.name,
      price: price ?? this.price,
      displayPrice: displayPrice ?? this.displayPrice,
      ingredients: ingredients ?? this.ingredients,
      isUnlimitedStock: isUnlimitedStock ?? this.isUnlimitedStock,
      stock: stock ?? this.stock,
      allergens: allergens ?? this.allergens,
      selectedAllergens: selectedAllergens ?? this.selectedAllergens,
      allergensMaster: allergensMaster ?? this.allergensMaster,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'pvId': pvId,
      'name': name,
      'price': price,
      'displayPrice': displayPrice,
      'ingredients': ingredients,
      'isUnlimitedStock': isUnlimitedStock,
      'stock': stock,
      'allergens': allergens.map((x) => x.toMap()).toList(),
      'selectedAllergens': selectedAllergens,
      'allergensMaster': allergensMaster.map((x) => x.toMap()).toList(),
    };
  }

  factory VariationsDataModel.fromMap(Map<String, dynamic> map) {
    return VariationsDataModel(
      pvId: map['pvId'] != null ? map['pvId'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      displayPrice: map['displayPrice'] != null
          ? map['displayPrice'] as String
          : null,
      ingredients: map['ingredients'] != null
          ? map['ingredients'] as String
          : null,
      isUnlimitedStock: map['isUnlimitedStock'] != null
          ? map['isUnlimitedStock'] as String
          : null,
      stock: map['stock'] != null ? map['stock'] as String : null,
      allergens: List<AllergensDataModel>.from(
        (map['allergens'] as List<dynamic>).map<AllergensDataModel>(
          (x) => AllergensDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
      selectedAllergens: map['selectedAllergens'] != null
          ? List<String>.from((map['selectedAllergens'] as List<String>))
          : null,
      allergensMaster: List<AllergensDataModel>.from(
        (map['allergensMaster'] as List<dynamic>).map<AllergensDataModel>(
          (x) => AllergensDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory VariationsDataModel.fromJson(String source) =>
      VariationsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'VariationsDataModel(pvId: $pvId, name: $name, price: $price, displayPrice: $displayPrice, ingredients: $ingredients, isUnlimitedStock: $isUnlimitedStock, stock: $stock, allergens: $allergens, selectedAllergens: $selectedAllergens, allergensMaster: $allergensMaster)';
  }

  @override
  bool operator ==(covariant VariationsDataModel other) {
    if (identical(this, other)) return true;

    return other.pvId == pvId &&
        other.name == name &&
        other.price == price &&
        other.displayPrice == displayPrice &&
        other.ingredients == ingredients &&
        other.isUnlimitedStock == isUnlimitedStock &&
        other.stock == stock &&
        listEquals(other.allergens, allergens) &&
        listEquals(other.selectedAllergens, selectedAllergens) &&
        listEquals(other.allergensMaster, allergensMaster);
  }

  @override
  int get hashCode {
    return pvId.hashCode ^
        name.hashCode ^
        price.hashCode ^
        displayPrice.hashCode ^
        ingredients.hashCode ^
        isUnlimitedStock.hashCode ^
        stock.hashCode ^
        allergens.hashCode ^
        selectedAllergens.hashCode ^
        allergensMaster.hashCode;
  }
}

class AllergensDataModel {
  final String? id;
  final String? name;
  AllergensDataModel({this.id, this.name});

  AllergensDataModel copyWith({String? id, String? name}) {
    return AllergensDataModel(id: id ?? this.id, name: name ?? this.name);
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'id': id, 'name': name};
  }

  factory AllergensDataModel.fromMap(Map<String, dynamic> map) {
    return AllergensDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AllergensDataModel.fromJson(String source) =>
      AllergensDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() => 'AllergensDataModel(id: $id, name: $name)';

  @override
  bool operator ==(covariant AllergensDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id && other.name == name;
  }

  @override
  int get hashCode => id.hashCode ^ name.hashCode;
}

class AddonsDataModel {
  final String? name;
  final String? id;
  final List<OptionsDataModel> options;
  AddonsDataModel({this.name, this.id, required this.options});

  AddonsDataModel copyWith({
    String? name,
    String? id,
    List<OptionsDataModel>? options,
  }) {
    return AddonsDataModel(
      name: name ?? this.name,
      id: id ?? this.id,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'name': name,
      'id': id,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory AddonsDataModel.fromMap(Map<String, dynamic> map) {
    return AddonsDataModel(
      name: map['name'] != null ? map['name'] as String : null,
      id: map['id'] != null ? map['id'] as String : null,
      options: List<OptionsDataModel>.from(
        (map['options'] as List<dynamic>).map<OptionsDataModel>(
          (x) => OptionsDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory AddonsDataModel.fromJson(String source) =>
      AddonsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'AddonsDataModel(name: $name, id: $id, options: $options)';

  @override
  bool operator ==(covariant AddonsDataModel other) {
    if (identical(this, other)) return true;

    return other.name == name &&
        other.id == id &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode => name.hashCode ^ id.hashCode ^ options.hashCode;
}

class OptionsDataModel {
  final String? text;
  final String? price;
  final String? price_formatted;
  final String? value;
  final bool? checked;
  OptionsDataModel({
    this.text,
    this.price,
    this.price_formatted,
    this.value,
    this.checked,
  });

  OptionsDataModel copyWith({
    String? text,
    String? price,
    String? price_formatted,
    String? value,
    bool? checked,
  }) {
    return OptionsDataModel(
      text: text ?? this.text,
      price: price ?? this.price,
      price_formatted: price_formatted ?? this.price_formatted,
      value: value ?? this.value,
      checked: checked ?? this.checked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'price': price,
      'price_formatted': price_formatted,
      'value': value,
      'checked': checked,
    };
  }

  factory OptionsDataModel.fromMap(Map<String, dynamic> map) {
    return OptionsDataModel(
      text: map['text'] != null ? map['text'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      price_formatted: map['price_formatted'] != null
          ? map['price_formatted'] as String
          : null,
      value: map['value'] != null ? map['value'] as String : null,
      checked: map['checked'] != null ? map['checked'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory OptionsDataModel.fromJson(String source) =>
      OptionsDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() {
    return 'OptionsDataModel(text: $text, price: $price, price_formatted: $price_formatted, value: $value, checked: $checked)';
  }

  @override
  bool operator ==(covariant OptionsDataModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.price == price &&
        other.price_formatted == price_formatted &&
        other.value == value &&
        other.checked == checked;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        price.hashCode ^
        price_formatted.hashCode ^
        value.hashCode ^
        checked.hashCode;
  }
}

class CategoriesListDataModel {
  final String? cID;
  final String? cName;
  CategoriesListDataModel({this.cID, this.cName});

  CategoriesListDataModel copyWith({String? cID, String? cName}) {
    return CategoriesListDataModel(
      cID: cID ?? this.cID,
      cName: cName ?? this.cName,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{'cID': cID, 'cName': cName};
  }

  factory CategoriesListDataModel.fromMap(Map<String, dynamic> map) {
    return CategoriesListDataModel(
      cID: map['cID'] != null ? map['cID'] as String : null,
      cName: map['cName'] != null ? map['cName'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory CategoriesListDataModel.fromJson(String source) =>
      CategoriesListDataModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() => 'CategoriesListDataModel(cID: $cID, cName: $cName)';

  @override
  bool operator ==(covariant CategoriesListDataModel other) {
    if (identical(this, other)) return true;

    return other.cID == cID && other.cName == cName;
  }

  @override
  int get hashCode => cID.hashCode ^ cName.hashCode;
}

class AvailableTimingDataModel {
  final String? timeId;
  final String? startTime;
  final String? endTime;
  AvailableTimingDataModel({this.timeId, this.startTime, this.endTime});

  AvailableTimingDataModel copyWith({
    String? timeId,
    String? startTime,
    String? endTime,
  }) {
    return AvailableTimingDataModel(
      timeId: timeId ?? this.timeId,
      startTime: startTime ?? this.startTime,
      endTime: endTime ?? this.endTime,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'timeId': timeId,
      'startTime': startTime,
      'endTime': endTime,
    };
  }

  factory AvailableTimingDataModel.fromMap(Map<String, dynamic> map) {
    return AvailableTimingDataModel(
      timeId: map['timeId'] != null ? map['timeId'] as String : null,
      startTime: map['startTime'] != null ? map['startTime'] as String : null,
      endTime: map['endTime'] != null ? map['endTime'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory AvailableTimingDataModel.fromJson(String source) =>
      AvailableTimingDataModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() =>
      'AvailableTimingDataModel(timeId: $timeId, startTime: $startTime, endTime: $endTime)';

  @override
  bool operator ==(covariant AvailableTimingDataModel other) {
    if (identical(this, other)) return true;

    return other.timeId == timeId &&
        other.startTime == startTime &&
        other.endTime == endTime;
  }

  @override
  int get hashCode => timeId.hashCode ^ startTime.hashCode ^ endTime.hashCode;
}

class MasterAddonsDataModel {
  final String? id;
  final String? name;
  final String? minimumRequired;
  final String? maximumRequired;
  final List<MasterAddonsOptionsDataModel> options;
  MasterAddonsDataModel({
    this.id,
    this.name,
    this.minimumRequired,
    this.maximumRequired,
    required this.options,
  });

  MasterAddonsDataModel copyWith({
    String? id,
    String? name,
    String? minimumRequired,
    String? maximumRequired,
    List<MasterAddonsOptionsDataModel>? options,
  }) {
    return MasterAddonsDataModel(
      id: id ?? this.id,
      name: name ?? this.name,
      minimumRequired: minimumRequired ?? this.minimumRequired,
      maximumRequired: maximumRequired ?? this.maximumRequired,
      options: options ?? this.options,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'name': name,
      'minimumRequired': minimumRequired,
      'maximumRequired': maximumRequired,
      'options': options.map((x) => x.toMap()).toList(),
    };
  }

  factory MasterAddonsDataModel.fromMap(Map<String, dynamic> map) {
    return MasterAddonsDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      name: map['name'] != null ? map['name'] as String : null,
      minimumRequired: map['minimumRequired'] != null
          ? map['minimumRequired'] as String
          : null,
      maximumRequired: map['maximumRequired'] != null
          ? map['maximumRequired'] as String
          : null,
      options: List<MasterAddonsOptionsDataModel>.from(
        (map['options'] as List<dynamic>).map<MasterAddonsOptionsDataModel>(
          (x) =>
              MasterAddonsOptionsDataModel.fromMap(x as Map<String, dynamic>),
        ),
      ),
    );
  }

  String toJson() => json.encode(toMap());

  factory MasterAddonsDataModel.fromJson(String source) =>
      MasterAddonsDataModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'MasterAddonsDataModel(id: $id, name: $name, minimumRequired: $minimumRequired, maximumRequired: $maximumRequired, options: $options)';
  }

  @override
  bool operator ==(covariant MasterAddonsDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.name == name &&
        other.minimumRequired == minimumRequired &&
        other.maximumRequired == maximumRequired &&
        listEquals(other.options, options);
  }

  @override
  int get hashCode {
    return id.hashCode ^
        name.hashCode ^
        minimumRequired.hashCode ^
        maximumRequired.hashCode ^
        options.hashCode;
  }
}

class MasterAddonsOptionsDataModel {
  final String? text;
  final String? price;
  final String? price_formatted;
  final String? itemId;
  final bool? checked;
  MasterAddonsOptionsDataModel({
    this.text,
    this.price,
    this.price_formatted,
    this.itemId,
    this.checked,
  });

  MasterAddonsOptionsDataModel copyWith({
    String? text,
    String? price,
    String? price_formatted,
    String? itemId,
    bool? checked,
  }) {
    return MasterAddonsOptionsDataModel(
      text: text ?? this.text,
      price: price ?? this.price,
      price_formatted: price_formatted ?? this.price_formatted,
      itemId: itemId ?? this.itemId,
      checked: checked ?? this.checked,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'text': text,
      'price': price,
      'price_formatted': price_formatted,
      'itemId': itemId,
      'checked': checked,
    };
  }

  factory MasterAddonsOptionsDataModel.fromMap(Map<String, dynamic> map) {
    return MasterAddonsOptionsDataModel(
      text: map['text'] != null ? map['text'] as String : null,
      price: map['price'] != null ? map['price'] as String : null,
      price_formatted: map['price_formatted'] != null
          ? map['price_formatted'] as String
          : null,
      itemId: map['itemId'] != null ? map['itemId'] as String : null,
      checked: map['checked'] != null ? map['checked'] as bool : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MasterAddonsOptionsDataModel.fromJson(String source) =>
      MasterAddonsOptionsDataModel.fromMap(
        json.decode(source) as Map<String, dynamic>,
      );

  @override
  String toString() {
    return 'MasterAddonsOptionsDataModel(text: $text, price: $price, price_formatted: $price_formatted, itemId: $itemId, checked: $checked)';
  }

  @override
  bool operator ==(covariant MasterAddonsOptionsDataModel other) {
    if (identical(this, other)) return true;

    return other.text == text &&
        other.price == price &&
        other.price_formatted == price_formatted &&
        other.itemId == itemId &&
        other.checked == checked;
  }

  @override
  int get hashCode {
    return text.hashCode ^
        price.hashCode ^
        price_formatted.hashCode ^
        itemId.hashCode ^
        checked.hashCode;
  }
}

class MenuListDataModel {
  final String? id;
  final String? menuID;
  final String? productID;
  MenuListDataModel({this.id, this.menuID, this.productID});

  MenuListDataModel copyWith({String? id, String? menuID, String? productID}) {
    return MenuListDataModel(
      id: id ?? this.id,
      menuID: menuID ?? this.menuID,
      productID: productID ?? this.productID,
    );
  }

  Map<String, dynamic> toMap() {
    return <String, dynamic>{
      'id': id,
      'menuID': menuID,
      'productID': productID,
    };
  }

  factory MenuListDataModel.fromMap(Map<String, dynamic> map) {
    return MenuListDataModel(
      id: map['id'] != null ? map['id'] as String : null,
      menuID: map['menuID'] != null ? map['menuID'] as String : null,
      productID: map['productID'] != null ? map['productID'] as String : null,
    );
  }

  String toJson() => json.encode(toMap());

  factory MenuListDataModel.fromJson(String source) =>
      MenuListDataModel.fromMap(json.decode(source) as Map<String, dynamic>);

  @override
  String toString() =>
      'MenuListDataModel(id: $id, menuID: $menuID, productID: $productID)';

  @override
  bool operator ==(covariant MenuListDataModel other) {
    if (identical(this, other)) return true;

    return other.id == id &&
        other.menuID == menuID &&
        other.productID == productID;
  }

  @override
  int get hashCode => id.hashCode ^ menuID.hashCode ^ productID.hashCode;
}
