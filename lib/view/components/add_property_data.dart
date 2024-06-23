import 'package:flutter/material.dart';
class AddPropertyData extends StatelessWidget {
  var labelTextt;
  var hintText;
  var icon;
  var onsaved;
  var validatee;
  Color primaryColor = const Color(0xff446FAF);

AddPropertyData(this.labelTextt, this.hintText, this.icon, this.validatee, this.onsaved);
  @override
  Widget build(BuildContext context) {
    return TextFormField(
                  decoration: InputDecoration(
                    
                  labelText: labelTextt,
                  labelStyle: TextStyle(color: Colors.grey, fontSize: 15),
                  hintText: hintText ,hintStyle:TextStyle(fontSize: 10,color: Colors.grey),
                  suffixIcon: Icon(icon,size: 17,color:Color(0xff446FAF),),
                  enabledBorder: UnderlineInputBorder(       
                    borderSide:BorderSide(
                      color: primaryColor,
                      width: 1,
                      ),
                    )
                  ), 
                  onSaved: onsaved,
                  validator: validatee,
                    keyboardType: TextInputType.text,
                    
    )
    ;
  }
}