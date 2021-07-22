import 'package:flutter/material.dart';

class Button extends StatelessWidget {
  final String title;  
  final bool? isLoading;
  final Function onPress;

  const Button({ 
    required this.title,
    required this.onPress,
    this.isLoading,    
  });

  @override
  Widget build(BuildContext context) {
    return TextButton(                
      style: ButtonStyle(        
        backgroundColor: MaterialStateProperty.all<Color>(Colors.blue),
        padding: MaterialStateProperty.all<EdgeInsetsGeometry>(EdgeInsets.all(16.0))
      ),
      onPressed: () { 
        this.onPress();
      },
      child: Row(        
        mainAxisAlignment: MainAxisAlignment.center,      
        children: [
          if (this.isLoading != null && this.isLoading == true)
            Padding(
              padding: const EdgeInsets.only(right: 15),
              child: SizedBox(
                width: 24,
                height: 24,                
                child: CircularProgressIndicator(
                  backgroundColor: Colors.blue,
                  strokeWidth: 3.0,
                  valueColor: new AlwaysStoppedAnimation<Color>(Colors.white)
                ),
              ),
            ),
          Text(
            title,
            style: TextStyle(
              color: Colors.white,
              fontSize: 16
            ),
          )
        ]
      ) ,
    );
  }
}