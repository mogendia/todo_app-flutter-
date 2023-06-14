class TodoModel{
  String? id;
  String? todoMessage;
  bool? isDone;

  TodoModel({
    required this.id,
    required this.todoMessage,
     this.isDone= false,
});
  static List<TodoModel> todoList(){
    return [
    TodoModel(id:'01',todoMessage: 'First task',isDone:true),
    TodoModel(id:'02',todoMessage: 'break fast at 11 am',isDone:true),
    TodoModel(id:'03',todoMessage: 'pray duhr at 1 pm',),
    TodoModel(id:'04',todoMessage: 'dinner at 4 pm',),
    TodoModel(id:'05',todoMessage: 'sleep at 12 am',isDone:true),
    ];
  }
}