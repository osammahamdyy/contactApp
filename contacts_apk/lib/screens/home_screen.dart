import 'package:contacts_app/widgets/add_contact_sheet2.dart';
import 'package:flutter/material.dart';

import '../core/app_assets.dart';
import '../core/app_colors.dart';
import '../models/contact_model.dart';

import '../widgets/contact_card.dart';
import '../widgets/empty_contacts.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final List<ContactModel> _contacts = [];

  Future<void> _openAddSheet() async {
    final contact = await showModalBottomSheet<ContactModel>(
      context: context,
      isScrollControlled: true, // lets the sheet rise above the keyboard
      backgroundColor: AppColors.sheetBackground,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.vertical(top: Radius.circular(24)),
      ),
      builder: (_) => const AddContactSheet(),
    );

    if (contact != null) {
      setState(() => _contacts.add(contact));
    }
  }

  void _deleteContact(int index) {
    setState(() => _contacts.removeAt(index));
  }

  void _deleteAll() {
    setState(() => _contacts.clear());
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.background,
      appBar: AppBar(
        backgroundColor: AppColors.background,
        elevation: 0,
        scrolledUnderElevation: 0,
        centerTitle: false,
       
        title: Image.asset(AppAssets.logo, height: 32),
      ),
      body: _contacts.isEmpty
          ? const EmptyContacts()
          : GridView.builder(
              padding: const EdgeInsets.fromLTRB(12, 8, 12, 120),
              itemCount: _contacts.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                childAspectRatio: 0.78,
              ),
              itemBuilder: (_, i) => ContactCard(
                contact: _contacts[i],
                onDelete: () => _deleteContact(i),
              ),
            ),
      floatingActionButton: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
         
          if (_contacts.isNotEmpty) ...[
            FloatingActionButton.small(
              heroTag: 'delete_all',
              backgroundColor: AppColors.red,
              onPressed: _deleteAll,
             
              child: Image.asset(
                AppAssets.delete,
                width: 18,
                color: AppColors.textLight,
              ),
            ),
            const SizedBox(height: 12),
          ],
          // Add button
          FloatingActionButton.small(
            heroTag: 'add',
            backgroundColor: AppColors.cream,
            onPressed: _openAddSheet,
           
            child: const Icon(Icons.add, color: AppColors.textDark),
          ),
        ],
      ),
    );
  }
}
