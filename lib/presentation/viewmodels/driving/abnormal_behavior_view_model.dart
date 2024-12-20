import 'package:flutter/cupertino.dart';

class AbnormalBehaviorViewModel extends ChangeNotifier{
   final List<Widget> _abnormalBehaviorState = [];

   List<Widget> get abnormalBehaviorState => _abnormalBehaviorState;

   void addAbnormalBehaviorState(Widget state){
     _abnormalBehaviorState.add(state);
     notifyListeners();
   }

   void removeAbnormalBehaviorState(){
     _abnormalBehaviorState.clear();
     notifyListeners();
   }
}