import 'package:flutter/material.dart';
import 'privacy_page.dart';
import 'account_page.dart';

class SettingsPage extends StatelessWidget {
  const SettingsPage({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('الإعدادات', style: TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))),
      body: ListView(children: [
        _item(context, Icons.person, 'الحساب', const AccountPage()),
        _item(context, Icons.security, 'الأمان', const AccountPage()),
        _item(context, Icons.lock, 'الخصوصية', const PrivacyPage()),
        _item(context, Icons.notifications, 'الإشعارات', const _NotifPage()),
        _item(context, Icons.language, 'اللغة', const _LangPage()),
        _item(context, Icons.dark_mode, 'المظهر', const _ThemePage()),
        _item(context, Icons.storage, 'التخزين والبيانات', const _StoragePage()),
        _item(context, Icons.help, 'المساعدة', const _HelpPage()),
        _item(context, Icons.info, 'حول التطبيق', const _AboutPage()),
        _item(context, Icons.switch_account, 'تبديل الحساب', const _SwitchPage()),
        _item(context, Icons.logout, 'تسجيل الخروج', const _LogoutPage(), isRed: true),
      ]),
    );
  }
  Widget _item(BuildContext context, IconData icon, String title, Widget page, {bool isRed = false}) {
    return ListTile(leading: Icon(icon, color: isRed ? Colors.red : Colors.white), title: Text(title, style: TextStyle(color: isRed ? Colors.red : Colors.white)), trailing: const Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey), onTap: () { Navigator.push(context, MaterialPageRoute(builder: (_) => page)); });
  }
}

class _Base extends StatelessWidget {
  final String title; final Widget child;
  const _Base({required this.title, required this.child});
  @override
  Widget build(BuildContext context) {
    return Scaffold(backgroundColor: Colors.black, appBar: AppBar(backgroundColor: Colors.black, title: Text(title, style: const TextStyle(color: Colors.white)), leading: IconButton(icon: const Icon(Icons.arrow_back, color: Colors.white), onPressed: () => Navigator.pop(context))), body: child);
  }
}

class _NotifPage extends StatefulWidget { const _NotifPage(); @override State<_NotifPage> createState() => _NotifState(); }
class _NotifState extends State<_NotifPage> { bool a=true,b=true,c=false; @override Widget build(BuildContext context) { return _Base(title: 'الإشعارات', child: ListView(children: [SwitchListTile(title: const Text('الإعجابات', style: TextStyle(color: Colors.white)), value: a, activeColor: Colors.red, onChanged: (v)=>setState(()=>a=v)), SwitchListTile(title: const Text('التعليقات', style: TextStyle(color: Colors.white)), value: b, activeColor: Colors.red, onChanged: (v)=>setState(()=>b=v)), SwitchListTile(title: const Text('المتابعين الجدد', style: TextStyle(color: Colors.white)), value: c, activeColor: Colors.red, onChanged: (v)=>setState(()=>c=v))])); } }

class _LangPage extends StatefulWidget { const _LangPage(); @override State<_LangPage> createState() => _LangState(); }
class _LangState extends State<_LangPage> { String v='ar'; @override Widget build(BuildContext context) { return _Base(title: 'اللغة', child: Column(children: [RadioListTile(value: 'ar', groupValue: v, title: const Text('العربية', style: TextStyle(color: Colors.white)), activeColor: Colors.red, onChanged: (x)=>setState(()=>v=x as String)), RadioListTile(value: 'en', groupValue: v, title: const Text('English', style: TextStyle(color: Colors.white)), activeColor: Colors.red, onChanged: (x)=>setState(()=>v=x as String))])); } }

class _ThemePage extends StatefulWidget { const _ThemePage(); @override State<_ThemePage> createState() => _ThemeState(); }
class _ThemeState extends State<_ThemePage> { String v='dark'; @override Widget build(BuildContext context) { return _Base(title: 'المظهر', child: Column(children: [RadioListTile(value: 'dark', groupValue: v, title: const Text('داكن', style: TextStyle(color: Colors.white)), subtitle: const Text('الوضع الحالي', style: TextStyle(color: Colors.grey)), activeColor: Colors.red, onChanged: (x)=>setState(()=>v=x as String)), RadioListTile(value: 'light', groupValue: v, title: const Text('فاتح', style: TextStyle(color: Colors.white)), activeColor: Colors.red, onChanged: (x)=>setState(()=>v=x as String))])); } }

class _StoragePage extends StatelessWidget { const _StoragePage(); @override Widget build(BuildContext context) { return _Base(title: 'التخزين والبيانات', child: ListView(children: [const ListTile(title: Text('ذاكرة التخزين المؤقت', style: TextStyle(color: Colors.white)), subtitle: Text('12.5 MB', style: TextStyle(color: Colors.grey))), Padding(padding: const EdgeInsets.all(20), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () {}, child: const Text('مسح ذاكرة التخزين المؤقت', style: TextStyle(color: Colors.white))))])); } }

class _HelpPage extends StatelessWidget { const _HelpPage(); @override Widget build(BuildContext context) { return _Base(title: 'المساعدة', child: ListView(children: const [ListTile(title: Text('كيف أنشر فيديو؟', style: TextStyle(color: Colors.white)), trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey)), ListTile(title: Text('كيف أغير كلمة السر؟', style: TextStyle(color: Colors.white)), trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey)), ListTile(title: Text('تواصل معنا', style: TextStyle(color: Colors.white)), trailing: Icon(Icons.arrow_forward_ios, size: 14, color: Colors.grey))])); } }

class _AboutPage extends StatelessWidget { const _AboutPage(); @override Widget build(BuildContext context) { return _Base(title: 'حول التطبيق', child: const Center(child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [Text('LUXY', style: TextStyle(color: Colors.red, fontSize: 32, fontWeight: FontWeight.bold)), SizedBox(height: 10), Text('الإصدار 1.0', style: TextStyle(color: Colors.white)), Text('تطبيق فيديوهات قصيرة', style: TextStyle(color: Colors.grey))]))); } }

class _SwitchPage extends StatelessWidget { const _SwitchPage(); @override Widget build(BuildContext context) { return _Base(title: 'تبديل الحساب', child: ListView(children: [const ListTile(leading: CircleAvatar(backgroundColor: Colors.red, child: Text('م', style: TextStyle(color: Colors.white))), title: Text('محمد التميمي', style: TextStyle(color: Colors.white)), subtitle: Text('@m_fb2', style: TextStyle(color: Colors.grey)), trailing: Icon(Icons.check, color: Colors.red)), Padding(padding: const EdgeInsets.all(20), child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () {}, child: const Text('إضافة حساب', style: TextStyle(color: Colors.white))))])); } }

class _LogoutPage extends StatelessWidget { const _LogoutPage(); @override Widget build(BuildContext context) { return _Base(title: 'تسجيل الخروج', child: Center(child: Padding(padding: const EdgeInsets.all(20), child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [const Text('متأكد تريد تسجيل الخروج؟', style: TextStyle(color: Colors.white, fontSize: 18)), const SizedBox(height: 20), SizedBox(width: double.infinity, child: ElevatedButton(style: ElevatedButton.styleFrom(backgroundColor: Colors.red), onPressed: () {}, child: const Text('تسجيل الخروج', style: TextStyle(color: Colors.white))))])))); } }
