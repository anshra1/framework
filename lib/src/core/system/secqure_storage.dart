import 'dart:async';

import 'package:baby_package/baby_package.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

abstract class AppStorage<T> {
  Future<void> init();
  Future<T?> read(String key);
  Future<void> write(String key, T value);
  Future<void> delete(String key);
  Future<void> clear();
  Future<bool> has(String key);
  Future<List<String>> getKeys();
  Future<void> reload();
  Future<void> dispose();
  Future<void> writeBatch(Map<String, T> values);
  Future<StorageType> getType(String key);
}

mixin StorageValidation<T> {
  bool isValidType() {
    return T == String || T == int || T == double || T == bool || T == List<String>;
  }

  StorageType getStorageType(T value) {
    if (value is String) return StorageType.string;
    if (value is int) return StorageType.integer;
    if (value is double) return StorageType.double;
    if (value is bool) return StorageType.boolean;
    if (value is List<String>) return StorageType.stringList;
    throw UnsupportedError('Type $T not supported');
  }
}

class SecureStorageWrapper<T> with StorageValidation<T> implements AppStorage<T> {
  SecureStorageWrapper({
    required FlutterSecureStorage storage,
    IOSOptions? iOSOptions,
    AndroidOptions? androidOptions,
  })  : _storage = storage,
        _iOSOptions = iOSOptions,
        _androidOptions = androidOptions;
  final FlutterSecureStorage _storage;
  final IOSOptions? _iOSOptions;
  final AndroidOptions? _androidOptions;

  @override
  Future<void> init() async {
    // Initialization logic if needed
    return Future.value();
  }

  @override
  Future<T?> read(String key) async {
    if (!isValidType()) {
      throw UnsupportedError('Type $T not supported');
    }
    final value =
        await _storage.read(key: key, iOptions: _iOSOptions, aOptions: _androidOptions);
    if (value == null) return null;
    return _convertFromJson(value);
  }

  @override
  Future<void> write(String key, T value) async {
    if (!isValidType()) {
      throw UnsupportedError('Type $T not supported');
    }
    final jsonValue = _convertToJson(value);
    await _storage.write(
      key: key,
      value: jsonValue,
      iOptions: _iOSOptions,
      aOptions: _androidOptions,
    );
  }

  @override
  Future<void> delete(String key) async {
    await _storage.delete(key: key, iOptions: _iOSOptions, aOptions: _androidOptions);
  }

  @override
  Future<void> clear() async {
    await _storage.deleteAll(iOptions: _iOSOptions, aOptions: _androidOptions);
  }

  @override
  Future<bool> has(String key) async {
    final value =
        await _storage.read(key: key, iOptions: _iOSOptions, aOptions: _androidOptions);
    return value != null;
  }

  @override
  Future<List<String>> getKeys() async {
    final all = await _storage.readAll(iOptions: _iOSOptions, aOptions: _androidOptions);
    return all.keys.toList();
  }

  @override
  Future<void> reload() async {
    // Reload logic if needed
    return Future.value();
  }

  @override
  Future<void> dispose() async {
    // Dispose logic if needed
    return Future.value();
  }

  @override
  Future<void> writeBatch(Map<String, T> values) async {
    for (final entry in values.entries) {
      await write(entry.key, entry.value);
    }
  }

  @override
  Future<StorageType> getType(String key) async {
    final value = await read(key);
    if (value == null) {
      throw ArgumentError('Key not found');
    }
    return getStorageType(value);
  }

  T _convertFromJson(String value) {
    if (T == String) return value as T;
    if (T == int) return int.parse(value) as T;
    if (T == double) return double.parse(value) as T;
    if (T == bool) return (value == 'true') as T;
    if (T == List<String>) return value.split(',') as T;
    throw UnsupportedError('Type $T not supported');
  }

  String _convertToJson(T value) {
    if (value is String) return value;
    if (value is int) return value.toString();
    if (value is double) return value.toString();
    if (value is bool) return value.toString();
    if (value is List<String>) return value.join(',');
    throw UnsupportedError('Type $T not supported');
  }
}
