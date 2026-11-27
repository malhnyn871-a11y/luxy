import 'package:flutter/material.dart';

class LuxyProfilePage extends StatefulWidget {
  LuxyProfilePage({super.key});
  @override
  State<LuxyProfilePage> createState() => _LuxyProfilePageState();
}

class _LuxyProfilePageState extends State<LuxyProfilePage> {
  bool isFollowing = false;

  void showMsg(String m) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(m), duration: Duration(seconds: 1)));
  }

  final List<Map<String, dynamic>> highlights = [
    {"label": "سفر", "letter": "س", "color": Colors.orange},
    {"label": "طعام", "letter": "ط", "color": Colors.pink},
    {"label": "أزياء", "letter": "أ", "color": Colors.purple},
    {"label": "يوميات", "letter": "ي", "color": Colors.blue},
    {"label": "رياضة", "letter": "ر", "color": Colors.green},
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

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: IconButton(icon: Icon(Icons.menu, color: Colors.black), onPressed: () => showMsg("القائمة")), actions: [IconButton(icon: Icon(Icons.person_add_outlined, color: Colors.black), onPressed: () => showMsg("اضافة صديق")), IconButton(icon: Icon(Icons.notifications_none, color: Colors.black), onPressed: () => showMsg("الاشعارات")), IconButton(icon: Icon(Icons.edit_outlined, color: Colors.black), onPressed: () => showMsg("تعديل"))]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(12), child: Stack(children: [Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle, border: Border.all(color: Colors.red, width: 3)), child: Center(child: Text("م", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)))), Positioned(bottom: 0, right: 0, child: GestureDetector(onTap: () => showMsg("تغيير الصورة"), child: Container(decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle), child: Icon(Icons.add, color: Colors.white, size: 20))))])),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 8), Text("محمد التميمي", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)), Text("@m_fb2", style: TextStyle(color: Colors.black54)), SizedBox(height: 10), Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_stat("153", "متابع"), _stat("4217", "متابعون"), _stat("106 ألف", "إعجاب")])])),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("تابعني راح اشوفك هواي شغلات حلوة\nكوميدي، تحشيش، الشهر الأول 😂", textAlign: TextAlign.center, style: TextStyle(color: Colors.black))),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Row(children: [Expanded(child: GestureDetector(onTap: () { setState(() { isFollowing = !isFollowing; }); showMsg(isFollowing ? "تمت المتابعة" : "تم الغاء المتابعة"); }, child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: isFollowing ? Colors.grey[300] : Colors.red, borderRadius: BorderRadius.circular(8)), child: Center(child: Text(isFollowing ? "Following" : "Follow", style: TextStyle(color: isFollowing ? Colors.black : Colors.white, fontWeight: FontWeight.bold)))))), SizedBox(width: 8), Expanded(child: GestureDetector(onTap: () => showMsg("سجل المشاهدة"), child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)), child: Center(child: Text("سجل المشاهدة", style: TextStyle(color: Colors.black))))))])),
            SizedBox(height: 12),
            SizedBox(height: 80, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: highlights.length, itemBuilder: (context, index) { final h = highlights[index]; return GestureDetector(onTap: () => showMsg("ستوري ${h["label"]}"), child: Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Column(children: [Container(width: 55, height: 55, decoration: BoxDecoration(color: h["color"], shape: BoxShape.circle, border: Border.all(color: Colors.grey[300]!, width: 2)), child: Center(child: Text(h["letter"], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)))), SizedBox(height: 4), Text(h["label"], style: TextStyle(color: Colors.black, fontSize: 12))]))) })),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Icon(Icons.grid_on, color: Colors.black), Icon(Icons.favorite_border, color: Colors.grey), Icon(Icons.repeat, color: Colors.grey), Icon(Icons.lock_outline, color: Colors.grey), Icon(Icons.menu, color: Colors.grey)]),
            Divider(),
            GridView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1, childAspectRatio: 0.75), itemCount: myVideos.length, itemBuilder: (context, index) { final video = myVideos[index]; return GestureDetector(onTap: () => showMsg("تشغيل فيديو ${video["views"]}"), child: Stack(fit: StackFit.expand, children: [Container(color: video["color"]), Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40)), Positioned(bottom: 4, left: 4, child: Row(children: [Icon(Icons.play_arrow, color: Colors.white, size: 14), Text(video["views"], style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))]))])); }),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 8),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            GestureDetector(onTap: () => showMsg("الرئيسية"), child: Column(children: [Icon(Icons.home, color: Colors.grey), Text("الرئيسية", style: TextStyle(color: Colors.grey))])),
            GestureDetector(onTap: () => showMsg("الاكتشاف"), child: Column(children: [Icon(Icons.search, color: Colors.grey), Text("اكتشاف", style: TextStyle(color: Colors.grey))])),
            GestureDetector(onTap: () => showMsg("رفع"), child: Column(children: [Icon(Icons.add_box, color: Colors.grey), Text("رفع", style: TextStyle(color: Colors.grey))])),
            GestureDetector(onTap: () => showMsg("الرسائل"), child: Column(children: [Icon(Icons.inbox, color: Colors.grey), Text("الرسائل", style: TextStyle(color: Colors.grey))])),
            Column(children: [Icon(Icons.person, color: Colors.red), Text("حسابي", style: TextStyle(color: Colors.red))]),
          ],
        ),
      ),
    );
  }

  Widget _stat(String num, String label) {
    return GestureDetector(onTap: () => showMsg(label), child: Column(children: [Text(num, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)), Text(label, style: TextStyle(color: Colors.black54, fontSize: 12))]));
  }
}
