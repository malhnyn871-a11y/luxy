import 'package:flutter/material.dart';
class PrivacyPage extends StatelessWidget{
const PrivacyPage({super.key});
@override Widget build(BuildContext c){
return Scaffold(backgroundColor: Colors.black,
body: ListView(children: [
ListTile(title: Text('حساب خاص')),
ListTile(title: Text('من يستطيع رؤية فيديوهاتي')),
ListTile(title: Text('طلبات المراسلة - الكل يراسلني')),
]),
);
}}
