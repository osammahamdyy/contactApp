import 'package:flutter/material.dart';

import '../core/app_assets.dart';
import '../core/app_colors.dart';
import '../models/contact_model.dart';

/// One card in the Home Screen grid
class ContactCard extends StatelessWidget {
  final ContactModel contact;
  final VoidCallback onDelete;

  const ContactCard({
    super.key,
    required this.contact,
    required this.onDelete,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.cream,
        borderRadius: BorderRadius.circular(12),
      ),
      clipBehavior: Clip.antiAlias,
      child: Column(
        children: [
          // ── Photo + name tag ──
          Expanded(
            child: Stack(
              fit: StackFit.expand,
              children: [
                contact.image != null
                    ? Image.file(contact.image!, fit: BoxFit.cover)
                  
                    : Container(
                        color: AppColors.placeholderGrey,
                        padding: const EdgeInsets.all(24),
                        child: Image.asset(AppAssets.imageplace),
                      ),
                Positioned(
                  left: 6,
                  bottom: 6,
                  child: Container(
                    padding:
                        const EdgeInsets.symmetric(horizontal: 8, vertical: 3),
                    decoration: BoxDecoration(
                      color: AppColors.cream,
                      borderRadius: BorderRadius.circular(6),
                    ),
                    child: Text(
                      contact.name,
                      style: const TextStyle(
                        color: AppColors.textDark,
                        fontSize: 10,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),

          // ── Details ──
          Padding(
            padding: const EdgeInsets.all(8),
            child: Column(
              children: [
                _InfoRow(
                 
                  icon: AppAssets.email,
                  text: contact.email,
                ),
                const SizedBox(height: 6),
                _InfoRow(
                 
                  icon: AppAssets.phone,
                  text: contact.phone,
                ),
                const SizedBox(height: 8),
                SizedBox(
                  width: double.infinity,
                  height: 26,
                  child: ElevatedButton.icon(
                    onPressed: onDelete,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.red,
                      foregroundColor: AppColors.textLight,
                      padding: EdgeInsets.zero,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(6),
                      ),
                    ),
                   
                    icon: Image.asset(
                      AppAssets.delete,
                      width: 10,
                      color: AppColors.textLight,
                    ),
                    label: const Text('Delete', style: TextStyle(fontSize: 9)),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class _InfoRow extends StatelessWidget {
  final String icon;
  final String text;

  const _InfoRow({required this.icon, required this.text});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Container(
          padding: const EdgeInsets.all(3),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(4),
          ),
          child: Image.asset(icon, width: 8, height: 8),
        ),
        const SizedBox(width: 6),
        Expanded(
          child: Text(
            text,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: const TextStyle(color: AppColors.textDark, fontSize: 8),
          ),
        ),
      ],
    );
  }
}
