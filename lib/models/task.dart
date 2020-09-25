class Task {
  String name;
  bool isdone;
  Task({this.name,this.isdone});
  void toggle (){
    isdone = !isdone;
  }
}
