import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert' as convert;
import '../models/worker_nft.dart';

class WorkersTab extends StatefulWidget {
  const WorkersTab({Key? key}) : super(key: key);

  @override
  State<WorkersTab> createState() => _WorkersTabState();
}

class _WorkersTabState extends State<WorkersTab> {
  final _workerIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool isLoading = false;
  bool nftIsLoaded = false;
  late WorkerNft workerNft;

  @override
  void dispose() {
    _workerIdController.dispose();
    super.dispose();
  }

  void request(String id) async {
    setState(() {
      nftIsLoaded = false;
      isLoading = true;
    });

    final url = Uri.parse(
        'https://testlaunchmynft.mypinata.cloud/ipfs/QmbVfkviPGQYwsxzWimUW8t3WMm8Zk58Fx6HZKA2YWzPHL/$id.json');
    final response = await http.get(url);
    if (response.statusCode == 200) {
      final jsonResponse =
          convert.jsonDecode(response.body) as Map<String, dynamic>;
      setState(() {
        workerNft = WorkerNft.fromJson(jsonResponse, id);
        nftIsLoaded = true;
      });
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Faild to load worker #$id'),
          backgroundColor: Theme.of(context).errorColor.withOpacity(0.7),
        ),
      );
    }
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Container(
        padding: const EdgeInsets.symmetric(
          vertical: 20,
          horizontal: 15,
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Text('Workers Database',
                style: Theme.of(context).textTheme.headline3),
            const SizedBox(
              height: 20,
            ),
            Form(
              key: _formKey,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle:
                        TextStyle(color: Theme.of(context).colorScheme.primary),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                    contentPadding: const EdgeInsets.only(
                      top: 28,
                      left: 10,
                    ),
                    border: OutlineInputBorder(),
                    label: Text('Enter Worker\'s ID:'),
                  ),
                  autofocus: false,
                  autocorrect: false,
                  keyboardType: TextInputType.number,
                  controller: _workerIdController,
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Value required';
                    }
                    if (value.contains(RegExp(r'[A-Za-z]'))) {
                      return 'Only numbers are allowed';
                    }
                    final int id = int.parse(value);
                    if (id < 0 || id > 2221) {
                      return 'Only ID between 0 and 2221';
                    }
                    return null;
                  },
                ),
              ),
            ),
            TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  request(_workerIdController.text);
                  _workerIdController.clear();
                  FocusScope.of(context).unfocus();
                }
              },
              child: const Text('Submit'),
            ),
            const SizedBox(
              height: 20,
            ),
            isLoading ? const CircularProgressIndicator() : Container(),
            nftIsLoaded
                ? Expanded(
                    child: ListView(
                      children: [
                        Center(
                          child: Text('Wcdonalds Worker #${workerNft.id}',
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.headline3),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(
                          child: Image(
                            image: NetworkImage(workerNft.imageUrl),
                            fit: BoxFit.fill,
                          ),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Center(child: Text('Rank: ${workerNft.rarity}')),
                      ],
                    ),
                  )
                : Container(),
          ],
        ),
      ),
    );
  }
}
