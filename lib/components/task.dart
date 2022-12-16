import 'package:curso/components/difficulty.dart';
import 'package:flutter/material.dart';

class Task extends StatefulWidget {
  final String name;
  final String imgUrl;
  final int difficulty;
  Task(this.name,this.imgUrl, this.difficulty, {Key? key}) : super(key: key);

  int level = 0;

  @override
  State<Task> createState() => _TaskState();
}

class _TaskState extends State<Task> {
  int star = 1;
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Stack(
        children: [
          Container(
            height: 140,
            decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(4)
            ),
          ),
          Column(
            children: [
              Container(
                  height: 100,
                  decoration: BoxDecoration(
                      color: Colors.white,
                      borderRadius: BorderRadius.circular(4)
                  ),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                          width: 72,
                          height: 100,
                          decoration: BoxDecoration(
                              color: Colors.black26,
                              borderRadius: BorderRadius.circular(4)
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(4),
                            child: Image.asset(
                              widget.imgUrl,
                              fit: BoxFit.cover,
                            ),
                          )
                      ),
                      Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(
                            width: 200,
                            child: Text(
                              widget.name,
                              style: const TextStyle(
                                  fontSize: 24,
                                  overflow: TextOverflow.ellipsis
                              ),
                            ),
                          ),
                          Difficulty(difficultyLevel: widget.difficulty),
                        ],
                      ),
                      ElevatedButton(
                          onPressed: (){
                            setState(() {
                              widget.level++;
                            });
                          },
                          child: SizedBox(
                            height: 50,
                            child: Column(
                              children: const [
                                Icon(
                                    Icons.arrow_drop_up
                                ),
                                Text(
                                    'Lvl Up'
                                )
                              ],
                            ),
                          )
                      )
                    ],
                  )
              ),
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(
                      width: 200,
                      child: LinearProgressIndicator(
                          color: Colors.white,
                          value: (widget.level / (widget.difficulty > 0 ? widget.difficulty : 1)) / 10
                      ),
                    ),
                    Text(
                        'Nível: ${widget.level}',
                        style: const TextStyle(
                            fontSize: 16,
                            color: Colors.white
                        )
                    ),
                  ],
                ),
              )
            ],
          )
        ],
      ),
    );
  }
}