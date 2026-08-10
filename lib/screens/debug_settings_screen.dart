import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../providers/timer_provider.dart';
import '../theme/app_theme.dart';

/// Debug-only screen (reachable via swipe-up on the home screen, only in
/// kDebugMode) to hide debug affordances (5s/OT buttons, stats seed/clear)
/// for taking clean screenshots.
class DebugSettingsScreen extends StatelessWidget {
  const DebugSettingsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Consumer<TimerProvider>(
      builder: (context, provider, child) {
        return Scaffold(
          backgroundColor: AppTheme.black,
          body: SafeArea(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SizedBox(height: 24),
                  Text(
                    'debug settings',
                    style: AppTheme.outfitLight.copyWith(
                      fontSize: 20,
                      color: AppTheme.white,
                    ),
                  ),
                  const SizedBox(height: 40),
                  GestureDetector(
                    onTap: () => provider.setDebugControlsVisible(
                      !provider.debugControlsVisible,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              'debug controls\n(5s, OT, seed, clear)',
                              style: AppTheme.outfitLight.copyWith(
                                fontSize: 16,
                                color: AppTheme.white,
                                height: 1.4,
                              ),
                            ),
                          ),
                          Text(
                            provider.debugControlsVisible ? 'on' : 'off',
                            style: AppTheme.outfitMedium.copyWith(
                              fontSize: 16,
                              color: provider.debugControlsVisible
                                  ? AppTheme.white
                                  : AppTheme.gray,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
