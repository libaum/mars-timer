# CLAUDE.md

Mars Timer — a minimalist meditation timer. Tap to start/pause/resume,
long-press (idle) for stats.

## Commands

```bash
flutter run
flutter test
flutter analyze
flutter pub run flutter_launcher_icons   # after changing assets/icon/app_icon.png
```

## Deviations from the Mars standard

This is the oldest app and predates `../DESIGN.md`:

- **State is Provider** (`TimerProvider`, a `ChangeNotifier`), not
  `ValueNotifier` + `GetIt`. Services are singletons passed in from `main.dart`.
  Don't migrate as a side effect of another change — only as its own task.
- Sessions live in **sqflite** (`meditation_sessions`), not SharedPreferences;
  prefs hold only `last_duration`. On Linux/Windows `sqflite_common_ffi` is
  initialised in `main.dart`.
- Folder layout is `models/ providers/ screens/ services/ theme/ widgets/`.
- Colours and text styles live in `lib/theme/app_theme.dart` — use those, never
  inline values.

## Things that aren't obvious from the code

- The timer targets wall-clock time (`_targetTime`) instead of counting down
  ticks, so pause/resume stays accurate.
- States: `idle → prep → running ⇄ paused → finished`. Prep is skipped when the
  prep time is 0. From `paused`: clear → idle, or save → idle with a partial
  session.
- A session is only saved once the user got past the prep phase
  (`wasPausedDuringPrep`).
- The `5s` quick-select button is a dev aid (`_isTestDuration`).
- The singing bowl plays at start and end (`assets/audio/singing_bowl.mp3`).
