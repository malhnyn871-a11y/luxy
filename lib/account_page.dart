import 'package:flutter/material.dart';
class AccountPage extends StatelessWidget {
  const AccountPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('الحساب', style: TextStyle(color: Colors.white)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Container(
            padding: const EdgeInsets.all(3),
            decoration: BoxDecoration(shape: BoxShape.circle, border: Border.all(color: Colors.red, width: 2)),
            child: const CircleAvatar(radius: 40, backgroundColor: Colors.red, child: Text('م', style: TextStyle(color: Colors.white, fontSize: 32))),
          ),
          const SizedBox(height: 10),
          const Text('محمد التميمي', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
          const Text('@m_fb2', style: TextStyle(color: Colors.grey)),
          const SizedBox(height: 20),
          _row('تغيير كلمة السر'),
          _row('إضافة رقم هاتف'),
          _row('البريد الإلكتروني'),
          _row('حذف الحساب', isRed: true),
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                style: ElevatedButton.styleFrom(backgroundColor: Colors.red),
                onPressed: () {},
                child: const Text('حفظ', style: TextStyle(color: Colors.white)),
              ),
            ),
          ),
        ],
      ),
    );
  }
  Widget _row(String title, {bool isRed = false}) {
    return ListTile(
      title: Text(title, style: TextStyle(color: isRed ? Colors.red : Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {},
    );
  }
}
