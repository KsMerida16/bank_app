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

  Widget textField(String hint, TextEditingController controller,
      {TextInputType type = TextInputType.text}) {

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
                .map((e) => DropdownMenuItem(
                      value: e,
                      child: Text(e),
                    ))
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

          ScaffoldMessenger.of(context).showSnackBar(
            SnackBar(content: Text("$type transfer sent")),
          );
        },
      ),
    );
  }

  Widget thirdPartyForm() {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [

          sectionTitle("From Account"),

          dropdown("Account", [
            "Checking Account",
            "Savings Account",
          ]),

          sectionTitle("Select Contact"),

          dropdown("Contact", [
            "Camilo Sotomayor",
            "Maria Lopez",
            "Carlos Perez"
          ]),

          sectionTitle("Amount"),

          textField("Enter amount", amountController,
              type: TextInputType.number),

          sectionTitle("Note"),

          textField("Optional note", noteController),

          const SizedBox(height: 30),

          sendButton("Third Party"),
        ],
      ),
    );
  }

  Widget achForm() {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [

          sectionTitle("From Account"),

          dropdown("Account", [
            "Checking Account",
            "Savings Account",
          ]),

          sectionTitle("Select Bank"),

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
            ""
          ]),

          sectionTitle("Account Number"),

          textField("Enter account number", accountController),

          sectionTitle("Amount"),

          textField("Enter amount", amountController,
              type: TextInputType.number),

          sectionTitle("Note"),

          textField("Optional note", noteController),

          const SizedBox(height: 30),

          sendButton("ACH"),
        ],
      ),
    );
  }

  Widget internationalForm() {

    return Padding(
      padding: const EdgeInsets.all(16),
      child: ListView(
        children: [

          sectionTitle("From Account"),

          dropdown("Account", [
            "Checking Account",
            "Savings Account",
          ]),

          sectionTitle("Country"),

          dropdown("Country", [
            "United States",
            "Mexico",
            "Spain",
            "Canada",
            "Guatemala",
            "El Salvador",
            "Colombia",
          ]),

          sectionTitle("SWIFT Code"),

          textField("Enter SWIFT code", swiftController),

          sectionTitle("Account Number"),

          textField("Enter account number", accountController),

          sectionTitle("Amount"),

          textField("Enter amount", amountController,
              type: TextInputType.number),

          sectionTitle("Note"),

          textField("Optional note", noteController),

          const SizedBox(height: 30),

          sendButton("International"),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {

    return Scaffold(

      backgroundColor: const Color(0xFF0F1220),

      appBar: AppBar(
        title: const Text("Transfers", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: const Color(0xFF0F1220),
        leading: const Icon(Icons.arrow_back_ios, color: Colors.white),
        actions: const [
          Padding(
            padding: EdgeInsets.only(right: 16),
            child: Icon(Icons.logout, color: Colors.white),
          )
        ],

        bottom: TabBar(
          controller: _tabController,
          indicatorColor: Colors.blue,
          labelStyle: const TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
          tabs: const [

            Tab(
              icon: Icon(Icons.people_outline, color: Colors.white),
              text: "Third Party",
            ),

            Tab(
              icon: Icon(Icons.account_balance_outlined, color: Colors.white),
              text: "ACH",
            ),

            Tab(
              icon: Icon(Icons.public_outlined, color: Colors.white),
              text: "International",
            ),
          ],
        ),
      ),

      body: TabBarView(
        controller: _tabController,
        children: [

          thirdPartyForm(),
          achForm(),
          internationalForm(),

        ],
      ),
    );
  }
}