import 'package:flutter/material.dart';
import 'package:omda_todo_app/core/utils/color.dart';
import 'package:omda_todo_app/model/todo_model.dart';

class TodoItems extends StatelessWidget {
final TodoModel todo;
final onChangeItem ;
final deleteItem ;

  const TodoItems({super.key, required this.todo,required this.onChangeItem,required this.deleteItem});
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: ListTile(
          onTap: () {
            onChangeItem(todo);
          },
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(20),
          ),
        contentPadding: const EdgeInsets.symmetric(horizontal: 20,vertical: 5),
          leading:  Icon(
            todo.isDone!   ?  Icons.check_box: Icons.check_box_outline_blank_outlined,
            color: kBlue,
          ),
          tileColor: Colors.white,
          title:  Text(
            todo.todoMessage!,
            style:  TextStyle(
              fontSize: 16,
              color: kBlack,
              decoration:todo.isDone! ? TextDecoration.lineThrough:null,
            ),
          ),
          trailing: Container(
            padding: const EdgeInsets.all(0),
            margin: const EdgeInsets.symmetric(vertical: 12),
            height: 35,
            width: 35,
            decoration: BoxDecoration(
              color: kGrey,
              borderRadius: BorderRadius.circular(5),
            ),
            child: IconButton(
              onPressed: (){
                deleteItem(todo.id);
              },
              iconSize: 18,
              color: Colors.white,
              icon:const Icon(Icons.delete) ,
            ),
          ),
        ),
    );
  }
}
