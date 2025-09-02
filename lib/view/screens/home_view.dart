import 'package:flutter/material.dart';
import 'package:todo_app/helper/color.dart';
import 'package:todo_app/helper/textForm.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:todo_app/controller/todo_cubit.dart';
import 'package:todo_app/controller/todo_state.dart';
import 'package:todo_app/view/widgets/custom_app_bar.dart';
import 'package:todo_app/view/widgets/custom_elevated_btn.dart';

class HomeView extends StatelessWidget {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    var cubit = BlocProvider.of<TodoCubit>(context);
    return BlocConsumer<TodoCubit, TodoState>(
      listener: (context, state) {},
      builder: (context, state) {
        return Scaffold(
          appBar: const Customappbar(title: 'Add Task'),
          body: Column(
            children: [
              //! My FLage
              _myFlage(context),
              const SizedBox(height: 10),
              //! Body
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    children: [
                      //! TextField
                      _textField(cubit),
                      const SizedBox(height: 15),
                      //! Add Task Btn
                      _addTaskBtn(cubit),
                      const SizedBox(height: 15),
                      //! Tasks List
                      _taskListView(cubit, state),
                    ],
                  ),
                ),
              ),
            ],
          ),
        );
      },
    );
  }

  Expanded _taskListView(TodoCubit cubit, TodoState state) {
    return Expanded(
      child: ListView.builder(
        itemCount: state.tasks.length,
        itemBuilder: (context, index) {
          final task = state.tasks[index];
          if (state.tasks.isEmpty) {
            return _empityBody();
          }
          return ListTile(
            //! Check Box
            leading: Checkbox(
              value: task["isDone"],
              onChanged: (value) {
                cubit.toggleTask(index, value ?? false);
              },
            ),
            //! Task
            title: Text(
              task["title"],
              style: TextStyle(
                decoration: task["isDone"] ? TextDecoration.lineThrough : null,
              ),
            ),
            //! Delet btn
            trailing: IconButton(
              onPressed: () => cubit.deleteTask(index),
              icon: Icon(Icons.delete),
              color: Colors.red,
            ),
          );
        },
      ),
    );
  }

  Widget _empityBody() => Text('No Tasks Added Yet');

  TextField _textField(TodoCubit cubit) {
    return TextField(
      controller: cubit.controller,
      decoration: InputDecoration(
        filled: true,
        fillColor: AppColors.scaffoldColor,
        hintText: 'Enter Your Task',
        border: TextForm.outlineInputBorder,
      ),
    );
  }

  ElvButton _addTaskBtn(TodoCubit cubit) {
    return ElvButton(
      onpress: () {
        cubit.addTask(cubit.controller.text);
        cubit.controller.clear();
      },
      textData: 'Add Task',
    );
  }

  Container _myFlage(BuildContext context) {
    return Container(
      clipBehavior: Clip.antiAliasWithSaveLayer,
      width: 261,
      height: MediaQuery.of(context).size.height * .25,
      decoration: BoxDecoration(borderRadius: BorderRadius.circular(20)),
      child: Image.asset('assets/image/pro.png', fit: BoxFit.cover),
    );
  }
}
