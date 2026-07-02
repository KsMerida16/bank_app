import 'package:bank_app/features/settings/domain/entities/language_entity.dart';
import 'package:flutter/material.dart';

class LanguageTile extends StatelessWidget {
  final LanguageEntity language;
  final bool isSelected;
  final VoidCallback onTap;

  const LanguageTile({
    super.key,
    required this.language,
    required this.isSelected,
    required this.onTap,
  });

  String get flag {
    switch (language.code) {
      case 'es':
        return '🇪🇸';
      case 'en':
        return '🇺🇸';
      default:
        return '🌐';
    }
  }

  @override
  Widget build(BuildContext context) {
    return Material(
      color: Colors.transparent,
      child: InkWell(
        borderRadius: BorderRadius.circular(18),
        onTap: onTap,
        child: AnimatedContainer(
          duration: const Duration(milliseconds: 250),
          margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 6),
          padding: const EdgeInsets.all(16),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1F38),
            borderRadius: BorderRadius.circular(18),
            border: Border.all(
              color: isSelected ? const Color(0xFF006FFD) : Colors.transparent,
              width: 2,
            ),
          ),
          child: Row(
            children: [
              Text(flag, style: const TextStyle(fontSize: 28)),

              const SizedBox(width: 18),

              Expanded(
                child: Text(
                  language.name,
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 17,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),

              AnimatedSwitcher(
                duration: const Duration(milliseconds: 250),
                child: isSelected
                    ? const Icon(
                        Icons.check_circle,
                        key: ValueKey(1),
                        color: Color(0xFF006FFD),
                        size: 28,
                      )
                    : const SizedBox(key: ValueKey(2)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
