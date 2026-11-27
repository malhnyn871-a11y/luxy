import 'package:flutter/material.dart';

class LuxyProfilePage extends StatefulWidget {
  LuxyProfilePage({super.key});
  @override
  State<LuxyProfilePage> createState() => _LuxyProfilePageState();
}

class _LuxyProfilePageState extends State<LuxyProfilePage> {
  bool isFollowing = false;

  void showMsg(String msg) {
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text(msg),
        duration: Duration(seconds: 1),
      ),
    );
  }

  Widget highlightCircle(String label, Color color) {
    return GestureDetector(
      onTap: () => showMsg("ستوري $label"),
      child: Padding(
        padding: EdgeInsets.symmetric(horizontal: 8),
        child: Column(
          children: [
            Container(
              width: 55,
              height: 55,
              decoration: BoxDecoration(
                color: color,
                shape: BoxShape.circle,
              ),
              child: Center(
                child: Text(
                  label[0],
                  style: TextStyle(
                    color: Colors.white,
                    fontWeight: FontWeight.bold,
                    fontSize: 20,
                  ),
                ),
              ),
            ),
            SizedBox(height: 4),
            Text(label, style: TextStyle(fontSize: 12)),
          ],
        ),
      ),
    );
  }

  Widget videoBox(Color color, String views, int index) {
    return GestureDetector(
      onTap: () => showMsg("تشغيل فيديو $index"),
      child: Stack(
        fit: StackFit.expand,
        children: [
          Container(color: color),
          Center(
            child: Icon(
              Icons.play_circle_fill,
              color: Colors.white,
              size: 40,
            ),
          ),
          Positioned(
            bottom: 4,
            left: 4,
            child: Row(
              children: [
                Icon(Icons.play_arrow, color: Colors.white, size: 14),
                Text(
                  views,
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 11,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.menu, color: Colors.black),
          onPressed: () => showMsg("القائمة"),
        ),
        actions: [
          IconButton(
            icon: Icon(Icons.person_add_outlined, color: Colors.black),
            onPressed: () => showMsg("اضافة صديق"),
          ),
          IconButton(
            icon: Icon(Icons.notifications_none, color: Colors.black),
            onPressed: () => showMsg("التنبيهات"),
          ),
          IconButton(
            icon: Icon(Icons.edit_outlined, color: Colors.black),
            onPressed: () => showMsg("تعديل الملف"),
          ),
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
                  child: GestureDetector(
                    onTap: () => showMsg("تغيير الصورة"),
                    child: Stack(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          decoration: BoxDecoration(
                            color: Colors.grey[300],
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.red, width: 3),
                          ),
                          child: Center(
                            child: Text(
                              "م",
                              style: TextStyle(fontSize: 40, fontWeight: FontWeight.bold),
                            ),
                          ),
                        ),
                        Positioned(
                          bottom: 0,
                          right: 0,
                          child: Container(
                            decoration: BoxDecoration(
                              color: Colors.blue,
                              shape: BoxShape.circle,
                            ),
                            child: Icon(Icons.add, color: Colors.white, size: 20),
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8),
                      Text(
                        "محمد التميمي",
                        style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
                      ),
                      Text("@m_fb2", style: TextStyle(color: Colors.black54)),
                      SizedBox(height: 10),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          GestureDetector(
                            onTap: () => showMsg("قائمة المتابعين"),
                            child: Column(
                              children: [
                                Text("153", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text("متابع", style: TextStyle(color: Colors.black54, fontSize: 12)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => showMsg("قائمة المتابعين"),
                            child: Column(
                              children: [
                                Text("4217", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text("متابعون", style: TextStyle(color: Colors.black54, fontSize: 12)),
                              ],
                            ),
                          ),
                          GestureDetector(
                            onTap: () => showMsg("قائمة الاعجابات"),
                            child: Column(
                              children: [
                                Text("106 الف", style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16)),
                                Text("اعجاب", style: TextStyle(color: Colors.black54, fontSize: 12)),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Text(
                "تابعني راح اشوفك هواي شغلات حلوة",
                textAlign: TextAlign.center,
              ),
            ),
            SizedBox(height: 8),
            Padding(
              padding: EdgeInsets.symmetric(horizontal: 12),
              child: Row(
                children: [
                  Expanded(
                    child: GestureDetector(
                      onTap: () {
                        setState(() {
                          isFollowing = !isFollowing;
                        });
                        showMsg(isFollowing ? "تمت المتابعة" : "تم الغاء المتابعة");
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: isFollowing ? Colors.grey[200] : Colors.red,
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(
                          child: Text(
                            isFollowing ? "Following" : "Follow",
                            style: TextStyle(
                              color: isFollowing ? Colors.black : Colors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 8),
                  Expanded(
                    child: GestureDetector(
                      onTap: () => showMsg("سجل المشاهدة"),
                      child: Container(
                        padding: EdgeInsets.symmetric(vertical: 10),
                        decoration: BoxDecoration(
                          color: Colors.grey[200],
                          borderRadius: BorderRadius.circular(8),
                        ),
                        child: Center(child: Text("سجل المشاهدة")),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 12),
            SizedBox(
              height: 80,
              child: ListView(
                scrollDirection: Axis.horizontal,
                children: [
                  highlightCircle("سفر", Colors.orange),
                  highlightCircle("طعام", Colors.pink),
                  highlightCircle("ازياء", Colors.purple),
                  highlightCircle("يوميات", Colors.blue),
                  highlightCircle("رياضة", Colors.green),
                ],
              ),
            ),
            SizedBox(height: 10),
            Divider(),
            GridView.count(
              shrinkWrap: true,
              physics: NeverScrollableScrollPhysics(),
              crossAxisCount: 3,
              crossAxisSpacing: 1,
              mainAxisSpacing: 1,
              childAspectRatio: 0.75,
              children: [
                videoBox(Colors.red, "4.8 مليون", 1),
                videoBox(Colors.pink, "16.7 الف", 2),
                videoBox(Colors.purple, "1.0 الف", 3),
                videoBox(Colors.deepPurple, "324", 4),
                videoBox(Colors.blue, "309", 5),
                videoBox(Colors.lightBlue, "401", 6),
                videoBox(Colors.orange, "310", 7),
                videoBox(Colors.teal, "465", 8),
                videoBox(Colors.green, "2257", 9),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
