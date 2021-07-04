import 'package:flutter/material.dart';
import 'package:minibr/models/comment.dart';
import 'package:minibr/models/item.dart';
import 'package:minibr/models/user.dart';
import 'package:minibr/store/store.dart';
import 'package:provider/provider.dart';

class ItemDetail extends StatefulWidget {
  ItemDetail({Key? key}) : super(key: key);

  @override
  _ItemDetailState createState() => _ItemDetailState();
}

class _ItemDetailState extends State<ItemDetail> {
  final _formKey = GlobalKey<FormState>();

  var _commentController = TextEditingController();
  var _comments = [
    Comment(User('ae@19-2', 'ae', 'Andree Benaya Abyatar'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
    Comment(User('br@20-2', 'br', 'Brandon Julio Thenaro'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
    Comment(User('cc@20-2', 'cc', 'Clarissa Chuardi'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
    Comment(User('ga@20-2', 'ga', 'Skolastika Gabriella Theresandia Prasetyo'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
    Comment(User('st@20-2', 'st', 'Stanley Dave Teherag'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
    Comment(User('tc@20-2', 'tc', 'Thaddeus Cleo'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
    Comment(User('vn@20-2', 'vn', 'Vincent Benedict'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
    Comment(User('ll@20-2', 'll', 'Lionel Ritchie'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
    Comment(User('jp@20-2', 'jp', 'Johanes Peter Vincentius'),
        'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Aenean tortor tortor, sagittis ac urna a, facilisis pharetra urna. Etiam in eros viverra, iaculis elit fermentum, mattis nibh. Nam et purus aliquet, interdum ex quis, mattis tellus. Maecenas vulputate tortor in nisl tristique eleifend. Aenean id aliquam lorem, eu eleifend lacus. Vestibulum ante ipsum primis in faucibus orci luctus et ultrices posuere cubilia curae; Nunc quis bibendum augue, pellentesque convallis purus. Suspendisse malesuada dui vel malesuada tempor. Maecenas ultricies congue urna, tincidunt tempor lorem lacinia eget. Sed sem urna, varius vitae dolor in, iaculis condimentum tortor. Suspendisse ultrices lectus ante, ut viverra ligula tristique sed. Pellentesque orci risus, mattis in luctus eu, interdum at metus.'),
  ];

  @override
  Widget build(BuildContext context) {
    var item = ModalRoute.of(context)!.settings.arguments as Item;

    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: Text(item.name),
          bottom: TabBar(
            tabs: [
              Tab(
                text: 'Details',
                icon: Icon(Icons.details),
              ),
              Tab(
                text: 'Reviews',
                icon: Icon(Icons.reviews),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            ListView(
              children: [
                Image.asset('assets/products/${item.image}'),
                Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    children: [
                      Text(
                        item.name,
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 32,
                        ),
                      ),
                      SizedBox(height: 8),
                      Text(
                        'IDR ${item.price}',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 21,
                        ),
                      ),
                      SizedBox(height: 16),
                      Text(item.description),
                      SizedBox(height: 16),
                      Form(
                        key: _formKey,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            TextFormField(
                              controller: _commentController,
                              decoration: InputDecoration(
                                hintText: 'Review',
                                labelText: 'Review',
                              ),
                              validator: (String? value) {
                                if (value == null || value.isEmpty) {
                                  return 'Review must not be empty.';
                                }

                                return null;
                              },
                            ),
                            SizedBox(height: 8),
                            Consumer<Store>(
                              builder: (context, store, child) {
                                return ElevatedButton(
                                  onPressed: () {
                                    if (!_formKey.currentState!.validate()) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Review must not be empty.',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    if (store.user == null) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text(
                                            'Wait a minute, who are you?',
                                          ),
                                        ),
                                      );
                                      return;
                                    }

                                    setState(() {
                                      _comments = [
                                        Comment(
                                          store.user!,
                                          _commentController.text,
                                        ),
                                        ..._comments,
                                      ];

                                      _commentController.text = '';

                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        SnackBar(
                                          content: Text('Comment submitted.'),
                                        ),
                                      );
                                    });
                                  },
                                  child: Text('Submit'),
                                );
                              },
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            ListView(
              children: [
                for (var comment in _comments)
                  Card(
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            comment.user.name,
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 8),
                          Text(comment.body),
                        ],
                      ),
                    ),
                  )
              ],
            )
          ],
        ),
      ),
    );
  }
}
