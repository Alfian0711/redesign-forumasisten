import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import '../utils/colors.dart';
import 'jadwal_card.dart';

class DayButton extends StatelessWidget {
  final bool isExpanded;
  final VoidCallback onToggle;
  final List<Map<String, String>> scheduleData;

 DayButton({
    Key? key,
    required this.isExpanded,
    required this.onToggle,
    required this.scheduleData,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: Alignment.bottomRight,
      child: Padding(
        padding: EdgeInsets.only(right: 20, bottom: 20),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            if (isExpanded) ...[
              _buildFloatingText(context, "Semua Hari"),
              _buildFloatingText(context, "Senin"),
              _buildFloatingText(context, "Selasa"),
              _buildFloatingText(context, "Rabu"),
              _buildFloatingText(context, "Kamis"),
              _buildFloatingText(context, "Jumat"),
              SizedBox(height: 10),
            ],
            FloatingActionButton(
              onPressed: onToggle,
              child: Icon(isExpanded ? Icons.close : Icons.menu, color: Colors.white,),
              backgroundColor: AppColors.primary,
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingText(BuildContext context, String day) {
    return Container(
      margin: EdgeInsets.only(bottom: 10),
      child: FloatingActionButton(
        mini: false,
        heroTag: day,
        backgroundColor: Colors.white,
        onPressed: () {
          List<Map<String, String>> filtered = day == "Semua Hari"
              ? scheduleData
              : scheduleData
                  .where(
                      (item) => item['day']?.toUpperCase() == day.toUpperCase())
                  .toList();

          showModalBottomSheet(
            context: context,
            builder: (_) => Container(
              padding: EdgeInsets.all(10),
              height: 500,
              child: filtered.isEmpty
                  ? Center(
                      child: Text(
                        'Tidak ada Jadwal',
                        style: GoogleFonts.poppins(
                            fontSize: 16, fontWeight: FontWeight.bold),
                      ),
                    )
                  : ListView.builder(
                      itemCount: scheduleData.length,
                      itemBuilder: (context, index) {
                        var schedule = scheduleData[index];
                        return Padding(
                          padding: EdgeInsets.only(bottom: 10),
                          child: ScheduleCard(
                            name: schedule['name']!,
                            session: schedule['session']!,
                            code: schedule['code']!,
                            time: schedule['time']!,
                            day: schedule['day']!,
                            dosen: schedule['dosen'] ?? 'Dosen Tidak Diketahui',
                          ),
                        );
                      },
                    ),
            ),
          );
        },
        child: Text(
          day,
          style: GoogleFonts.poppins(
            color: Colors.black,
          ),
          overflow: TextOverflow.ellipsis,
          maxLines: 2,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
