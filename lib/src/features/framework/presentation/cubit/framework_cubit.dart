
  import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'framework_state.dart';
  
  class FrameworkCubit extends Cubit<FrameworkState> {
    FrameworkCubit() : super(FrameworkInitial());
  }
  