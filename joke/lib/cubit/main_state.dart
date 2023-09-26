part of 'main_cubit.dart';

@freezed
class MainStateData with _$MainStateData {
  const factory MainStateData({
      @Default(0) int index,
    }) = _MainStateData;
}

@freezed
class MainState with _$MainState {
  const factory MainState.initial({
    MainStateData? data,
  }) = Initial;
}