import 'package:flutter/material.dart';
import 'package:super_28/global.dart';

class DealerIcon extends StatelessWidget {
  const DealerIcon({ Key? key }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Stack(
      // fit: StackFit.expand,
      children: [
      Container(
        height: dealerIconSize,
        width: dealerIconSize,
        decoration: BoxDecoration(
        color: Colors.grey.shade700,
          borderRadius: const BorderRadius.all(Radius.circular(50))
        ),
        
      ),
      
      Padding(
        padding: const EdgeInsets.all(7),
        child: Container(
          height: .74 * dealerIconSize,
          width: .74 * dealerIconSize,
          decoration: const BoxDecoration(
            color: Colors.black,
            borderRadius: BorderRadius.all(Radius.circular(40))
        ),
        ),
      ),

       Positioned.fill(
        child: Align(
          alignment: Alignment.center,
          child: Text(
            'DEALER',
            textAlign: TextAlign.center,
            style: TextStyle(color: Colors.grey[400],
            // fontWeight: FontWeight.bold,
            fontSize: .18 * dealerIconSize),
          ),
        ),
      )
    ],);
  }
}