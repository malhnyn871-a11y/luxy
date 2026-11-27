import 'package:flutter/material.dart';

class LuxyProfilePage extends StatelessWidget {
  const LuxyProfilePage({super.key});

  final List<Map<String, dynamic>> highlights = [
    {"label": "سفر", "color": Colors.orange},
    {"label": "طعام", "color": Colors.pink},
    {"label": "أزياء", "color": Colors.purple},
    {"label": "يوميات", "color": Colors.blue},
    {"label": "رياضة", "color": Colors.green},
  ];

  final List<Map<String, dynamic>> myVideos = [
    {"thumbnail": "https://picsum.photos/300/400?random=1", "views": "4.8 مليون", "color": Colors.red},
    {"thumbnail": "https://picsum.photos/300/400?random=2", "views": "16.7 ألف", "color": Colors.pink},
    {"thumbnail": "https://picsum.photos/300/400?random=3", "views": "1.0 ألف", "color": Colors.purple},
    {"thumbnail": "https://picsum.photos/300/400?random=4", "views": "324", "color": Colors.deepPurple},
    {"thumbnail": "https://picsum.photos/300/400?random=5", "views": "309", "color": Colors.blue},
    {"thumbnail": "https://picsum.photos/300/400?random=6", "views": "401", "color": Colors.lightBlue},
    {"thumbnail": "https://picsum.photos/300/400?random=7", "views": "310", "color": Colors.orange},
    {"thumbnail": "https://picsum.photos/300/400?random=8", "views": "465", "color": Colors.teal},
    {"thumbnail": "https://picsum.photos/300/400?random=9", "views": "2257", "color": Colors.green},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(backgroundColor: Colors.white, elevation: 0, leading: Icon(Icons.menu, color: Colors.black), actions: [Icon(Icons.person_add_outlined, color: Colors.black), SizedBox(width: 12), Icon(Icons.notifications_none, color: Colors.black), SizedBox(width: 12), Icon(Icons.edit_outlined, color: Colors.black), SizedBox(width: 12)]),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(padding: EdgeInsets.all(12), child: Stack(children: [Container(width: 90, height: 90, decoration: BoxDecoration(color: Colors.grey[300], shape: BoxShape.circle, border: Border.all(color: Colors.red, width: 3)), child: Center(child: Text("م", style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold, color: Colors.black)))), Positioned(bottom: 0, right: 0, child: Container(decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle), child: Icon(Icons.add, color: Colors.white, size: 20)))])),
                Expanded(child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: [SizedBox(height: 8), Text("محمد التميمي", style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold, color: Colors.black)), Text("@m_fb2", style: TextStyle(color: Colors.black54)), SizedBox(height: 10), Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [_stat("153", "متابع"), _stat("4217", "متابعون"), _stat("106 ألف", "إعجاب")])])),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("تابعني راح اشوفك هواي شغلات حلوة\nكوميدي، تحشيش، الشهر الأول 😂", textAlign: TextAlign.center, style: TextStyle(color: Colors.black))),
            SizedBox(height: 8),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Row(children: [Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: Colors.red, borderRadius: BorderRadius.circular(8)), child: Center(child: Text("Follow", style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold))))), SizedBox(width: 8), Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)), child: Center(child: Text("سجل المشاهدة", style: TextStyle(color: Colors.black)))))])),
            SizedBox(height: 12),
            SizedBox(height: 80, child: ListView.builder(scrollDirection: Axis.horizontal, itemCount: highlights.length, itemBuilder: (context, index) { final h = highlights[index]; return Padding(padding: EdgeInsets.symmetric(horizontal: 8), child: Column(children: [Container(width: 55, height: 55, decoration: BoxDecoration(color: h["color"], shape: BoxShape.circle, border: Border.all(color: Colors.grey[300]!, width: 2)), child: Center(child: Text(h["label"][0], style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold, fontSize: 20)))), SizedBox(height: 4), Text(h["label"], style: TextStyle(color: Colors.black, fontSize: 12))])); })),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Icon(Icons.grid_on, color: Colors.black), Icon(Icons.favorite_border, color: Colors.grey), Icon(Icons.repeat, color: Colors.grey), Icon(Icons.lock_outline, color: Colors.grey), Icon(Icons.menu, color: Colors.grey)]),
            Divider(),
            GridView.builder(shrinkWrap: true, physics: NeverScrollableScrollPhysics(), gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1, childAspectRatio: 0.75), itemCount: myVideos.length, itemBuilder: (context, index) { final video = myVideos[index]; return Stack(fit: StackFit.expand, children: [Container(color: video["color"]), Image.network(video["thumbnail"], fit: BoxFit.cover, errorBuilder: (context, error, stack) { return Container(color: video["color"], child: Center(child: Icon(Icons.play_circle_fill, color: Colors.white, size: 40))); }), Positioned(bottom: 4, left: 4, child: Row(children: [Icon(Icons.play_arrow, color: Colors.white, size: 14), Text(video["views"], style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))]))]); }),
          ],
        ),
      ),
    );
  }

  Widget _stat(String num, String label) {
    return Column(children: [Text(num, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16, color: Colors.black)), Text(label, style: TextStyle(color: Colors.black54, fontSize: 12))]);
  }
}
