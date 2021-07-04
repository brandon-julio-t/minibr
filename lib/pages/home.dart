import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:minibr/store/store.dart';
import 'package:provider/provider.dart';

class Home extends StatelessWidget {
  const Home({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          PopupMenuButton(
            itemBuilder: (context) => [
              PopupMenuItem(
                child: Consumer<Store>(
                  builder: (context, store, child) => SwitchListTile.adaptive(
                    title: Text('Dark Mode'),
                    value: store.isDark,
                    onChanged: (value) => store.isDark = value,
                  ),
                ),
              ),
            ],
          ),
        ],
        title: Consumer<Store>(
          builder: (context, store, child) => Text(store.user?.name ?? ''),
        ),
      ),
      drawer: Drawer(
        child: ListView(
          children: [
            ListTile(
              title: Text('Home'),
              onTap: () {
                Navigator.pushNamedAndRemoveUntil(
                    context, '/home', (_) => false);
              },
            ),
            ListTile(
              title: Text('Items'),
              onTap: () {
                Navigator.pushNamed(context, '/items');
              },
            ),
            Consumer<Store>(
              builder: (context, store, child) => ListTile(
                title: Text('Logout'),
                onTap: () {
                  store.user = null;
                  Navigator.pushNamedAndRemoveUntil(
                      context, '/login', (route) => false);
                },
              ),
            ),
          ],
        ),
      ),
      body: ListView(
        children: [
          SizedBox(height: 16),
          CarouselSlider(
            items: [
              for (var i = 1; i <= 5; i++) Image.asset('assets/banners/$i.jpg'),
            ],
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 2,
              enlargeCenterPage: true,
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Brand Profile',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.asset('assets/brand-profile.jpg'),
                ),
                Text(
                    'MINISO is a Japanese-inspired lifestyle product retailer, offering high quality household goods, cosmetics and food at affordable prices.'),
                Text(
                    'Founder and CEO Ye Guofu gained inspiration for MINISO while on vacation with his family in Japan in 2013. He came across a number of specialty stores in Japan which stocked good quality, well designed, and inexpensive products that were mostly manufactured in China.  Leveraging his knowledge and experience in product development, supply chain, and channel resources gained from running fashion chain brands, Mr. Ye launched MINISO with its headquarters in Guangzhou, China, a brand which caters to young people around the world.'),
                Text(
                    'Following 7 years rapid growth, MINISO has now opened more than 4,200 stores in over 80 countries and regions, including the US, UK, Canada, Australia, Spain, UAE, India, and Mexico.'),
                Text('A retailer delivering fun, high-quality new goods'),
                SizedBox(height: 16),
                Text(
                  'Founder and CEO',
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 21,
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 16.0),
                  child: Image.asset('assets/founder.jpg'),
                ),
                Text(
                    'As the founder and CEO of MINISO, Ye Guofu accumulated immense mastery in trendy fashion during the period of Chinese economic transformation and seized the opportunity to improve the social quality consumption patterns, bringing a brand new business model in China, which almost monopolized China’s offline flow of customers.'),
                Text(
                    'Ye Guofu considered that the statement “the higher the price, the better the quality” is only the excuse for those enterprises finding a way to sell products at a high price. Those “low price with bad quality” products resulted from the profiteering desire are originated from the period of command economy. The time for “good quality with low price” products in China has just begun. In this era, the actual value of a brand should be beneficial to millions of people rather than providing services to the nobility and the rich. These very values and principles have induced the inception of MINISO.'),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
