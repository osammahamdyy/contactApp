import 'package:flutter/material.dart';

import '../core/app_assets.dart';
import '../core/app_colors.dart';

/// Home Screen (empty state)
class EmptyContacts extends StatelessWidget {
  const EmptyContacts({super.key});

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
       
          Image.asset(AppAssets.emptyList, width: 370,height: 370,),
          const SizedBox(height: 16),
          const Text(
            'There is No Contacts Added Here',
            style: TextStyle(
              color: AppColors.cream,
              fontSize: 20,
              fontWeight: FontWeight.w500,
            ),
          ),
        ],
      ),
    );
  }
}
