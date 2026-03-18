import 'package:flutter/material.dart';
import 'Loginpage.dart';

class Homepage extends StatelessWidget {
  const Homepage({super.key, required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildNavbar(context),
            _buildHeroSection(context),
            _buildImpactSection(context),
            _buildWhyMarkupSection(context),
            _buildTrustedSection(context),
            _buildProgramsSection(context),
            _buildTestimonialsSection(context),
            _buildHowItWorksSection(context),
            _buildFooter(context),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton.extended(
        onPressed: () => _goToLogin(context),
        backgroundColor: Colors.blue.shade700,
        label: const Text(
          'Mulai Jadi Juara!',
          style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white),
        ),
      ),
    );
  }

  void _goToLogin(BuildContext context) {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (_) => const LoginPage()),
    );
  }

  // ─── NAVBAR ───────────────────────────────────────────────────────────────
  Widget _buildNavbar(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(
        horizontal: isMobile ? 16 : 32,
        vertical: 12,
      ),
      decoration: BoxDecoration(
        color: Colors.white,
        boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 4)],
      ),
      child: isMobile
          ? Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _logoWidget(),
                ElevatedButton(
                  onPressed: () => _goToLogin(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade700,
                    foregroundColor: Colors.white,
                    padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                  ),
                  child: const Text('Daftar', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                ),
              ],
            )
          : Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                _logoWidget(),
                Row(
                  children: [
                    _navItem('Beranda', active: true),
                    const SizedBox(width: 24),
                    _navText('Info Lomba'),
                    const SizedBox(width: 24),
                    _navText('Produk'),
                    const SizedBox(width: 24),
                    _navText('Tentang Kami'),
                  ],
                ),
                Row(
                  children: [
                    OutlinedButton(
                      onPressed: () => _goToLogin(context),
                      child: const Text('Masuk', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                    const SizedBox(width: 12),
                    ElevatedButton(
                      onPressed: () => _goToLogin(context),
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue.shade700,
                        foregroundColor: Colors.white,
                      ),
                      child: const Text('Daftar', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
                    ),
                  ],
                ),
              ],
            ),
    );
  }

  Widget _logoWidget() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(
          'assets/Cuplikan layar 2026-02-25 112508.png 1.png',
          width: 30,
          height: 30,
          errorBuilder: (_, __, ___) => Icon(Icons.business, size: 30, color: Colors.blue.shade700),
        ),
        const SizedBox(width: 8),
        const Text('MARK-UP', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700)),
      ],
    );
  }

  Widget _navItem(String label, {bool active = false}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(label, style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500, color: active ? Colors.blue.shade700 : Colors.black87)),
        if (active)
          Container(margin: const EdgeInsets.only(top: 2), height: 2, width: 40, color: Colors.blue.shade700),
      ],
    );
  }

  Widget _navText(String label) {
    return Text(label, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w500));
  }

  // ─── HERO SECTION ─────────────────────────────────────────────────────────
  Widget _buildHeroSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Stack(
      children: [
        SizedBox(
          width: double.infinity,
          height: isMobile ? 500 : 700,
          child: Image.asset(
            'assets/pexels-francesco-ungaro-96427 1.png',
            fit: BoxFit.cover,
            errorBuilder: (_, __, ___) => Container(color: Colors.blueGrey.shade900),
          ),
        ),
        Container(
          width: double.infinity,
          height: isMobile ? 500 : 700,
          color: Colors.black.withOpacity(0.6),
        ),
        Positioned.fill(
          child: Padding(
            padding: EdgeInsets.all(isMobile ? 20 : 64),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'MARK-UP',
                  style: TextStyle(
                    fontSize: isMobile ? 56 : 120,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                    height: 1.0,
                  ),
                ),
                const SizedBox(height: 12),
                Text(
                  'Jadi Juara Bukan\nSekedar Mimpi!',
                  style: TextStyle(
                    fontSize: isMobile ? 28 : 48,
                    fontWeight: FontWeight.w800,
                    color: Colors.white,
                  ),
                ),
                const SizedBox(height: 16),
                Text(
                  'Bergabunglah dengan ribuan mahasiswa yang telah meraih prestasi dalam business case competitions. Dapatkan mentoring eksklusif dari praktisi terbaik di industri.',
                  style: TextStyle(
                    fontSize: isMobile ? 14 : 18,
                    fontWeight: FontWeight.w400,
                    color: Colors.white70,
                  ),
                ),
                const SizedBox(height: 24),
                ElevatedButton(
                  onPressed: () => _goToLogin(context),
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.blue.shade600,
                    foregroundColor: Colors.white,
                    padding: EdgeInsets.symmetric(
                      horizontal: isMobile ? 24 : 36,
                      vertical: isMobile ? 12 : 16,
                    ),
                    shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
                  ),
                  child: Text(
                    'Mulai Sekarang - Gratis!',
                    style: TextStyle(fontSize: isMobile ? 15 : 18, fontWeight: FontWeight.w700),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  // ─── IMPACT STATS ─────────────────────────────────────────────────────────
  Widget _buildImpactSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final stats = [
      {'icon': Icons.school, 'value': '100+', 'label': 'Universitas', 'sub': 'Partner Institusi'},
      {'icon': Icons.emoji_events, 'value': '89%', 'label': 'Win Rate', 'sub': 'Success Ratio'},
      {'icon': Icons.business, 'value': '50+', 'label': 'Perusahaan', 'sub': 'Corporate Partners'},
      {'icon': Icons.star, 'value': '95%', 'label': 'Satisfaction', 'sub': 'Student Rating'},
      {'icon': Icons.people, 'value': '1000+', 'label': 'Mahasiswa Sukses', 'sub': ''},
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 64, vertical: 48),
      child: Column(
        children: [
          Text(
            'Impact yang Terukur & Terbukti',
            style: TextStyle(fontSize: isMobile ? 24 : 36, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Data dan pencapaian nyata dari ribuan mahasiswa yang telah kami bantu.',
            style: TextStyle(fontSize: isMobile ? 14 : 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          GridView.builder(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: isMobile ? 2 : 5,
              crossAxisSpacing: 16,
              mainAxisSpacing: 16,
              childAspectRatio: isMobile ? 1.2 : 1.0,
            ),
            itemCount: stats.length,
            itemBuilder: (_, i) {
              final s = stats[i];
              return Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Icon(s['icon'] as IconData, size: 28, color: Colors.blue.shade700),
                  const SizedBox(height: 6),
                  Text(s['value'] as String, style: const TextStyle(fontSize: 24, fontWeight: FontWeight.w700)),
                  Text(s['label'] as String, style: const TextStyle(fontSize: 14, fontWeight: FontWeight.w600)),
                  if ((s['sub'] as String).isNotEmpty)
                    Text(s['sub'] as String, style: const TextStyle(fontSize: 12, color: Colors.black45), textAlign: TextAlign.center),
                ],
              );
            },
          ),
        ],
      ),
    );
  }

  // ─── WHY MARK-UP ──────────────────────────────────────────────────────────
  Widget _buildWhyMarkupSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final features = [
      {
        'icon': Icons.cases_outlined,
        'title': 'Fokus Business Case',
        'desc': 'Kuasai framework konsultan top (McKinsey, BCG) dengan latihan kasus nyata dari berbagai industri.',
        'tags': ['Case Studies', 'Real Projects', 'People Development', 'Industry Focus'],
      },
      {
        'icon': Icons.person_outline,
        'title': 'Mentor Profesional',
        'desc': 'Bimbingan langsung dari konsultan senior, juara kompetisi, dan profesional dari Fortune 500.',
        'tags': ['Case Studies', 'People Development', 'Real Projects', 'Industry Focus'],
      },
      {
        'icon': Icons.emoji_events_outlined,
        'title': 'Track Record Juara',
        'desc': 'Alumni kami telah memenangkan 200+ kompetisi nasional dan internasional bergengsi.',
        'tags': ['People Development', 'Case Studies', 'Real Projects', 'Industry Focus'],
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.grey.shade50,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 64, vertical: 48),
      child: Column(
        children: [
          Text(
            'Mengapa Memilih MARK-UP?',
            style: TextStyle(fontSize: isMobile ? 26 : 40, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 12),
          Text(
            'Platform terlengkap untuk persiapan kompetisi bisnis dan pengembangan karir profesional',
            style: TextStyle(fontSize: isMobile ? 14 : 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          Column(
            children: features.map((f) => Padding(
              padding: const EdgeInsets.only(bottom: 16),
              child: Container(
                width: double.infinity,
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  color: Colors.white,
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8, offset: const Offset(0, 4))],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Icon(f['icon'] as IconData, size: 32, color: Colors.blue.shade700),
                    const SizedBox(height: 10),
                    Text(f['title'] as String, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
                    const SizedBox(height: 6),
                    Text(f['desc'] as String, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                    const SizedBox(height: 12),
                    Wrap(
                      spacing: 6,
                      runSpacing: 6,
                      children: (f['tags'] as List<String>).map((t) => Chip(
                        label: Text(t, style: const TextStyle(fontSize: 12)),
                        visualDensity: VisualDensity.compact,
                        padding: EdgeInsets.zero,
                      )).toList(),
                    ),
                  ],
                ),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  // ─── TRUSTED COMPANIES ────────────────────────────────────────────────────
  Widget _buildTrustedSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final logos = [
      {'path': 'assets/image 7.png', 'w': 120.0, 'h': 40.0},
      {'path': 'assets/colourful-google-text-logo-on-white-background-free-vector 1.png', 'w': 100.0, 'h': 40.0},
      {'path': 'assets/image 3.png', 'w': 50.0, 'h': 40.0},
      {'path': 'assets/image 6.png', 'w': 110.0, 'h': 36.0},
      {'path': 'assets/image 8.png', 'w': 100.0, 'h': 42.0},
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 64, vertical: 40),
      child: Column(
        children: [
          Text(
            'Dipercaya oleh Alumni dari Top Companies',
            style: TextStyle(fontSize: isMobile ? 18 : 24, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 8),
          Text(
            'Mentor dan alumni kami bekerja di perusahaan-perusahaan terkemuka dunia',
            style: TextStyle(fontSize: isMobile ? 13 : 16, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 24),
          Wrap(
            alignment: WrapAlignment.center,
            spacing: 24,
            runSpacing: 16,
            children: logos.map((l) => Image.asset(
              l['path'] as String,
              width: l['w'] as double,
              height: l['h'] as double,
              fit: BoxFit.contain,
              errorBuilder: (_, __, ___) => Container(
                width: l['w'] as double,
                height: l['h'] as double,
                decoration: BoxDecoration(
                  color: Colors.grey.shade200,
                  borderRadius: BorderRadius.circular(6),
                ),
                child: const Icon(Icons.business, color: Colors.grey),
              ),
            )).toList(),
          ),
        ],
      ),
    );
  }

  // ─── PROGRAMS SECTION ─────────────────────────────────────────────────────
  Widget _buildProgramsSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final programs = [
      {
        'badge': 'BEST SELLER',
        'badgeColor': Colors.orange,
        'category': 'Competition Prep',
        'name': 'Business Case Mastery',
        'rating': '5',
        'reviews': '(324 reviews)',
        'students': '1,240',
        'duration': '8 Minggu',
        'price': 'Rp 1.499rb',
        'oldPrice': 'Rp 2.499rb',
      },
      {
        'badge': 'NEW',
        'badgeColor': Colors.green,
        'category': 'Professional Skills',
        'name': 'Strategic Consulting Framework',
        'rating': '4.9',
        'reviews': '(256 reviews)',
        'students': '890',
        'duration': '6 Minggu',
        'price': 'Rp 1.199rb',
        'oldPrice': 'Rp 1.999rb',
      },
      {
        'badge': 'POPULAR',
        'badgeColor': Colors.purple,
        'category': 'Career Development',
        'name': 'Career Mentoring Program',
        'rating': '5',
        'reviews': '(412 reviews)',
        'students': '1,560',
        'duration': '12 Minggu',
        'price': 'Rp 2.299rb',
        'oldPrice': 'Rp 3.499rb',
      },
    ];

    return Container(
      width: double.infinity,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 64, vertical: 48),
      decoration: BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topRight,
          end: Alignment.bottomLeft,
          colors: [Colors.blue.shade900, Colors.black],
        ),
      ),
      child: Column(
        children: [
          Text(
            'Jelajahi Program Kami',
            style: TextStyle(fontSize: isMobile ? 26 : 36, fontWeight: FontWeight.w800, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Pilih program yang sesuai dengan tujuan karirmu dan mulai perjalanan menuju kesuksesan',
            style: TextStyle(fontSize: isMobile ? 14 : 18, color: Colors.white70),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ...programs.map((p) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: _programCard(p),
          )),
          const SizedBox(height: 16),
          TextButton(
            onPressed: () {},
            child: const Text(
              'Lihat Seluruh Produk →',
              style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600, color: Colors.white),
            ),
          ),
        ],
      ),
    );
  }

  Widget _programCard(Map<String, dynamic> p) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.all(20),
      decoration: BoxDecoration(
        color: Colors.white,
        borderRadius: BorderRadius.circular(16),
        boxShadow: [BoxShadow(color: Colors.black26, blurRadius: 12)],
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 4),
            decoration: BoxDecoration(
              color: p['badgeColor'] as Color,
              borderRadius: BorderRadius.circular(4),
            ),
            child: Text(p['badge'] as String, style: const TextStyle(fontSize: 11, fontWeight: FontWeight.w700, color: Colors.white)),
          ),
          const SizedBox(height: 10),
          Text(p['category'] as String, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600, color: Colors.grey)),
          const SizedBox(height: 4),
          Text(p['name'] as String, style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700)),
          const SizedBox(height: 8),
          Row(
            children: [
              ...List.generate(5, (_) => const Icon(Icons.star, size: 14, color: Colors.amber)),
              const SizedBox(width: 6),
              Text(p['rating'] as String, style: const TextStyle(fontSize: 13, fontWeight: FontWeight.w600)),
              const SizedBox(width: 4),
              Flexible(child: Text(p['reviews'] as String, style: const TextStyle(fontSize: 13, color: Colors.grey))),
            ],
          ),
          const SizedBox(height: 6),
          Row(
            children: [
              const Icon(Icons.people_outline, size: 15, color: Colors.grey),
              const SizedBox(width: 4),
              Text(p['students'] as String, style: const TextStyle(fontSize: 13)),
              const SizedBox(width: 16),
              const Icon(Icons.access_time, size: 15, color: Colors.grey),
              const SizedBox(width: 4),
              Text(p['duration'] as String, style: const TextStyle(fontSize: 13)),
            ],
          ),
          const SizedBox(height: 12),
          Row(
            children: [
              Text(p['price'] as String, style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700)),
              const SizedBox(width: 10),
              Text(p['oldPrice'] as String, style: const TextStyle(fontSize: 13, color: Colors.grey, decoration: TextDecoration.lineThrough)),
            ],
          ),
          const SizedBox(height: 12),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () {},
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 12),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Lihat Detail', style: TextStyle(fontSize: 15, fontWeight: FontWeight.w600)),
            ),
          ),
        ],
      ),
    );
  }

  // ─── TESTIMONIALS ─────────────────────────────────────────────────────────
  Widget _buildTestimonialsSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final testimonials = [
      {
        'quote': '"MARK-UP benar-benar mengubah cara saya approach business cases. Mentoring dari praktisi BCG sangat membantu saya meraih juara 1 di kompetisi nasional. Materinya applicable dan mentornya sangat supportive!"',
        'name': 'Anastasia Putri',
        'university': 'Universitas Indonesia',
      },
      {
        'quote': '"Program Career Mentoring di MARK-UP luar biasa! Saya berhasil diterima di Big 4 consulting firm berkat persiapan interview dan CV review yang detail. Investment terbaik untuk karir saya."',
        'name': 'Ryan Mahendra',
        'university': 'Institut Teknologi Bandung',
      },
      {
        'quote': '"Framework dan case studies yang diajarkan sangat komprehensif. Dalam 2 bulan, tim saya berhasil juara di 3 kompetisi berbeda. Highly recommended untuk semua business students!"',
        'name': 'Michelle Tan',
        'university': 'Universitas Gadjah Mada',
      },
    ];

    return Container(
      width: double.infinity,
      color: Colors.grey.shade50,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 64, vertical: 48),
      child: Column(
        children: [
          Text(
            'Mereka Telah Membuktikannya',
            style: TextStyle(fontSize: isMobile ? 24 : 36, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Cerita sukses dari ribuan mahasiswa yang telah meraih prestasi bersama MARK-UP',
            style: TextStyle(fontSize: isMobile ? 14 : 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ...testimonials.map((t) => Padding(
            padding: const EdgeInsets.only(bottom: 16),
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.circular(12),
                boxShadow: [BoxShadow(color: Colors.black12, blurRadius: 8)],
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(children: List.generate(5, (_) => const Icon(Icons.star, size: 16, color: Colors.amber))),
                  const SizedBox(height: 10),
                  Text(t['quote']!, style: const TextStyle(fontSize: 15, color: Colors.black87)),
                  const SizedBox(height: 14),
                  Text(t['name']!, style: const TextStyle(fontSize: 15, fontWeight: FontWeight.w700)),
                  Text(t['university']!, style: const TextStyle(fontSize: 13, color: Colors.grey)),
                ],
              ),
            ),
          )),
          const SizedBox(height: 24),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _reviewStat('4.9/5.0', 'Average Rating', isMobile),
              _reviewStat('850+', 'Total Reviews', isMobile),
              _reviewStat('98%', 'Would Recommend', isMobile),
            ],
          ),
        ],
      ),
    );
  }

  Widget _reviewStat(String value, String label, bool isMobile) {
    return Column(
      children: [
        Text(value, style: TextStyle(fontSize: isMobile ? 22 : 30, fontWeight: FontWeight.w700)),
        Text(label, style: TextStyle(fontSize: isMobile ? 11 : 14, color: Colors.black54), textAlign: TextAlign.center),
      ],
    );
  }

  // ─── HOW IT WORKS ─────────────────────────────────────────────────────────
  Widget _buildHowItWorksSection(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    final steps = [
      {'step': '1', 'icon': Icons.app_registration_outlined, 'title': 'Daftar & Pilih Program', 'desc': 'Buat akun gratis dan pilih program yang sesuai dengan tujuan karirmu'},
      {'step': '2', 'icon': Icons.menu_book_outlined, 'title': 'Akses Materi Premium', 'desc': 'Pelajari framework konsultan dan case studies dari industri nyata'},
      {'step': '3', 'icon': Icons.groups_outlined, 'title': 'Mentoring 1-on-1', 'desc': 'Dapatkan bimbingan personal dari mentor profesional berpengalaman'},
      {'step': '4', 'icon': Icons.emoji_events_outlined, 'title': 'Raih Prestasi', 'desc': 'Terapkan skill di kompetisi nyata dan bangun portfolio karirmu'},
    ];

    return Container(
      width: double.infinity,
      color: Colors.white,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 16 : 64, vertical: 48),
      child: Column(
        children: [
          Text(
            'Mulai dalam 4 Langkah Mudah',
            style: TextStyle(fontSize: isMobile ? 24 : 36, fontWeight: FontWeight.w700),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 10),
          Text(
            'Proses yang simpel dan terstruktur untuk membantumu mencapai goals',
            style: TextStyle(fontSize: isMobile ? 14 : 18, color: Colors.black54),
            textAlign: TextAlign.center,
          ),
          const SizedBox(height: 32),
          ...steps.map((s) => Padding(
            padding: const EdgeInsets.only(bottom: 20),
            child: Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                CircleAvatar(
                  radius: 22,
                  backgroundColor: Colors.blue.shade700,
                  child: Text(
                    s['step'] as String,
                    style: const TextStyle(fontSize: 18, fontWeight: FontWeight.w700, color: Colors.white),
                  ),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          Icon(s['icon'] as IconData, size: 22, color: Colors.blue.shade700),
                          const SizedBox(width: 8),
                          Expanded(
                            child: Text(
                              s['title'] as String,
                              style: const TextStyle(fontSize: 17, fontWeight: FontWeight.w700),
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Text(s['desc'] as String, style: const TextStyle(fontSize: 14, color: Colors.black54)),
                    ],
                  ),
                ),
              ],
            ),
          )),
          const SizedBox(height: 24),
          SizedBox(
            width: double.infinity,
            child: ElevatedButton(
              onPressed: () => _goToLogin(context),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blue.shade700,
                foregroundColor: Colors.white,
                padding: const EdgeInsets.symmetric(vertical: 14),
                shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(8)),
              ),
              child: const Text('Mulai Sekarang - Gratis!', style: TextStyle(fontSize: 17, fontWeight: FontWeight.w700)),
            ),
          ),
        ],
      ),
    );
  }

  // ─── FOOTER ───────────────────────────────────────────────────────────────
  Widget _buildFooter(BuildContext context) {
    final isMobile = MediaQuery.of(context).size.width < 768;

    return Container(
      width: double.infinity,
      color: Colors.grey.shade900,
      padding: EdgeInsets.symmetric(horizontal: isMobile ? 20 : 64, vertical: 40),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Text('MARK-UP', style: TextStyle(fontSize: 22, fontWeight: FontWeight.w700, color: Colors.white)),
          const SizedBox(height: 8),
          const Text(
            'Platform EdTech terdepan untuk persiapan kompetisi bisnis dan pengembangan karir profesional.',
            style: TextStyle(fontSize: 14, color: Colors.white60),
          ),
          const SizedBox(height: 16),
          Row(
            children: [
              _socialIcon(Icons.facebook),
              const SizedBox(width: 10),
              _socialIcon(Icons.chat_bubble_outline),
              const SizedBox(width: 10),
              _socialIcon(Icons.camera_alt_outlined),
              const SizedBox(width: 10),
              _socialIcon(Icons.link),
            ],
          ),
          const SizedBox(height: 28),
          _footerSection('Quick Links', ['Beranda', 'Info Lomba', 'Produk', 'Tentang Kami', 'Testimonial']),
          const SizedBox(height: 20),
          _footerSection('Program', ['Business Case Mastery', 'Strategic Consulting', 'Career Mentoring', 'Competition Bootcamp', 'Corporate Training']),
          const SizedBox(height: 20),
          _footerContactSection(),
          const SizedBox(height: 28),
          const Divider(color: Colors.white24),
          const SizedBox(height: 16),
          const Text('© 2026 MARK-UP. All rights reserved.', style: TextStyle(fontSize: 12, color: Colors.white54)),
          const SizedBox(height: 8),
          Wrap(
            spacing: 12,
            children: ['Privacy Policy', 'Terms of Service', 'Cookie Policy']
                .map((l) => Text(l, style: const TextStyle(fontSize: 12, color: Colors.white54)))
                .toList(),
          ),
        ],
      ),
    );
  }

  Widget _footerSection(String title, List<String> links) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(title, style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
        const SizedBox(height: 10),
        ...links.map((l) => Padding(
          padding: const EdgeInsets.only(bottom: 6),
          child: Text(l, style: const TextStyle(fontSize: 14, color: Colors.white60)),
        )),
      ],
    );
  }

  Widget _footerContactSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text('Hubungi Kami', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700, color: Colors.white)),
        const SizedBox(height: 10),
        _contactItem(Icons.email_outlined, 'hello@markup.id'),
        const SizedBox(height: 6),
        _contactItem(Icons.phone_outlined, '+62 812-3456-7890'),
        const SizedBox(height: 6),
        _contactItem(Icons.location_on_outlined, 'Surabaya, Indonesia'),
      ],
    );
  }

  Widget _socialIcon(IconData icon) {
    return Container(
      width: 34,
      height: 34,
      decoration: BoxDecoration(color: Colors.white12, borderRadius: BorderRadius.circular(6)),
      child: Icon(icon, size: 16, color: Colors.white),
    );
  }

  Widget _contactItem(IconData icon, String text) {
    return Row(
      children: [
        Icon(icon, size: 16, color: Colors.white60),
        const SizedBox(width: 8),
        Flexible(child: Text(text, style: const TextStyle(fontSize: 14, color: Colors.white60))),
      ],
    );
  }
}