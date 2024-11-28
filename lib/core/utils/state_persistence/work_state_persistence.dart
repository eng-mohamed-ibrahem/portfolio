import 'package:flutter/material.dart';
import 'package:portfolio/model/work_model/work_model.dart';

class WorkStatePersistence extends RestorableProperty<WorkModel> {
  WorkStatePersistence(this._work);
  WorkModel _work;

  WorkModel get value => _work;

  @override
  WorkModel createDefaultValue() {
    return _work;
  }

  @override
  WorkModel fromPrimitives(Object? data) {
    return WorkModel.fromJson(data as Map<String, dynamic>);
  }

  @override
  void initWithValue(WorkModel value) {
    _work = value;
    notifyListeners();
  }

  @override
  Object? toPrimitives() {
    return _work.toJson();
  }
}
