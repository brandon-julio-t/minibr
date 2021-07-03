import 'package:flutter/material.dart';
import 'package:minibr/models/item.dart';

class Items extends StatelessWidget {
  const Items({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Items'),
      ),
      body: ListView(
        children: [
          for (var item in [
            Item(
              'Plush Doll',
              '1.jpg',
              'Comfortable and skin-friendly, soft and extrusion resistant Say NO to shoddy cotton, insist on using high-quality cotton filling, provide you with a surprising soft touch Microcomputer controlling cutting machine - imported electromechanical embroidery machine - sewing - full cotton - precision sewing.',
              100000,
            ),
            Item(
              'Little M Night Light',
              '2.jpg',
              "The small night light was designed by the Norwegian designer team Permafrost of MINISO. Four designers of Permafrost graduated from the Oslo School of Architecture (Norway's top three design school), who designed products for Adidas and other famous brands, and now are serving MINISO. Simple, practical and humanized design style.",
              200000,
            ),
            Item(
              'Cotton Eye Mask',
              '3.jpg',
              "On the premise of simplicity and comfort, the concept of improving sleep quality and relieving eye fatigue, the two-side cotton eye mask using soft and breathable fabric,is of zero pressure to eyeballs, and curved edge design fits facial structure more perfectly.",
              300000,
            ),
            Item(
              'Mechanical Keyboard',
              '4.jpg',
              'High keycap structure and backlit mechanical wired keyboard, suitable for desktop and laptop computers Laser carving keycap, hard to fade, compatible with Windows:2000/ME/XP(X64)/ vista7/8/10 /Mac OS X(V10.4 above) and other systems.',
              400000,
            ),
            Item(
              'Popcorn',
              '5.jpg',
              'Select imported American corn (non-GMO), big and full grain, uniform color, healthy nutrition, taste sweet processing with refined vegetable oil, farewell to the traditional image of sticky and low nutritional value, experience the natural and crisp taste',
              500000,
            ),
            Item(
              'Mineral Water',
              '6.jpg',
              "Originating from the water source of nature reserve of the United Nations, with the forest coverage rate reaching 95%, which is China's largest natural mountain spring production base, and China's first national nature reserve Low sodium content/low mineralization, sweet taste Sodium content is less than or equal to 1.0mg/L, potassium content is less than or equal to 0.4mg/L, and magnesium content is less than or equal to 0.1mg/L.",
              600000,
            ),
          ])
            InkWell(
              child: Card(
                child: Column(
                  children: [
                    Image.asset(
                      'assets/products/${item.image}',
                      fit: BoxFit.cover,
                      alignment: Alignment.topCenter,
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 16.0),
                      child: Column(
                        children: [
                          Text(
                            item.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                              fontSize: 28,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(
                            'IDR ${item.price}',
                            style: TextStyle(
                              fontSize: 21,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              onTap: () {
                Navigator.pushNamed(context, '/item-detail', arguments: item);
              },
            )
        ],
      ),
    );
  }
}
