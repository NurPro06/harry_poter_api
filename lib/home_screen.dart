import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:harry_poter_api/bloc/main_bloc.dart';
import 'package:harry_poter_api/details_screen.dart';
import 'model.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: Colors.white,
        appBar: AppBar(title: const Text('Harry Potter Characters')),
        body: BlocBuilder<MainBloc, MainState>(
          builder: (context, state) {
            if (state is DataLoading) {
              return const Center(child: CircularProgressIndicator());
            } else if (state is SuccessLoaded) {
              final responseList = state.data;
              return ListView.separated(
                separatorBuilder: (context, index) => Padding(
                  padding: const EdgeInsets.symmetric(vertical: 20),
                  child: Divider(
                    height: 10,
                    thickness: 2,
                    color: Colors.green,
                  ),
                ),
                itemBuilder: (context, index) {
                  final item = responseList[index];
                  return GestureDetector(
                    onTap: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => DetailsScreen(character: item),
                        ),
                      );
                    },
                    child: Column(
                      children: [
                        Text(
                          item.fullName,
                          style: const TextStyle(fontSize: 40),
                        ),
                        Text(
                          item.hogwartsHouse,
                          style: const TextStyle(fontSize: 40),
                        ),
                        if (item.image.isNotEmpty)
                          Image.network(item.image, height: 200),
                      ],
                    ),
                  );
                },
                itemCount: responseList.length,
              );
            } else if (state is ErrorState) {
              return Center(child: Text(state.message));
            }
            return const Center(child: Text('Press button to load data'));
          },
        ),
      ),
    );
  }
}