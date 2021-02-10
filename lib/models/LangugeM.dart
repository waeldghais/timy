class Language {
  final int id;
  final String name;
  final String flag;
  final String langugeCode;
  Language(this.id, this.flag, this.name, this.langugeCode);
  List<Language> languageList() {
    return <Language>[
      Language(1, "🇫🇷", "Français", "fr"),
      Language(2, "🏴󠁧󠁢󠁥󠁮󠁧󠁿", "English", "en"),
      Language(3, "🇪🇸", "Espagnol", "es"),
      Language(4, "🇹🇳", "العربية", "ar"),
      Language(5, "🇨🇳", "Chinese", "zh"),
      Language(6, "🇹🇷", "Turkish", "tr"),
    ];
  }
}
