import 'package:bank_app/l10n/app_localizations.dart';
import 'package:bank_app/theme/colors_scope.dart';
import 'package:flutter/material.dart';

class TransferPage extends StatefulWidget {
  const TransferPage({super.key});

  @override
  State<TransferPage> createState() => _TransferPageState();
}

class _TransferPageState extends State<TransferPage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;

  final TextEditingController accountController = TextEditingController();
  final TextEditingController bankController = TextEditingController();
  final TextEditingController countryController = TextEditingController();
  final TextEditingController amountController = TextEditingController();
  final TextEditingController noteController = TextEditingController();
  final TextEditingController swiftController = TextEditingController();

  @override
  void initState() {
    super.initState();
    _tabController = TabController(length: 3, vsync: this);
  }

  Widget sectionTitle(String title) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 8, top: 18),
      child: Text(
        title,
        style: const TextStyle(
          color: Colors.white70,
          fontSize: 14,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }

  Widget textField(
    String hint,
    TextEditingController controller, {
    TextInputType type = TextInputType.text,
  }) {
    return TextField(
      controller: controller,
      keyboardType: type,
      style: const TextStyle(color: Colors.white),
      decoration: InputDecoration(
        hintText: hint,
        hintStyle: const TextStyle(color: Colors.white38),
        filled: true,
        fillColor: const Color(0xFF1A1F38),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.circular(12),
          borderSide: BorderSide.none,
        ),
      ),
    );
  }

  Widget dropdown(String hint, List<String> items) {
    String value = items.first;

    return StatefulBuilder(
      builder: (context, setState) {
        return Container(
          padding: const EdgeInsets.symmetric(horizontal: 12),
          decoration: BoxDecoration(
            color: const Color(0xFF1A1F38),
            borderRadius: BorderRadius.circular(12),
          ),
          child: DropdownButton(
            dropdownColor: const Color(0xFF1A1F38),
            value: value,
            isExpanded: true,
            underline: const SizedBox(),
            style: const TextStyle(color: Colors.white),
            iconEnabledColor: Colors.white,
            items: items
                .map((e) => DropdownMenuItem(value: e, child: Text(e)))
                .toList(),
            onChanged: (v) {
              setState(() {
                value = v!;
              });
            },
          ),
        );
      },
    );
  }

  Widget sendButton(String type) {
    return SizedBox(
      height: 55,
      child: ElevatedButton.icon(
        icon: const Icon(Icons.send, color: Colors.white),
        label: Text("Send $type", style: const TextStyle(color: Colors.white)),
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.blue,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
        ),
        onPressed: () {
          ScaffoldMessenger.of(
            context,
          ).showSnackBar(SnackBar(content: Text("$type transfer sent")));
        },
      ),
    );
  }

  Widget thirdPartyForm(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          sectionTitle(t.originAccount),

          dropdown("Account", [t.checkingAccount, t.savingsAccount]),

          sectionTitle(t.destContact),

          dropdown("Contact", [
            "Camilo Sotomayor",
            "Maria Lopez",
            "Carlos Perez",
          ]),

          sectionTitle(t.amount),

          textField(
            t.enterAmount,
            amountController,
            type: TextInputType.number,
          ),

          sectionTitle(t.note),

          textField(t.optionalNote, noteController),

          const SizedBox(height: 30),

          sendButton(t.thirdParty),
        ],
      ),
    );
  }

  Widget achForm(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          sectionTitle(t.originAccount),

          dropdown("Account", [t.checkingAccount, t.savingsAccount]),

          sectionTitle(t.selectBank),

          dropdown("Bank", [
            "Banco Industrial",
            "Banrural",
            "BAC",
            "G&T Continental",
            "Bantrab",
            "Banco Azteca",
            "BancoNexa",
            "Promerica",
            "Banco Cuscatlan",
            "Interbanco",
            "Ficohsa",
            "",
          ]),

          sectionTitle(t.accountNumber),

          textField(t.enterAccount, accountController),

          sectionTitle(t.amount),

          textField(
            t.enterAmount,
            amountController,
            type: TextInputType.number,
          ),

          sectionTitle(t.note),

          textField(t.optionalNote, noteController),

          const SizedBox(height: 30),

          sendButton(t.ach),
        ],
      ),
    );
  }

  Widget internationalForm(BuildContext context) {
    final t = AppLocalizations.of(context)!;
    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [
          sectionTitle(t.originAccount),

          dropdown("Account", [t.checkingAccount, t.savingsAccount]),

          sectionTitle(t.country),

          dropdown("Country", [
            "United States",
            "Mexico",
            "Spain",
            "Canada",
            "Guatemala",
            "El Salvador",
            "Colombia",
          ]),

          sectionTitle(t.swiftCode),

          textField(t.enterSwift, swiftController),

          sectionTitle(t.accountNumber),

          textField(t.enterAccount, accountController),

          sectionTitle(t.amount),

          textField(
            t.enterAmount,
            amountController,
            type: TextInputType.number,
          ),

          sectionTitle(t.note),

          textField(t.optionalNote, noteController),

          const SizedBox(height: 30),

          sendButton(t.international),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final c = AppColorsScope.of(context);
    final t = AppLocalizations.of(context)!;
    return Scaffold(
      backgroundColor: c.background, // const Color(0xFF0F1220),

      appBar: AppBar(
        title: Text(t.transfer, style: const TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: c.background, //const Color(0xFF0F1220),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios, color: Colors.white),
          tooltip: t.back,
          onPressed: () {
            // Si puede volver, hace pop; si no, podrías navegar a Home
            if (Navigator.of(context).canPop()) {
              Navigator.of(context).pop();
            } else {
              // Navigator.of(context).pushReplacementNamed('/home');
              // o muestra un SnackBar:
              ScaffoldMessenger.of(
                context,
              ).showSnackBar(SnackBar(content: Text(t.noBackPage)));
            }
          },
        ),

        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.logout, color: Colors.white),
          ),
        ],

        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelStyle: const TextStyle(
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
          tabs: [
            Tab(
              icon: const Icon(Icons.people_outline, color: Colors.white),
              text: t.thirdParty,
            ),

            Tab(
              icon: const Icon(
                Icons.account_balance_outlined,
                color: Colors.white,
              ),
              text: t.ach,
            ),

            Tab(
              icon: const Icon(Icons.public_outlined, color: Colors.white),
              text: t.international,
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [
          thirdPartyForm(context),
          achForm(context),
          internationalForm(context),
        ],
      ),
    );
  }
}
