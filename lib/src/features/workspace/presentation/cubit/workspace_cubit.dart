
  import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'workspace_state.dart';
  
  class WorkspaceCubit extends Cubit<WorkspaceState> {
    WorkspaceCubit() : super(WorkspaceInitial());
  }
  