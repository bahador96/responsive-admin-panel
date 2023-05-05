import 'package:flutter/material.dart';
import 'package:flutter_application_1/constants.dart';

import 'package:flutter_application_1/responsive.dart';
import 'package:flutter_application_1/screens/dashboard/components/my_fields.dart';
import 'package:flutter_application_1/screens/dashboard/components/recent_files.dart';

import 'package:flutter_application_1/screens/dashboard/components/storage_detail.dart';

import 'components/header.dart';

class DashboardScreen extends StatelessWidget {
  const DashboardScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: SingleChildScrollView(
        padding: const EdgeInsets.all(defaultPadding),
        child: Column(
          children: [
            const Header(),
            const SizedBox(
              height: defaultPadding,
            ),
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(
                  flex: 5,
                  child: Column(
                    children: [
                      const MyFiles(),
                      const SizedBox(
                        height: defaultPadding,
                      ),
                      const RecentFiles(),
                      if (Responsive.isMobile(context))
                        const SizedBox(
                          height: defaultPadding,
                        ),
                      if (Responsive.isMobile(context)) ...{
                        const StorageDetails()
                      }
                    ],
                  ),
                ),
                if (!Responsive.isMobile(context))
                  const SizedBox(
                    width: defaultPadding,
                  ),
                if (!Responsive.isMobile(context)) ...{
                  const Expanded(
                    flex: 2,
                    child: StorageDetails(),
                  )
                }
              ],
            )
          ],
        ),
      ),
    );
  }
}
