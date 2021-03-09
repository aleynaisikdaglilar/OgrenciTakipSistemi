import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';

class StudentAdd extends StatefulWidget{
  List<Student> students;
  //StudentAdd(List<Student> students){
    //this.students=students;
  //}
  StudentAdd(this.students);
  @override
  State<StatefulWidget> createState() {
    return _StudentAddState();
  }

}

class _StudentAddState extends State<StudentAdd>{
  var formKey=GlobalKey<FormState>();
  var student = Student("","",0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Yeni öğrenci"),),
      body: Container(
        margin: EdgeInsets.all(20.0),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              buildFirstNameField(),
              buildLastNameField(),
              buildGradeField(),
              BuildSubmitButton()
            ],
          ),
        ),
      ),
    );

  }

  buildFirstNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci adı",hintText: "Melih"),
      onSaved: (String value){
      student.firstName=value;
      },
    );
  }
  buildLastNameField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Öğrenci soyadı",hintText: "Kurtalan"),
      onSaved: (String value){
        student.lastName=value;
      },
    );
  }
  buildGradeField() {
    return TextFormField(
      decoration: InputDecoration(labelText: "Aldığı not",hintText: "65"),
      onSaved: (String value){
        student.grade=int.parse(value);
      },
    );
  }
  Widget BuildSubmitButton(){
    return RaisedButton(
      child: Text("Kaydet"),
      onPressed: (){
      formKey.currentState.save();
      widget.students.add(student);
      Navigator.pop(context);
      },
    );
  }
}