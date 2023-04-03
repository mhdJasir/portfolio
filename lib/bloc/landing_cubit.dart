import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';

part 'landing_state.dart';

class LandingCubit extends Cubit<LandingState> {
  LandingCubit() : super(LandingState(currentPage: 0));

  final aboutMeKey = GlobalKey();
  final experienceKey = GlobalKey();
  final workKey = GlobalKey();
  final contactKey = GlobalKey();

  final scrollController = ScrollController();

  void scrollToWidget(context) {
    Scrollable.ensureVisible(
      context,
      duration: const Duration(milliseconds: 1000),
    );
  }

  void onPageChange(int i) {
    emit(LandingState(currentPage: i));
  }

  void onHover(int? val) {
    emit(LandingState(hoverIndex: val));
  }
}
