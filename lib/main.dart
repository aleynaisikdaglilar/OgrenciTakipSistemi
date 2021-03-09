import 'package:flutter/material.dart';
import 'package:ogrenci_takip_sistemi/models/student.dart';
import 'package:ogrenci_takip_sistemi/screens/student_add.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(home: HomeScreen());
  }
}
class HomeScreen extends StatefulWidget{
  @override
  State<StatefulWidget> createState() {
    return _HomeScreen();
  }

}
class _HomeScreen extends State {
  List<Student> students = [
    Student.withId(1, "Can", "Işık", 95),
    Student.withId(2, "Kerem", "Karaca", 45),
    Student.withId(3, "Burak", "Dağlı", 25)
  ];
  Student selectedStudent=Student.withId(0, "Hiç kimse", "",0);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Öğrenci Takip Sistemi"),
        ),
        body: buildBody());
  }

  Widget buildBody() {
    return Column(
      children: [
        Expanded(
          child: ListView.builder(
              itemCount: students.length,
              itemBuilder: (BuildContext context, int index) {
                return ListTile(
                  title: Text(students[index].firstName+" "+students[index].lastName),
                  subtitle: Text("Sınavdan aldığı not: " + students[index].grade.toString()+" ["+students[index].getStatus+"]"),
                  leading: CircleAvatar(
                    backgroundImage: NetworkImage('https://static.thenounproject.com/png/990460-200.png'),
                  ),
                    trailing: buildStatusIcon(students[index].grade),
                onTap: (){
                    setState(() {
                      this.selectedStudent=students[index];
                    });
                    print(selectedStudent.firstName);
                },
                  onLongPress: (){
                    print("Uzun basıldı");
                  },
                );
              }),
        ),
        Text("Seçili öğrenci "+ selectedStudent.firstName),
        Row(
          children: [
            Flexible(
              fit: FlexFit.tight,
              flex:2,
              child:RaisedButton(
                color: Colors.greenAccent,
                child:Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Yeni öğrenci")
                  ],
                ),
                onPressed: (){
                  Navigator.push(context, MaterialPageRoute(builder: (context)=>StudentAdd(students)),).then((value) => setState((){}));
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex:2,
              child:RaisedButton(
                color: Colors.black12,
                child:Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Güncelle")
                  ],
                ),
                onPressed: (){
                  print("Güncelle");
                },
              ),
            ),
            Flexible(
              fit: FlexFit.tight,
              flex:1,
              child:RaisedButton(
                color: Colors.amberAccent,
                child:Row(
                  children: [
                    Icon(Icons.add),
                    SizedBox(width: 5.0,),
                    Text("Sil")
                  ],
                ),
                onPressed: (){
                  print("Sil");
                },
              ),
            )
          ],
        )
      ],
    );
  }

  Widget buildStatusIcon(int grade) {
    if(grade>=50){
        return Icon(Icons.done);
      }else if(grade>=40){
      return Icon(Icons.album);
    }else{
      return Icon(Icons.clear);
    }
  }
}
