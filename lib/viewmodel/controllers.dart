import 'package:filemanager/viewmodel/home/home_state.dart';
import 'package:filemanager/viewmodel/home/home_viewmodel.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

var homeViewmodelController = AsyncNotifierProvider<HomeViewmodel, HomeState>(
  HomeViewmodel.new,
);
