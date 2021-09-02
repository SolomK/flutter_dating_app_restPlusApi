import 'package:dating/dating/bloc/dating_bloc.dart';
import 'package:dating/dating/bloc/dating_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';


class DatingLogin extends StatelessWidget {
  static const routeName = '/';
  final emailEditingContoller = TextEditingController();
  final passwordEditingContoller = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
     
      body: BlocBuilder<DatingBloc, DatingState>(
        builder: (_, state) {
          if (state is DatingOperationFailure) {
            return Container(
                      margin: EdgeInsets.only(top: 25, left: 20, right: 20),
            child: Column(
              children: [
                TextFormField(
                  controller: emailEditingContoller,
                  decoration: InputDecoration(
                    hintText: "email",
                   
                  ),
                ),
                SizedBox(height: 10,),
                TextFormField(
                  controller: passwordEditingContoller,
                  decoration: InputDecoration(
                    hintText: "password",
                    
                  ),
                  obscureText: true,
                ),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){
                  
                 
                }, child: Text("Log in")),
                SizedBox(height: 10,),
                ElevatedButton(onPressed: (){}, child: Row(children: [Icon(Icons.email), Text("LoggIN")]), ),
                SizedBox(height: 10,)
                  
              ],
            ),
            );
          }

          if (state is DatingLoadSuccess) {
           // final dating = state.dating;

            return Container(
              

            );
          }

          return Container(
            
            child: Center(
              
              child: CircularProgressIndicator(),
            ),
          );
        },
      ),
      
    );
  }
}






