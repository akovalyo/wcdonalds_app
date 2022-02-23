import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'dart:convert' as convert;
import '../models/worker_nft.dart';
import 'package:transparent_image/transparent_image.dart';

class WorkersTab extends StatefulWidget {
  const WorkersTab({Key? key}) : super(key: key);

  @override
  State<WorkersTab> createState() => _WorkersTabState();
}

class _WorkersTabState extends State<WorkersTab> {
  final _workerIdController = TextEditingController();
  final _formKey = GlobalKey<FormState>();
  bool _isLoading = false;
  bool _nftLoaded = false;
  late WorkerNft _workerNft;
  Map<String, dynamic> _rarityDb = {};
  int _searchByIndex = 0;

  @override
  void initState() {
    loadRarities();
    super.initState();
  }

  @override
  void dispose() {
    _workerIdController.dispose();
    super.dispose();
  }

  void loadRarities() async {
    final String response =
        await rootBundle.loadString('assets/data/rarity.json');
    _rarityDb = await convert.jsonDecode(response);
  }

  void request(String id) async {
    setState(() {
      _nftLoaded = false;
      _isLoading = true;
    });

    final metadata = await WorkerNft.queryNftData(id);
    if (metadata.isNotEmpty) {
      setState(() {
        _workerNft = WorkerNft.fromJson(metadata, id);
        _nftLoaded = true;
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
      _isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      overlayColor: MaterialStateProperty.all(Colors.transparent),
      onTap: () {
        FocusScope.of(context).unfocus();
      },
      child: ListView(
        children: [
          const SizedBox(
            height: 20,
          ),
          Center(
            child: Text('Workers Database',
                style: Theme.of(context).textTheme.headline3),
          ),
          const SizedBox(
            height: 20,
          ),
          Column(
            children: [
              const Text('Search worker by:'),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  ChoiceChip(
                    label: const Text('by ID'),
                    selected: _searchByIndex == 0,
                    onSelected: (value) {
                      setState(() {
                        _searchByIndex = 0;
                      });
                    },
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  ChoiceChip(
                    label: const Text('by rarity'),
                    selected: _searchByIndex == 1,
                    onSelected: (value) {
                      setState(() {
                        _searchByIndex = 1;
                      });
                    },
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: Form(
              key: _formKey,
              child: Container(
                constraints: const BoxConstraints(maxWidth: 200),
                child: TextFormField(
                  decoration: InputDecoration(
                    floatingLabelStyle: TextStyle(
                        color: Theme.of(context).colorScheme.tertiary),
                    focusedBorder: const OutlineInputBorder(
                      borderSide: BorderSide(color: Colors.yellow),
                    ),
                    contentPadding: const EdgeInsets.only(
                      top: 28,
                      left: 10,
                    ),
                    border: const OutlineInputBorder(),
                    label: _searchByIndex == 1
                        ? const Text('Enter rarity rank:')
                        : const Text('Enter Worker\'s ID:'),
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
                    final int input = int.parse(value);
                    if (_searchByIndex == 1 && (input < 1 || input > 2222)) {
                      return 'Only rank between 1 and 2222';
                    } else if (_searchByIndex == 0 &&
                        (input < 0 || input > 2221)) {
                      return 'Only ID between 0 and 2221';
                    }
                    return null;
                  },
                ),
              ),
            ),
          ),
          Center(
            child: TextButton(
              onPressed: () {
                if (_formKey.currentState!.validate()) {
                  String id = _workerIdController.text;
                  if (_searchByIndex == 1) {
                    id = _rarityDb[_workerIdController.text].toString();
                  }

                  request(id);
                  _workerIdController.clear();
                  FocusScope.of(context).unfocus();
                }
              },
              child: const Text('Submit'),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
          _isLoading
              ? Align(
                  alignment: Alignment.center,
                  // ignore: sized_box_for_whitespace
                  child: Container(
                      width: 50,
                      height: 50,
                      child: const CircularProgressIndicator()),
                )
              : Container(),
          _nftLoaded
              ? Column(
                  children: [
                    Center(
                      child: Text('Wcdonalds Worker #${_workerNft.id}',
                          textAlign: TextAlign.center,
                          style: Theme.of(context).textTheme.headline3),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(
                      child: FadeInImage.memoryNetwork(
                          placeholder: kTransparentImage,
                          image: _workerNft.imageUrl),
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    Center(child: Text('Rank: ${_workerNft.rarity}')),
                  ],
                )
              : Container(),
        ],
      ),
    );
  }
}
