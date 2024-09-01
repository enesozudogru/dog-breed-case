import 'package:case_study/core/constants/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:go_router/go_router.dart';

import 'widgets/settings_item.dart';

class SettingsView extends StatefulWidget {
  const SettingsView({super.key});

  @override
  _SettingsViewState createState() => _SettingsViewState();
}

class _SettingsViewState extends State<SettingsView> {
  double offset = 0.0;
  double maxOffset = 300.0;
  static const platform = MethodChannel('com.example.osversion/os');
  String _osVersion = '0.0.0';

  @override
  void initState() {
    super.initState();
    _getOSVersion();
  }

  Future<void> _getOSVersion() async {
    String osVersion;
    try {
      final String result = await platform.invokeMethod('getOSVersion');
      osVersion = result;
    } on PlatformException catch (e) {
      osVersion = "Hata: '${e.message}'.";
    }

    setState(() {
      _osVersion = osVersion;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            GestureDetector(
              onVerticalDragUpdate: (details) {
                setState(() {
                  offset += details.primaryDelta!;
                  if (offset < 0) offset = 0;
                  if (offset > maxOffset) {
                    offset = maxOffset;
                    if (GoRouter.of(context).canPop()) {
                      GoRouter.of(context).pop();
                    }
                  }
                });
              },
              onVerticalDragEnd: (details) {
                if (offset > maxOffset / 2) {
                  if (GoRouter.of(context).canPop()) {
                    GoRouter.of(context).pop();
                  }
                } else {
                  setState(() {
                    offset = 0;
                  });
                }
              },
              child: Transform.translate(
                offset: Offset(0, offset),
                child: Container(
                  color: AppColors.background,
                  height: MediaQuery.of(context).size.height,
                  width: double.infinity,
                  child: Column(
                    children: [
                      SafeArea(
                        child: Align(
                          alignment: Alignment.topCenter,
                          child: Container(
                            margin: const EdgeInsets.symmetric(vertical: 10.0),
                            height: 4.0,
                            width: 32.0,
                            decoration: BoxDecoration(
                              color: AppColors.dividerColor,
                              borderRadius: BorderRadius.circular(2.0),
                            ),
                          ),
                        ),
                      ),
                      Column(
                        children: [
                          const SizedBox(height: 50),
                          const SettingsItem(title: "Help", leadingIcon: "assets/icons/info.png"),
                          const Divider(),
                          const SettingsItem(title: "Rate Us", leadingIcon: "assets/icons/star.png"),
                          const Divider(),
                          const SettingsItem(title: "Share with Friends", leadingIcon: "assets/icons/share.png"),
                          const Divider(),
                          const SettingsItem(title: "Terms of Use", leadingIcon: "assets/icons/doc.png"),
                          const Divider(),
                          const SettingsItem(title: "Privacy Policy", leadingIcon: "assets/icons/shield.png"),
                          const Divider(),
                          SettingsItem(
                            title: "OS Version",
                            leadingIcon: "assets/icons/version.png",
                            trailingText: _osVersion,
                          ),
                          const Divider(),
                        ],
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
