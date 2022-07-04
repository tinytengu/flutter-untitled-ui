import "package:flutter/material.dart";
import 'package:signup/components/timeline.dart';
import 'package:signup/utils/responsive.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final steps = <TimeLineEvent>[
    TimeLineEvent(
      title: "Your details",
      caption: "Please provide your name and email",
      status: TimeLineEventStatus.completed,
    ),
    TimeLineEvent(
      title: "Choose a password",
      caption: "Choose a secure password",
      status: TimeLineEventStatus.current,
    ),
    TimeLineEvent(
      title: "Invite your team",
      caption: "Start collaborating with your team",
    ),
    TimeLineEvent(
      title: "Add your socials",
      caption: "Share posts to your social accounts",
    ),
  ];

  @override
  Widget build(BuildContext context) {
    return Responsive(
      mobile: Row(
        children: [
          _buildBody(context),
        ],
      ),
      tablet: Row(
        children: [
          _buildSidebar(context),
          _buildBody(context),
        ],
      ),
      desktop: Row(
        children: [
          _buildSidebar(context),
          _buildBody(context),
        ],
      ),
    );
  }

  Widget _buildSidebar(context) {
    return Expanded(
      flex: 2,
      child: SafeArea(
        child: DecoratedBox(
          decoration: BoxDecoration(
            color: Theme.of(context).colorScheme.primary,
          ),
          child: Padding(
            padding: const EdgeInsets.all(32),
            child: Column(children: [
              // Logo
              Row(
                children: [
                  Text(
                    "Untitled UI",
                    style: TextStyle(color: Colors.white, fontSize: 18),
                  ),
                ],
              ),
              SizedBox(height: 80),
              // Timeline
              Timeline(events: steps),
              // Footer
              Spacer(),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  // Copyright
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.copyright,
                        color: Colors.white60,
                        size: 15,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "Untitled UI 2077",
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                  // Contact
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Icon(
                        Icons.mail_outline,
                        color: Colors.white60,
                        size: 15,
                      ),
                      SizedBox(width: 2),
                      Text(
                        "help@untitledui.com",
                        style: TextStyle(
                          color: Colors.white60,
                          fontWeight: FontWeight.w100,
                        ),
                      ),
                    ],
                  ),
                ],
              )
            ]),
          ),
        ),
      ),
    );
  }

  Widget _buildHorizontalStep(context, TimeLineEvent step) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: step.status == TimeLineEventStatus.current
            ? Theme.of(context).colorScheme.primary
            : Colors.deepPurple[50],
        borderRadius: BorderRadius.circular(10),
      ),
      child:
          SizedBox(width: Responsive.isDesktop(context) ? 100 : 60, height: 10),
    );
  }

  Widget _buildBody(context) {
    void _onPressed() {}

    return Expanded(
      flex: 3,
      child: Padding(
        padding: EdgeInsets.all(Responsive.isDesktop(context) ? 64 : 32),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Spacer(flex: 1),
            // Text
            Column(
              children: [
                Text(
                  "Choose a password",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.bold,
                  ),
                ),
                SizedBox(height: 20),
                Text(
                  "Must be at least 8 characters",
                  style: TextStyle(
                    color: Colors.black38,
                  ),
                ),
              ],
            ),
            SizedBox(height: 40),
            // Inputs
            Column(
              children: [
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Choose a password",
                    isDense: true,
                  ),
                ),
                SizedBox(height: 20),
                TextField(
                  obscureText: true,
                  decoration: InputDecoration(
                    border: OutlineInputBorder(),
                    labelText: "Confirm password",
                    isDense: true,
                  ),
                ),
                SizedBox(height: 20),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    minimumSize: Size.fromHeight(50),
                  ),
                  onPressed: _onPressed,
                  child: Text("Continue"),
                ),
              ],
            ),
            Spacer(flex: 2),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: steps.map((step) {
                return _buildHorizontalStep(context, step);
              }).toList(),
            )
          ],
        ),
      ),
    );
  }
}
