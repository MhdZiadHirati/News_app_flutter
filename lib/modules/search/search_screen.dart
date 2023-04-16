import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/cubit/states.dart';
import 'package:news_app/shared/components.dart';

class SearchScreen extends StatelessWidget {
  SearchScreen({Key? key}) : super(key: key);
  final  searchController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return BlocConsumer<NewsCubit,NewsStates>(
      listener: (context,state){},
      builder:(context,state) {
        var cubit = NewsCubit.get(context);
        List list = cubit.search;
        return Scaffold(
        appBar: AppBar(),
        body: Column(
          children: [
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: TextFormField(
                controller: searchController,
                validator: (value) {
                  if (value!.isEmpty) {
                    return 'search must not be empty';
                  }
                  return null;
                },
                onChanged: (value)
                {
                    cubit.getSearch(value);
                },
                decoration: const InputDecoration(
                  icon: Icon(Icons.search),
                  labelText: 'Search',
                  border: OutlineInputBorder(),
                ),
              ),
            ),
            Expanded(
                child: ArticleBuilder(list: list,isSearch:true),
            ),
          ],
        ),
      );
      }
    );
  }
}
