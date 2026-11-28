import 'package:flutter/material.dart';
import 'privacy_page.dart';
import 'account_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: const Text('الإعدادات', style: TextStyle(color: Colors.white)),
        leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context)),
      ),
      body: ListView(
        children: [
          _item(context, Icons.person, 'الحساب', const AccountPage()),
          _item(context, Icons.security, 'الأمان', const AccountPage()),
          _item(context, Icons.lock, 'الخصوصية', const PrivacyPage()),
          _item(context, Icons.notifications, 'الإشعارات', null),
          _item(context, Icons.language, 'اللغة', null),
          _item(context, Icons.dark_mode, 'المظهر', null),
          _item(context, Icons.storage, 'التخزين والبيانات', null),
          _item(context, Icons.help, 'المساعدة', null),
          _item(context, Icons.info, 'حول التطبيق', null),
          _item(context, Icons.switch_account, 'تبديل الحساب', null),
          _item(context, Icons.logout, 'تسجيل الخروج', null, isRed: true),
        ],
      ),
    );
  }
  Widget _item(BuildContext context, IconData icon, String title, Widget? page, {bool isRed = false}) {
    return ListTile(
      leading: Icon(icon, color: isRed ? Colors.red : Colors.white),
      title: Text(title, style: TextStyle(color: isRed ? Colors.red : Colors.white)),
      trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey),
      onTap: () {
        if (page != null) {
          Navigator.push(context, MaterialPageRoute(builder: (_) => page));
        }
      },
    );
  }
}
