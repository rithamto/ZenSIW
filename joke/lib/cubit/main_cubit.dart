// ignore_for_file: depend_on_referenced_packages

import 'dart:convert';

import 'package:bloc/bloc.dart';
import 'package:flutter/services.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:joke/global_constant.dart';
import 'package:joke/model/Joke.dart';

part 'main_state.dart';
part 'main_cubit.freezed.dart';

class MainCubit extends Cubit<MainState> {
  MainCubit() : super(const MainState.initial(data: MainStateData()));

  Future<int?> readCache() async {
    final cacheManager = DefaultCacheManager();
    final files = await cacheManager.getFileFromCache(GlobalConstants.Joke);
    if(files == null){
      return null;
    }else{
      final fileByte = files.file.readAsBytesSync();
    final fileUint8List = Uint8List.fromList(fileByte);
    final fileJson = utf8.decode(fileUint8List);
    final cache = int.parse(fileJson);
    return cache;
    }
  }

  Future<void> writeCache(int index) async {
    final str = index.toString();
    final convert = Uint8List.fromList(utf8.encode(str));
    final cacheManager = DefaultCacheManager();
    cacheManager.putFile(GlobalConstants.Joke, convert, maxAge: const Duration(days: 7));
  }

  void init() async {
    var x = await readCache();
    if(x == null){
      writeCache(0);
      emit(MainState.initial(data: state.data?.copyWith(index: 0)));
    }
    emit(MainState.initial(data: state.data?.copyWith(index: x!)));
  }

  void handle() async {
    var x = await readCache();
    if(x! < origin.lst!.length - 1){
      writeCache(x + 1);
      emit(MainState.initial(data: state.data?.copyWith(index: x + 1)));
    }else{
      writeCache(x);
      emit(MainState.initial(data: state.data?.copyWith(index: x)));
    }
  }
}
