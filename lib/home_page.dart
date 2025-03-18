import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:sample_sheet_location/common/lang/language.dart';

import 'common/gen/strings.dart';

class TranslationHomePage extends StatefulWidget {
  const TranslationHomePage({super.key});

  @override
  _TranslationHomePageState createState() => _TranslationHomePageState();
}

class _TranslationHomePageState extends State<TranslationHomePage> with SingleTickerProviderStateMixin {
  late AnimationController _animationController;
  int index=0;
  @override
  void initState() {
    super.initState();

    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 800),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    _animationController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
            colors: [
              Colors.blue.shade800,
              Colors.indigo.shade800,
              Colors.purple.shade900,
            ],
          ),
        ),
        child: SafeArea(
          child: Column(
            children: [
              // App Bar
              Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                     Text(
                      Strings.languageChange,
                      style: const TextStyle(
                        fontSize: 26,
                        fontWeight: FontWeight.bold,
                        color: Colors.white,
                        letterSpacing: 1.2,
                      ),
                    ),
                    Container(
                      decoration: BoxDecoration(
                        color: Colors.white10,
                        borderRadius: BorderRadius.circular(12),
                      ),
                      padding: const EdgeInsets.all(8),
                      child: IconButton(
                        icon: const Icon(Icons.settings_outlined, color: Colors.white),
                        onPressed: () {
                          // Settings functionality
                        },
                      ),
                    ),
                  ],
                ),
              ),

              const SizedBox(height: 20),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      _buildAnimatedCard(
                        Language.values[0].name,
                        Strings.registration,
                        Colors.blueAccent.withOpacity(0.8),
                        Icons.language,
                        0.0,
                      ),
                      const SizedBox(height: 20),
                      _buildAnimatedCard(
                        Language.values[1].name,
                        Strings.login,
                        Colors.redAccent.withOpacity(0.8),
                        Icons.translate,
                        0.2,
                      ),
                      const SizedBox(height: 20),
                      _buildAnimatedCard(
                        Language.values[2].name,
                        Strings.confirm,
                        Colors.amber.withOpacity(0.8),
                        Icons.translate,
                        0.4,
                      ),
                    ],
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.only(bottom: 30.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    _buildControlButton(
                      Icons.arrow_back_rounded,
                      Strings.create,
                          () {
                        if(index>0){
                          setState(() {
                            index--;
                          });
                          context.setLocale(Language.values[index].locale);
                        }
                      },
                    ),
                    const SizedBox(width: 20),
                    _buildControlButton(
                      Icons.arrow_forward_rounded,
                      Strings.next,
                          () {
                        if(index<2){
                          setState(() {
                            index++;
                          });
                          context.setLocale(Language.values[index].locale);
                        }

                      },
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.white24,
        child: const Icon(Icons.add, color: Colors.white),
        onPressed: () {
          // Add functionality
        },
        elevation: 4,
      ),
    );
  }

  Widget _buildAnimatedCard(String language, String text, Color color, IconData iconData, double delay) {
    return AnimatedBuilder(
      animation: _animationController,
      builder: (context, child) {
        final double t = (_animationController.value - delay).clamp(0.0, 1.0) / (1.0 - delay);

        return Transform.translate(
          offset: Offset(0, 50 * (1 - t)),
          child: Opacity(
            opacity: t,
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 20),
              decoration: BoxDecoration(
                color: color,
                borderRadius: BorderRadius.circular(16),
                boxShadow: [
                  BoxShadow(
                    color: color.withOpacity(0.5),
                    blurRadius: 8,
                    spreadRadius: 1,
                    offset: const Offset(0, 4),
                  ),
                ],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            padding: const EdgeInsets.all(8),
                            decoration: BoxDecoration(
                              color: Colors.white.withOpacity(0.2),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              iconData,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          const SizedBox(width: 12),
                          Text(
                            language,
                            style: TextStyle(
                              color: Colors.white.withOpacity(0.9),
                              fontSize: 14,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                        ],
                      ),
                      IconButton(
                        icon: const Icon(
                          Icons.volume_up_outlined,
                          color: Colors.white70,
                          size: 20,
                        ),
                        onPressed: () {
                          // Audio functionality
                        },
                      ),
                    ],
                  ),
                  const SizedBox(height: 14),
                  Text(
                    text,
                    style: const TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  Widget _buildControlButton(IconData icon, String label, VoidCallback onPressed) {
    return ElevatedButton.icon(
      icon: Icon(icon),
      label: Text(label),
      style: ElevatedButton.styleFrom(
        backgroundColor: Colors.white10,
        foregroundColor: Colors.white,
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
      ),
      onPressed: onPressed,
    );
  }
}