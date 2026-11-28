import 'package:flutter/material.dart';
class AccountPage extends StatelessWidget{
const AccountPage({super.key});
@override Widget build(BuildContext c){
return Scaffold(backgroundColor: Colors.black,
body: ListView(children: [
ListTile(title: Text('تغيير كلمة السر')),
ListTile(title: Text('إضافة رقم هاتف')),
ListTile(title: Text('حذف الحساب', style: TextStyle(color: Colors.red))),
]),
);
}}
