import 'package:bank_app/features/settings/domain/constants/language_catalog.dart';
import 'package:bank_app/features/settings/domain/entities/language_entity.dart';
import 'package:bank_app/features/settings/presentation/state/language_provider.dart';
import 'package:bank_app/features/settings/presentation/widgets/language_tile.dart';
import 'package:bank_app/theme/colors_scope.dart' as AppColorsScope;
import 'package:bank_app/widgets/custom_app_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class LanguagePage extends ConsumerStatefulWidget {
  const LanguagePage({super.key});

  @override
  ConsumerState<LanguagePage> createState() => _LanguagePageState();
}

class _LanguagePageState extends ConsumerState<LanguagePage> {
  final TextEditingController _searchController = TextEditingController();

  List<LanguageEntity> _languages = LanguageCatalog.languages;

  void _filterLanguages(String value) {
    setState(() {
      if (value.trim().isEmpty) {
        _languages = LanguageCatalog.languages;
      } else {
        _languages = LanguageCatalog.languages.where((language) {
          return language.name.toLowerCase().contains(value.toLowerCase());
        }).toList();
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    final colors = AppColorsScope.of(context);

    final state = ref.watch(languageNotifierProvider);

    return Scaffold(
      backgroundColor: colors.background,

      appBar: const CustomAppBar(title: "Language"),

      body: Column(
        children: [
          const SizedBox(height: 20),

          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16),
            child: TextField(
              controller: _searchController,
              onChanged: _filterLanguages,
              style: const TextStyle(color: Colors.white),
              decoration: InputDecoration(
                hintText: "Search language",
                prefixIcon: const Icon(Icons.search),

                filled: true,
                fillColor: const Color(0xFF1A1F38),

                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(16),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
          ),

          const SizedBox(height: 20),

          Expanded(
            child: ListView.builder(
              itemCount: _languages.length,

              itemBuilder: (context, index) {
                final language = _languages[index];

                return LanguageTile(
                  language: language,

                  isSelected: state.locale.languageCode == language.code,

                  onTap: () async {
                    await ref
                        .read(languageNotifierProvider.notifier)
                        .changeLanguage(language);
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
