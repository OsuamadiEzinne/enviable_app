import 'package:bloc/bloc.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter/foundation.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:injectable/injectable.dart';
import 'package:enviable_app/core/domain/response/index.dart';

part 'network_state.dart';
part 'network_cubit.freezed.dart';

@injectable
class NetworkCubit extends Cubit<NetworkState> {
  NetworkCubit() : super(NetworkState());

  void get watch async {}
}