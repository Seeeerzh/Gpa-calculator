
import 'package:flutter/material.dart';

import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/helper/data_helper.dart';
import 'package:flutter_application_1/model/ders.dart';

class DersListesi extends StatefulWidget {
  final Function onElemanCikaridi;
  const DersListesi({required this.onElemanCikaridi, Key? key}) : super(key: key);

  @override
  State<DersListesi> createState() => _DersListesiState();
}

class _DersListesiState extends State<DersListesi> {
  @override
  Widget build(BuildContext context) {
    List<Ders> tumDersler = DataHelper.tumEklenenDersler;
    return tumDersler.length > 0 ? ListView.builder(itemCount: tumDersler.length, itemBuilder: (context, index){
      return Dismissible(
        key: UniqueKey(),
        direction: DismissDirection.startToEnd,
        onDismissed:(a){
          onElemanCikaridi: (index);
          DataHelper.tumEklenenDersler.removeAt(index);
          setState(() {
            tumDersler.removeAt(index);
          });
        } ,
        child: Padding(
          padding: EdgeInsets.all(2),
          child: Card(
            child: ListTile(
              title: Text(tumDersler[index].ad),
              leading: CircleAvatar(
                backgroundColor: Sabitler.anaRenk,
                child: Text('' + (tumDersler[index].harfDegeri * tumDersler[index].krediDegeri).toStringAsFixed(0)),
              ), 
                  subtitle: Text('${tumDersler[index].krediDegeri} Kredi, Not Degeri ${tumDersler[index].harfDegeri}'),
              
              trailing: IconButton(icon: Icon(Icons.add), onPressed: () {
               print(
                tumDersler.length

               ); 
               print(tumDersler.first.ad.toString());
              },)

              ),
            
          
          ),
        ),
      );
    }) : Container(
                    margin: EdgeInsets.all(24),
                    child: Align(
                      alignment: Alignment.topCenter,
                      child: Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Center(
                          child: Text('Lütfen ders ekleyiniz',
                              style: Theme.of(context)
                                  .textTheme
                                  .headline5!
                                  .copyWith(color: Sabitler.anaRenk)),
                        ),
                      ),
                    ),
                  );
  }
}