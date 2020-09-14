import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

abstract class AbstractThemeBlocState {
  final ThemeMode _themeMode;

  AbstractThemeBlocState({@required ThemeMode themeMode})
      : this._themeMode = themeMode,
        assert(themeMode != null);

  ThemeMode get themeMode => _themeMode;
}

class InitialState extends AbstractThemeBlocState {
  InitialState() : super(themeMode: ThemeMode.system);
}

class ChangedThemeState extends AbstractThemeBlocState {
  ChangedThemeState({@required ThemeMode themeMode})
      : super(themeMode: themeMode);
}

class ThemeBloc extends Bloc<ThemeMode, AbstractThemeBlocState> {
  ThemeBloc() : super(InitialState());

  @override
  Stream<AbstractThemeBlocState> mapEventToState(ThemeMode themeMode) async* {
    yield ChangedThemeState(themeMode: themeMode);
  }
}
