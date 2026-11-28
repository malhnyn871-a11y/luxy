import 'package:flutter/material.dart';
import 'privacy_page.dart';
import 'account_page.dart';
class SettingsPage extends StatelessWidget{
const SettingsPage({super.key});
@override Widget build(BuildContext c){
return Scaffold(backgroundColor: Colors.black,
body: ListView(children: [
ListTile(title: Text('الحساب'), onTap: () {Navigator.push(c, MaterialPageRoute(builder: (_) => const AccountPage()));}),
ListTile(title: Text('الخصوصية'), onTap: () {Navigator.push(c, MaterialPageRoute(builder: (_) => const PrivacyPage()));}),
ListTile(title: Text('تسجيل الخروج', style: TextStyle(color: Colors.red))), 
]),
);
}}
