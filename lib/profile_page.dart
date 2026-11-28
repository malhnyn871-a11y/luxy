import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'edit_profile_page.dart';

class ProfilePage extends StatefulWidget {
  const ProfilePage({super.key});
  @override
  State<ProfilePage> createState() => _ProfileState();
}
class _ProfileState extends State<ProfilePage> {
  bool isFollowing = false;
  int selectedTab = 0;
  void showMsg(String m) { ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m), backgroundColor: Colors.red)); }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      appBar: AppBar(backgroundColor: Colors.black, title: const Text('LUXY', style: TextStyle(color: Colors.red, fontWeight: FontWeight.bold)), leading: IconButton(icon: const Icon(Icons.menu, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()))), actions: [IconButton(icon: const Icon(Icons.person_add, color: Colors.white), onPressed: () => showMsg('اضافة')), IconButton(icon: const Icon(Icons.notifications_none, color: Colors.white), onPressed: () => showMsg('اشعارات')), IconButton(icon: const Icon(Icons.edit, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfilePage())))]),
      body: SingleChildScrollView(child: Column(children: [
        Container(height: 120, color: Colors.red, alignment: Alignment.center, child: const Text('LUXY', style: TextStyle(color: Colors.white, fontSize: 32, fontWeight: FontWeight.bold))),
        const SizedBox(height: 10),
        const CircleAvatar(radius: 40, backgroundColor: Colors.red, child: Text('م', style: TextStyle(color: Colors.white, fontSize: 32))),
        const SizedBox(height: 10),
        const Text('محمد التميمي', style: TextStyle(color: Colors.white, fontSize: 18, fontWeight: FontWeight.bold)),
        const Text('@m_fb2', style: TextStyle(color: Colors.grey)),
        const SizedBox(height: 10),
        const Text('تابعني راح اشوفك هواي شغلات حلوة كوميدي، تحشيش، الشهر الأول', style: TextStyle(color: Colors.white), textAlign: TextAlign.center),
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: const [Text('120 متابع', style: TextStyle(color: Colors.white)), SizedBox(width: 20), Text('90 يتابع', style: TextStyle(color: Colors.white)), SizedBox(width: 20), Text('1.2K اعجاب', style: TextStyle(color: Colors.white))]),
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.center, children: [GestureDetector(onTap: () { setState(() => isFollowing = !isFollowing); }, child: Container(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), decoration: BoxDecoration(color: isFollowing ? Colors.grey : Colors.red, borderRadius: BorderRadius.circular(8)), child: Text(isFollowing ? 'متابع' : 'متابعة', style: const TextStyle(color: Colors.white)))), const SizedBox(width: 10), GestureDetector(onTap: () => showMsg('رسائل'), child: Container(padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10), decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(8)), child: const Text('رسائل', style: TextStyle(color: Colors.white))))]),
        const SizedBox(height: 15),
        Row(mainAxisAlignment: MainAxisAlignment.spaceEvenly, children: [for (int i = 0; i < 5; i++) IconButton(icon: Icon([Icons.grid_on, Icons.favorite, Icons.repeat, Icons.lock, Icons.menu][i], color: selectedTab == i ? Colors.red : Colors.white), onPressed: () => setState(() => selectedTab = i))]),
        const SizedBox(height: 10),
        const Text('لا توجد فيديوهات بعد', style: TextStyle(color: Colors.grey)),
      ])),
    );
  }
}
