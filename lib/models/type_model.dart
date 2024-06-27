import 'package:image_picker/image_picker.dart';

class DropdownModel {
  int? id;
  String? name;

  DropdownModel({this.id, this.name});

  DropdownModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['name'] = name;
    return data;
  }
}



class BankResult {
  int? id;
  String? name;
  String? bankCategoryName;

  BankResult({this.id, this.name, this.bankCategoryName});

  BankResult.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    bankCategoryName = json['bankCategoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['type'] = name;
    data['bankCategoryName'] = bankCategoryName;
    return data;
  }
}


class CategoryTypeModel {
  int? id;
  int? productType;
  String? categoryName;

  CategoryTypeModel({this.id, this.productType, this.categoryName});

  CategoryTypeModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['productType'];
    categoryName = json['categoryName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productType'] = productType;
    data['categoryName'] = categoryName;
    return data;
  }
}
class UnitMeasure {
  int? id;
  int? productType;
  String? uom;
  String? abbreviation;

  UnitMeasure({this.id, this.productType, this.uom, this.abbreviation});

  UnitMeasure.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    productType = json['productType'];
    uom = json['uom'];
    abbreviation = json['abbreviation'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['productType'] = productType;
    data['uom'] = uom;
    data['abbreviation'] = abbreviation;
    return data;
  }
}

class Percentage {
  int? id;
  String? value;

  Percentage({this.id, this.value});

  Percentage.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    value = json['value'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['id'] = id;
    data['value'] = value;
    return data;
  }
}

class ProductData {
  String? productName;
  String? category;
  String? measurement;
  double? budgetAmount;
  List<XFile>? imageFileList;

  ProductData(
      {this.productName,
      this.category,
      this.imageFileList,
      this.budgetAmount,
      this.measurement});
}

class MyContact {
  String? contactName;
  String? phoneNumber;
  String? contactImage;

  MyContact({this.contactName, this.phoneNumber, this.contactImage});

  MyContact.fromJson(Map<String, dynamic> json) {
    contactName = json['contactName'];
    phoneNumber = json['phoneNumber'];
    contactImage = json['contactImage'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['contactName'] = contactName;
    data['phoneNumber'] = phoneNumber;
    data['contactImage'] = contactImage;
    return data;
  }
}

class ShiftPatternModel {
  String? name;
  String? uuid;
  String? createdAt;
  int? totalShiftDay;
  String? description;

  ShiftPatternModel(
      {this.name,
        this.uuid,
        this.createdAt,
        this.totalShiftDay,
        this.description});

  ShiftPatternModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uuid = json['uuid'];
    createdAt = json['created_at'];
    totalShiftDay = json['total_shift_day'];
    description = json['description'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uuid'] = uuid;
    data['created_at'] = createdAt;
    data['total_shift_day'] = totalShiftDay;
    data['description'] = description;
    return data;
  }
}
class ShiftSlotModel {
  String? name;
  String? startTime;
  String? endTime;
  String? uuid;
  String? shiftDayNo;
  String? color;
  bool? isOff;
  String? createdAt;

  ShiftSlotModel(
      {this.name,
        this.startTime,
        this.endTime,
        this.uuid,
        this.shiftDayNo,
        this.color,
        this.isOff,
        this.createdAt});

  ShiftSlotModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    uuid = json['uuid'];
    shiftDayNo = json['shiftDayNo'];
    color = json['color'];
    isOff = json['is_off'];
    createdAt = json['created_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['slot_id'] = uuid;
    data['shift_day_no'] = shiftDayNo;
    data['color'] = color;
    data['is_off'] = isOff;
    data['created_at'] = createdAt;
    return data;
  }
}



class CreateShiftPatternModel {
  String? name;
  List<Slots>? slots;
  int? userId;

  CreateShiftPatternModel({this.name, this.slots, this.userId});

  CreateShiftPatternModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['slots'] != null) {
      slots = <Slots>[];
      json['slots'].forEach((v) {
        slots!.add(Slots.fromJson(v));
      });
    }
    userId = json['user_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    if (slots != null) {
      data['slots'] = slots!.map((v) => v.toJson()).toList();
    }
    data['user_id'] = userId;
    return data;
  }
}

class Slots {
  int? shiftDayNo;
  String? slotId;

  Slots({this.shiftDayNo, this.slotId});

  Slots.fromJson(Map<String, dynamic> json) {
    shiftDayNo = json['shift_day_no'];
    slotId = json['slot_id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shift_day_no'] = shiftDayNo;
    data['slot_id'] = slotId;
    return data;
  }
}


class CreateShiftSlotModel {
  String? name;
  String? color;
  String? startTime;
  String? endTime;
  int? userId;
  bool? isOff;
  String? uuid;
  String? updatedAt;
  String? createdAt;
  int? id;

  CreateShiftSlotModel(
      {this.name,
        this.color,
        this.startTime,
        this.endTime,
        this.userId,
        this.isOff,
        this.uuid,
        this.updatedAt,
        this.createdAt,
        this.id});

  CreateShiftSlotModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    color = json['color'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    userId = json['user_id'];
    isOff = json['is_off'];
    uuid = json['uuid'];
    updatedAt = json['updated_at'];
    createdAt = json['created_at'];
    id = json['id'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['color'] = color;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['user_id'] = userId;
    data['is_off'] = isOff;
    data['uuid'] = uuid;
    data['updated_at'] = updatedAt;
    data['created_at'] = createdAt;
    data['id'] = id;
    return data;
  }
}


class RecordShiftScheduleModel {
  String? shiftSlot;
  String? shiftDate;
  String? description;
  String? startTime;
  String? endTime;
  String? startBreakTime;
  String? endBreakTime;

  RecordShiftScheduleModel(
      {this.shiftSlot,
        this.shiftDate,
        this.description,
        this.startTime,
        this.endTime,
        this.startBreakTime,
        this.endBreakTime});

  RecordShiftScheduleModel.fromJson(Map<String, dynamic> json) {
    shiftSlot = json['shift_slot'];
    shiftDate = json['shift_date'];
    description = json['description'];
    startTime = json['start_time'];
    endTime = json['end_time'];
    startBreakTime = json['start_break_time'];
    endBreakTime = json['end_break_time'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['shift_slot'] = shiftSlot;
    data['shift_date'] = shiftDate;
    data['description'] = description;
    data['start_time'] = startTime;
    data['end_time'] = endTime;
    data['start_break_time'] = startBreakTime;
    data['end_break_time'] = endBreakTime;
    return data;
  }
}



class ShiftSlotNameModel {
  String? name;
  String? uuid;

  ShiftSlotNameModel(
      {this.name,
        this.uuid});

  ShiftSlotNameModel.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    uuid = json['uuid'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = <String, dynamic>{};
    data['name'] = name;
    data['uuid'] = uuid;
    return data;
  }
}


class DeleteShiftModel {
  String? message;
  bool? isError;

  DeleteShiftModel({this.message, this.isError});

  DeleteShiftModel.fromJson(Map<String, dynamic> json) {
    message = json['message'];
    isError = json['isError'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['message'] = this.message;
    data['isError'] = this.isError;
    return data;
  }
}
