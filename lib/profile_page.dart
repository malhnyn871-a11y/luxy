
class LuxyProfilePage extends StatelessWidget {
  LuxyProfilePage({super.key});

  final List<Map<String, dynamic>> myVideos = [
    {"thumbnail": "https://picsum.photos/300/400?random=1", "views": "4.8 مليون"},
    {"thumbnail": "https://picsum.photos/300/400?random=2", "views": "16.7 ألف"},
    {"thumbnail": "https://picsum.photos/300/400?random=3", "views": "1.0 ألف"},
    {"thumbnail": "https://picsum.photos/300/400?random=4", "views": "324"},
    {"thumbnail": "https://picsum.photos/300/400?random=5", "views": "309"},
    {"thumbnail": "https://picsum.photos/300/400?random=6", "views": "401"},
    {"thumbnail": "https://picsum.photos/300/400?random=7", "views": "310"},
    {"thumbnail": "https://picsum.photos/300/400?random=8", "views": "465"},
    {"thumbnail": "https://picsum.photos/300/400?random=9", "views": "2257"},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: Icon(Icons.menu, color: Colors.black),
        actions: [
          Icon(Icons.person_add_outlined, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.notifications_none, color: Colors.black),
          SizedBox(width: 12),
          Icon(Icons.edit_outlined, color: Colors.black),
          SizedBox(width: 12),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.all(12),
                  child: Stack(
                    children: [
                      CircleAvatar(radius: 45, backgroundImage: NetworkImage("https://picsum.photos/200/200?random=99")),
                      Positioned(bottom: 0, right: 0, child: Container(decoration: BoxDecoration(color: Colors.blue, shape: BoxShape.circle), child: Icon(Icons.add, color: Colors.white, size: 20))),
                    ],
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text("محمد التميمي", style: TextStyle(color: Colors.black, style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold)),
                      Text("@m_fb2", style: TextStyle(color: Colors.grey)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          _stat("153", "متابع"),
                          _stat("4217", "متابعون"),
                          _stat("106 ألف", "تسجيلات الإعجاب"),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(padding: EdgeInsets.symmetric(horizontal: 12), child: Text("تابعني راح اشوفك هواي شغلات حلوة\nكوميدي، تحشيش، الشهر الأول 😂", textAlign: TextAlign.center)),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)), child: Center(child: Text("تعديل الملف الشخصي")))),
                  SizedBox(width: 8),
                  Expanded(child: Container(padding: EdgeInsets.symmetric(vertical: 8), decoration: BoxDecoration(color: Colors.grey[200], borderRadius: BorderRadius.circular(8)), child: Center(child: Text("سجل المشاهدة")))),
                ],
              ),
            ),
            SizedBox(height: 10),
            Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [Icon(Icons.grid_on, color: Colors.black), Icon(Icons.favorite_border, color: Colors.grey), Icon(Icons.repeat, color: Colors.grey), Icon(Icons.lock_outline, color: Colors.grey), Icon(Icons.menu, color: Colors.grey)]),
            Divider(),
            GridView.builder(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 3, crossAxisSpacing: 1, mainAxisSpacing: 1, childAspectRatio: 0.75),
              itemCount: myVideos.length,
              itemBuilder: (context, index) {
                final video = myVideos[index];
                return Stack(
                  fit: StackFit.expand,
                  children: [
                    Image.network(video["thumbnail"], fit: BoxFit.cover),
                    Positioned(bottom: 4, left: 4, child: Row(children: [Icon(Icons.play_arrow, color: Colors.white, size: 14), Text(video["views"], style: TextStyle(color: Colors.white, fontSize: 11, fontWeight: FontWeight.bold))])),
                  ],
                );
              },
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        selectedItemColor: Colors.black,
        unselectedItemColor: Colors.grey,
        items: [
          BottomNavigationBarItem(icon: Icon(Icons.home), label: "الرئيسية"),
          BottomNavigationBarItem(icon: Icon(Icons.language), label: "الملك"),
          BottomNavigationBarItem(icon: Icon(Icons.add_circle, size: 38, color: Colors.black), label: ""),
          BottomNavigationBarItem(icon: Icon(Icons.inbox), label: "صندوق الوارد"),
          BottomNavigationBarItem(icon: Icon(Icons.person), label: "الملف الشخصي"),
        ],
      ),
    );
  }

  Widget _stat(String num, String label) {
    return Column(children: [Text(num, style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)), Text(label, style: TextStyle(color: Colors.grey, fontSize: 12))]);
  }
}
