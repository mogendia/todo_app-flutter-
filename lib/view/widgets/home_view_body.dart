import 'package:flutter/material.dart';
import 'package:omda_todo_app/core/utils/color.dart';
import 'package:omda_todo_app/model/todo_model.dart';
import 'package:omda_todo_app/view/widgets/image_widget.dart';
import 'todo_item.dart';

class HomeViewBody extends StatefulWidget {
  const HomeViewBody({super.key});

  @override
  State<HomeViewBody> createState() => _HomeViewBodyState();
}

class _HomeViewBodyState extends State<HomeViewBody> {
  var todoList = TodoModel.todoList();
  final todoController = TextEditingController();
  List<TodoModel> search = [];

  @override
  void initState() {
    search=todoList;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kBGColor,
      appBar: buildAppBar(),
      body: Stack(
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 25),
            child: Column(
              children: [
                 searchBox(),
                Expanded(
                  child: ListView(
                    children: [
                      Container(
                        padding: const EdgeInsets.only(top: 50, bottom: 20),
                        child: const Text(
                          'All Tasks',
                          style: TextStyle(
                            fontSize: 30,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                      ),
                      for (TodoModel todo in search.reversed)
                        TodoItems(
                          todo: todo,
                          onChangeItem: onChanged,
                          deleteItem: deleteTask,
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Row(
              children: [
                Expanded(
                  child: Container(
                    margin:
                        const EdgeInsets.only(left: 20, right: 20, bottom: 20),
                    padding:
                        const EdgeInsets.symmetric(vertical: 5, horizontal: 20),
                    decoration: BoxDecoration(
                      color: Colors.white,
                      boxShadow: const [
                        BoxShadow(
                            color: Colors.white,
                            blurRadius: 10,
                            offset: Offset(0, 0)),
                      ],
                      borderRadius: BorderRadius.circular(10),
                    ),
                    child: TextField(
                      controller: todoController,
                      decoration: const InputDecoration(
                        hintText: 'Add a new task',
                        border: InputBorder.none,
                      ),
                    ),
                  ),
                ),
                Container(
                  padding: const EdgeInsets.only(
                    right: 20,
                    bottom: 20,
                  ),
                  child: ElevatedButton(
                    onPressed: () {
                      addTask(todoController.text);
                    },
                    style: ElevatedButton.styleFrom(
                        backgroundColor: kBlue,
                        minimumSize: const Size(50, 50),
                        elevation: 10),
                    child: const Icon(Icons.add),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    );
  }

  AppBar buildAppBar() {
    return AppBar(
      elevation: 0,
      backgroundColor: Colors.white,
      title: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: const [
          Icon(
            Icons.menu,
            size: 30,
            color: Colors.black,
          ),
          ImageWidget(),
        ],
      ),
    );
  }
  Widget searchBox(){
    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(20),
      ),
      child:  TextField(
        onChanged: (value)=> searchTask(value),
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.all(0),
            prefixIcon: Icon(Icons.search,color: Colors.black,),
            prefixIconConstraints: BoxConstraints(
              maxHeight: 20,
              maxWidth: 25,
            ),
            border: InputBorder.none,
            hintText: 'Search',
            hintStyle: TextStyle(
                color: kBlack
            )
        ),
      ),
    );
}

  void onChanged(TodoModel todo) {
    setState(() {
      todo.isDone = !todo.isDone!;
    });
  }

  void deleteTask(String id) {
    setState(() {
      todoList.removeWhere((item) => item.id == id);
    });
  }

  void addTask(String todo) {
    setState(() {
      todoList.add(TodoModel(
        id: DateTime.now().toString(),
        todoMessage: todo,
      ));
    });
    todoController.clear();
  }
  void searchTask(String text) {
    List<TodoModel> results = [];
    if (text.isEmpty) {
      results = todoList;
    } else {
      results = todoList
          .where((item) =>
          item.todoMessage!.
          toLowerCase().
          contains(text.toLowerCase()))
          .toList();
    }
    setState(() {
      search=results;
    });
  }

}
