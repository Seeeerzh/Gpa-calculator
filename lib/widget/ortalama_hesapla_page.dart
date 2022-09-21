import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_application_1/constants/app_constants.dart';
import 'package:flutter_application_1/helper/data_helper.dart';
import 'package:flutter_application_1/model/ders.dart';
import 'package:flutter_application_1/widget/ders_list.dart';
import 'package:flutter_application_1/widget/harf_dropdown.dart';
import 'package:flutter_application_1/widget/kredi_dropdown.dart';
import 'package:flutter_application_1/widget/ortalama_goster.dart';
import 'package:google_mobile_ads/google_mobile_ads.dart';
import 'package:universal_io/io.dart';
class OrtalamaHesaplaPage extends StatefulWidget {
 OrtalamaHesaplaPage({Key? key}) : super(key: key);
  

  State<OrtalamaHesaplaPage> createState() => _OrtalamaHesaplaPageState();
}

class _OrtalamaHesaplaPageState extends State<OrtalamaHesaplaPage> {

/*final BannerAd myBanner = BannerAd(
  adUnitId: Platform.isAndroid ? '	ca-app-pub-3940256099942544/6300978111' : '	ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
);*/
  BannerAd? _banner;

  @override
  void initState() {
    super.initState();

    _createBannerAd();
  
  }

  void _createBannerAd(){
    _banner = BannerAd(
  adUnitId: Platform.isAndroid ? '	ca-app-pub-3940256099942544/6300978111' : '	ca-app-pub-3940256099942544/2934735716',
  size: AdSize.banner,
  request: AdRequest(),
  listener: BannerAdListener(),
)..load();
  }

   GlobalKey<FormState> formKey = GlobalKey<FormState>();
        double secilenHarfDegeri = 4;
    double secilenKrediDegeri = 1;
    String girilenDersAdi = '';
  
  Widget build(BuildContext context) {
    
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        title: Center(
          child: Text(Sabitler.baslikText, style:Sabitler.baslikStyle, ),
          ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Row(
            children: [
              Expanded(
                flex: 2,
                child:_buildForm(), 
          ),
          Expanded(
            flex: 1,
            child:OrtalamaGoster(dersSayisi: DataHelper.tumEklenenDersler.length, ortalama: DataHelper.ortalamaHesapla()),
           ),
            ],
          ),
          Expanded(
            child:DersListesi(
               onElemanCikaridi: (index){
                  DataHelper.tumEklenenDersler.removeAt(index);
                  setState(() {
                    
                  });               
                  },
            ),
             ),
             
        ],
      ),
      bottomNavigationBar: _banner == null
      ? Container()
      : Container(
        margin: const EdgeInsets.only(bottom: 12),
        height: 52,
        child: AdWidget(ad: _banner!),
      )
    );
  }

Widget _buidTextFormField(){
    return TextFormField(
      onChanged: (deger){
          setState(() {
            girilenDersAdi = deger;
          });
      },
      validator: (s){
        if(s!.length <=0 ){
          return 'Ders adini giriniz';
        }else {
          return null;
        }
      },
      decoration: InputDecoration(
        hintText: 'Matematik',
        border: OutlineInputBorder(
          borderRadius: Sabitler.borderRadius, borderSide: BorderSide.none),
        filled: true,
        fillColor: Sabitler.anaRenk.shade100.withOpacity(0.3), 
      ),
    );
}

  Widget _buildForm() {
return Form(
    key: formKey,
    child: Column(
      children: [
        Padding(padding:Sabitler.yatayPadding8 , 
        child: _buidTextFormField(),),
        SizedBox(height: 5,),
        Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Expanded(
              child: Padding(padding: Sabitler.yatayPadding8 , 
              child:  HarfDropdownwidget(
                onHarfSecildi: (harf){
                    secilenHarfDegeri = harf;
                },
              ),
              ),
            ),
            Expanded(
              child: Padding(padding: Sabitler.yatayPadding8 , 
              child:  KrediDropdownWidget(onKrediSecildi: (kredi){
                secilenKrediDegeri = kredi;
              }),
              ),
            ),
            
            IconButton(
              onPressed: _dersEkleveOrtalamaHesapla, 
              icon: Icon(Icons.arrow_forward_ios_sharp),
              color: Sabitler.anaRenk,
              iconSize: 30,
               ),
],
),
        SizedBox(height: 5,),
    ],
      
    ),
);

   


  }
  
 



  void _dersEkleveOrtalamaHesapla() {
    if(formKey.currentState!.validate()){
      var eklenecekDars = Ders( ad: girilenDersAdi, harfDegeri: secilenHarfDegeri, krediDegeri: secilenKrediDegeri );
      DataHelper.dersEkle(eklenecekDars);
      setState(() {
        
      });
    }
  }
}