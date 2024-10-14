import 'package:flutter/material.dart';
import 'package:crud_app/excercisemodal/modal.dart';
class AddExcercise extends StatefulWidget {
  const AddExcercise({super.key});

  @override
  State<AddExcercise> createState() => _AddExcerciseState();
}

class _AddExcerciseState extends State<AddExcercise> {
  @override
  Widget build(BuildContext context) {
   final formkey = GlobalKey<FormState>();
   void _saveitem (){
    formkey.currentState!.validate();
   }
    return Scaffold(
      appBar: AppBar(title: Text('add new excercise'),
      ),
      body: Padding(padding: EdgeInsets.all(12),
      child: Form(
        key: formkey,
      child: Column(
      children: [
        TextFormField(
          maxLength: 50,
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            label: Text('excercise name')
          ),
         validator: (value) {
            if (value==null || value.isEmpty || value.trim().length <= 1 || value.trim().length>=50) {
             return 'must be between 1 and 50 charracters';
            }
          return null;
         }, 
        ),
      Row(
        children: [
          Expanded(
            child: TextFormField(
              decoration: InputDecoration(
                border: OutlineInputBorder(),
                label: Text('goaltime'),
              ),
              keyboardType: TextInputType.numberWithOptions(),
                validator: (value) {
            if (value==null ||
             value.isEmpty ||
              int.tryParse(value)==null ||
             int.tryParse(value)! <= 1 ||
             int.tryParse(value)! >=25
              ) {
             return'must be between 1 and 24 hours';
            }
          return null;
         }, 
              initialValue: '1',
            ),
          ),
          SizedBox(width: 8,),
          Expanded(
            child: DropdownButtonFormField(items:  [
              for (final category in Category.values)
             DropdownMenuItem(
                 value: category,
               child: Text(category.toString().split('.').last),
               ),
             ],
          onChanged: (value) {
                  
            },
            ),
          )
        ],
      ),
       

      Row(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [TextButton(onPressed: _saveitem,
         child:const Text('save')),
      ElevatedButton(onPressed:() {
        formkey.currentState!.reset();
      },
       child:const Text('reset'))
      ],)
      ],
      )
      ),
      ), 
      );
  }
}