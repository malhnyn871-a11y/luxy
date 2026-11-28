import 'package:flutter/material.dart';
import 'settings_page.dart';
import 'edit_profile_page.dart';
class LuxyProfilePage extends StatefulWidget {
LuxyProfilePage({super.key});
@override
State<LuxyProfilePage> createState() => _LuxyProfilePageState();
}
class _LuxyProfilePageState extends State<LuxyProfilePage> {
bool isFollowing = false; int selectedTab = 0;
void showMsg(String m) {
ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m), duration: Duration(seconds: 1)));
}
final List<Map<String, dynamic>> highlights = [
{"label": "سفر", "color": Colors.orange},
{"label": "طعام", "color": Colors.pink},
{"label": "أزياء", "color": Colors.red},
{"label": "يوميات", "color": Colors.blue},
{"label": "رياضة", "color": Colors.green},
];
final List<Map<String, dynamic>> myVideos = [
{"views": "4.8 مليون", "color": Colors.red},
{"views": "16.7 ألف", "color": Colors.pink},
{"views": "1.0 ألف", "color": Colors.red},
{"views": "324", "color": Colors.deepPurple},
{"views": "309", "color": Colors.blue},
{"views": "401", "color": Colors.lightBlue},
{"views": "310", "color": Colors.orange},
{"views": "465", "color": Colors.teal},
{"views": "2257", "color": Colors.green},
];
@override
Widget build(BuildContext context) {
return Scaffold(
backgroundColor: Colors.black,
appBar: AppBar(backgroundColor: Colors.black, elevation: 0, leading: IconButton(icon: Icon(Icons.menu, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const SettingsPage()))), title: Text('Luxy', style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold)), actions: [IconButton(icon: Icon(Icons.person_add_outlined, color: Colors.white), onPressed: () => showMsg('اضافة')), IconButton(icon: Icon(Icons.notifications_none, color: Colors.white), onPressed: () => showMsg('الاشعارات')), IconButton(icon: Icon(Icons.edit, color: Colors.white), onPressed: () => Navigator.push(context, MaterialPageRoute(builder: (_) => const EditProfilePage())),
body: SingleChildScrollView(
child: Column(children: [
SizedBox(height: 12),
Container(width: 110, height: 110, decoration: BoxDecoration(color: Colors.grey[800], shape: BoxShape.circle, border: Border.all(color: Colors.red, width: 3)), child: Center(child: Text('م', style: TextStyle(fontSize: 45, fontWeight: FontWeight.bold, color: Colors.white)))),
SizedBox(height: 10),
Text('محمد التميمي', style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.white)),
Text('@m_fb2', style: TextStyle(color: Colors.grey, fontSize: 16)),
SizedBox(height: 12),
Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_stat('153', 'متابع'), _stat('4217', 'متابعون'), _stat('106 ألف', 'إعجاب')]),
SizedBox(height: 12),
Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Row(children: [Expanded(child: GestureDetector(onTap: () { setState(() { isFollowing = !isFollowing; }); showMsg(isFollowing ? 'تمت المتابعة' : 'تم الغاء المتابعة'); }, child: Container(padding: EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(10)), child: Center(child: Text(isFollowing ? 'متابع' : 'متابعة', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold)))))), SizedBox(width: 10), Expanded(child: GestureDetector(onTap: () => showMsg('الرسائل'), child: Container(padding: EdgeInsets.symmetric(vertical: 12), decoration: BoxDecoration(color: Colors.grey[800], borderRadius: BorderRadius.circular(10)), child: Center(child: Text('الرسائل', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.bold))))))])),
SizedBox(height: 12),
Padding(padding: EdgeInsets.symmetric(horizontal: 16), child: Text('تابعني راح اشوفك هواي شغلات حلوة\nكوميدي، تحشيش، الشهر الأول', textAlign: TextAlign.center, style: TextStyle(color: Colors.white))),
SizedBox(height: 12),
SizedBox(height: 80, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: highlights.length, itemBuilder: (context, index) { final h = highlights[index]; return GestureDetector(onTap: () => showMsg('ستوري'), child: Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Column(children: [Container(width: 60, height: 60, decoration: BoxDecoration(color: h['color'], shape: BoxShape.circle, border: Border.all(color: Colors.red, width: 2)), child: Center(child: Text(h['label'][0], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)))), SizedBox(height: 4), Text(h['label'], style: TextStyle(color: Colors.white, fontSize: 12))]))); })),
SizedBox(height: 10),
Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [GestureDetector(onTap: () { setState(() { selectedTab = 0; }); }, child: Icon(Icons.grid_on, color: selectedTab == 0 ? Colors.red : Colors.grey)), GestureDetector(onTap: () { setState(() { selectedTab = 1; }); }, child: Icon(selectedTab == 1 ? Icons.favorite : Icons.favorite_border, color: selectedTab == 1 ? Colors.red : Colors.grey)), GestureDetector(onTap: () { setState(() { selectedTab = 2; }); }, child: Icon(Icons.repeat, color: selectedTab == 2 ? Colors.red : Colors.grey)), GestureDetector(onTap: () { setState(() { selectedTab = 3; }); }, child: Icon(selectedTab == 3 ? Icons.lock : Icons.lock_outline, color: selectedTab == 3 ? Colors.red : Colors.grey)), GestureDetector(onTap: () { setState(() { selectedTab = 4; }); }, child: Icon(Icons.menu, color: selectedTab == 4 ? Colors.red : Colors.grey))]),
Divider(color: Colors.grey[800]),
GridView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 2, mainAxisSpacing: 2, childAspectRatio: 0.75), itemCount: myVideos.length, itemBuilder: (context, index) { final video = myVideos[index]; return GestureDetector(onTap: () => showMsg('تشغيل فيديو'), child: Stack(fit: StackFit.expand, children: [Container(color: video['color']), Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40)), Positioned(bottom: 4, left: 4, child: Row(children: [Icon(Icons.play_arrow, color: Colors.white, size: 14), Text(video['views'], style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))]))])); }),
])),
);
}
Widget _stat(String num, String label) {
return GestureDetector(onTap: () => showMsg(label), child: Column(children: [Text(num, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 18, color: Colors.white)), Text(label, style: TextStyle(color: Colors.grey, fontSize: 13))]));
}
}
