import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';

import '../constants/app_constants.dart';
import '../helper/data_helper.dart';

class KrediDropdownWidget extends StatefulWidget {
  final Function onKrediSecildi;
  const KrediDropdownWidget({required this.onKrediSecildi, Key? key}) : super(key: key);

  @override
  State<KrediDropdownWidget> createState() => _KrediDropdownWidgetState();
}

class _KrediDropdownWidgetState extends State<KrediDropdownWidget> {
     double secilenKrediDegeri = 1;
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
        value: secilenKrediDegeri,
        elevation: 16,
        iconEnabledColor: Sabitler.anaRenk.shade200,
        onChanged: (deger){
          setState(() {
            secilenKrediDegeri = deger!;
            widget.onKrediSecildi(deger);
          });
        },
        underline: Container(),
        items: DataHelper.tumDerslerinKredileri(),
      ),
    );
  }
}