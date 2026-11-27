import 'package:flutter/material.dart';

class LuxyProfilePage extends StatefulWidget {
  LuxyProfilePage({super.key});
  @override
  State<LuxyProfilePage> createState() => _LuxyProfilePageState();
}

class _LuxyProfilePageState extends State<LuxyProfilePage> {
  bool isFollowing = false;
  int selectedTab = 0;

  final List<Map<String, dynamic>> highlights = [
    {"label": "سفر", "color": Colors.orange},
    {"label": "طعام", "color": Colors.pink},
    {"label": "أزياء", "color": Colors.purple},
    {"label": "يوميات", "color": Colors.blue},
    {"label": "رياضة", "color": Colors.green},
  ];

  final List<Map<String, dynamic>> myVideos = [
    {"views": "4.8 مليون", "color": Colors.red},
    {"views": "16.7 ألف", "color": Colors.pink},
    {"views": "1.0 ألف", "color": Colors.purple},
    {"views": "324", "color": Colors.deepPurple},
    {"views": "309", "color": Colors.blue},
    {"views": "401", "color": Colors.lightBlue},
    {"views": "310", "color": Colors.orange},
    {"views": "465", "color": Colors.teal},
    {"views": "2257", "color": Colors.green},
  ];

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(msg), duration: Duration(seconds: 1)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: IconButton(icon: Icon(Icons.menu, color: Colors.black), onPressed: () => showMsg("القائمة")), actions: [IconButton(icon: Icon(Icons.person_add_outlined, color: Colors.black), onPressed: () => showMsg("إضافة صديق")), IconButton(icon: Icon(Icons.notifications_none, color: Colors.black), onPressed: () => showMsg("التنبيهات")), IconButton(icon: Icon(Icons.edit_outlined, color: Colors.black), onPressed: () => showMsg("تعديل الملف"))]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(crossAxisAlignment: CrossAxisAlignment.start, children: [Padding(padding: EdgeInsets.all(12), child: GestureDetector(onTap: () => showMsg("تغيير الصورة"), child: Stack(children: [Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle, border: Border.all(color: Colors.red, width: 3)), child: Center(child: Text("م", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold)))), Positioned(bottom: 0, right: 0, child: Container(decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle), child: Icon(Icons.add, color: Colors.white, size: 20)))]))), Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 8), Text("محمد التميمي", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)), Text("@m_fb2", style: TextStyle(color: Colors.black54)), SizedBox(height: 10), Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_stat("153", "متابع"), _stat("4217", "متابعون"), _stat("106 ألف", "إعجاب")])]))]),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("تابعني راح اشوفك هواي شغلات حلوة\nكوميدي، تحشيش، الشهر الأول 😂", textAlign: TextAlign.center)),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Row(children: [Expanded(child: GestureDetector(onTap: () { setState(() { isFollowing = !isFollowing; }); showMsg(isFollowing ? "تمت المتابعة" : "تم إلغاء المتابعة"); }, child: Container(padding: EdgeInsets.symmetric(vertical: 10), decoration: BoxDecoration(color: isFollowing ? Colors.grey[200] : Colors.red, borderRadius: BorderRadius.circular(8)), child: Center(child: Text(isFollowing ? "Following" : "Follow", style: TextStyle(color: isFollowing ? Colors.black : Colors.white, fontWeight: FontWeight.bold)))))), SizedBox(width: 8), Expanded(child: GestureDetector(onTap: () => showMsg("سجل المشاهدة"), child: Container(padding: EdgeInsets.symmetric(vertical: 10), decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)), child: Center(child: Text("سجل المشاهدة"))))))])),
            SizedBox(height: 12),
            SizedBox(height: 80, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: highlights.length, itemBuilder: (context, index) { final h = highlights[index]; return Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: GestureDetector(onTap: () => showMsg("ستوري ${h["label"]}"), child: Column(children: [Container(width: 55, height: 55, decoration: BoxDecoration(color: h["color"], shape: BoxShape.circle), child: Center(child: Text(h["label"][0], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)))), SizedBox(height: 4), Text(h["label"])]))); })),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [IconButton(icon: Icon(Icons.grid_on, color: selectedTab == 0 ? Colors.black : Colors.grey), onPressed: () { setState(() { selectedTab = 0; }); }), IconButton(icon: Icon(Icons.favorite_border, color: selectedTab == 1 ? Colors.black : Colors.grey), onPressed: () { setState(() { selectedTab = 1; }); showMsg("الإعجابات"); }), IconButton(icon: Icon(Icons.repeat, color: selectedTab == 2 ? Colors.black : Colors.grey), onPressed: () { setState(() { selectedTab = 2; }); showMsg("إعادة النشر"); })]),
            Divider(),
            GridView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1, childAspectRatio: 0.75), itemCount: myVideos.length, itemBuilder: (context, index) { final video = myVideos[index]; return GestureDetector(onTap: () => showMsg("تشغيل فيديو ${index + 1}"), child: Stack(fit: StackFit.expand, children: [Container(color: video["color"], child: Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40))), Positioned(bottom: 4, left: 4, child: Row(children: [Icon(Icons.play_arrow, color: Colors.white, size: 14), Text(video["views"], style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))]))])); }),
          ],
        ),
      ),
    );
  }

  Widget _stat(String num, String label) {
    return GestureDetector(onTap: () => showMsg(label), child: Column(children: [Text(num, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text(label, style: TextStyle(color: Colors.black54, fontSize: 12))]));
  }
}
