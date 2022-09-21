import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/helper/data_helper.dart';

class HarfDropdownwidget extends StatefulWidget {
  final Function onHarfSecildi;
  HarfDropdownwidget({required this.onHarfSecildi, Key? key}) : super(key: key);
  
  @override
  State<HarfDropdownwidget> createState() => _HarfDropdownwidgetState();
}

class _HarfDropdownwidgetState extends State<HarfDropdownwidget> {
  double secilenHarfDegeri = 4;
  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      padding: Sabitler.dropDowmPadding, 
      decoration: BoxDecoration(
        color: Sabitler.anaRenk.shade100.withOpacity(0.3),
        borderRadius: Sabitler.borderRadius
      ),
      child: DropdownButton<double>(
        value: secilenHarfDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger){
          setState(() {
            secilenHarfDegeri = deger!;
            widget.onHarfSecildi(secilenHarfDegeri);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinHarfleri(),
      ),
    );
  }
}