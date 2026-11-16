### Tugas 7

1. Widget Tree itu adalah struktur hierarki yang menggambarkan hubungan antar widget dalam Flutter. Widget parent dapat memiliki satu atau lebih widget child untuk membentuk tampilan aplikasi. Contohnya, MaterialApp mempunyai MyHomePage, yang berisi Scaffold, AppBar, dan widget lainnya.

2. Widget yang digunakan:
   - MaterialApp: Mengatur konfigurasi utama aplikasi.
   - Scaffold: Menyediakan struktur dasar halaman.
   - AppBar: Menampilkan judul halaman.
   - Text: Menampilkan teks.
   - Column dan Row: Mengatur susunan widget secara vertikal dan horizontal.
   - Padding: Memberikan jarak antar-widget.
   - Expanded: Membagi ruang yang tersedia secara proporsional.
   - Card: Menampilkan kartu informasi.
   - SizedBox: Memberikan jarak antar-widget.
   - SingleChildScrollView: Memungkinkan halaman di-scroll.
   - GridView.count: Menampilkan menu dalam bentuk grid.
   - Material: Mengatur tampilan dan warna kartu tombol.
   - InkWell: Menambahkan interaksi ketika tombol ditekan.
   - Container: Mengatur tata letak konten.
   - Icon: Menampilkan ikon tombol.
   - SnackBar: Menampilkan pesan sementara.
   - ScaffoldMessenger: Mengelola tampilan SnackBar.

   Ada juga custom widget yaitu MyApp, MyHomePage, InfoCard, dan ItemCard.

3. MaterialApp adalah widget yang menyediakan konfigurasi utama aplikasi Flutter, seperti tema, navigasi, dan halaman awal. Widget ini biasanya digunakan sebagai root widget karena menjadi dasar bagi widget lain untuk menggunakan fitur dan konfigurasi Material Design.

4. StatelessWidget adalah widget yang tidak memiliki state internal yang dapat berubah, sedangkan StatefulWidget memiliki state yang dapat berubah selama aplikasi berjalan. StatelessWidget cocok untuk tampilan yang relatif statis, sedangkan StatefulWidget digunakan ketika tampilan perlu diperbarui berdasarkan perubahan data atau interaksi pengguna.

5. BuildContext adalah objek yang menunjukkan posisi suatu widget dalam widget tree. BuildContext digunakan untuk mengakses informasi dari widget parent, seperti tema melalui Theme.of(context) dan menampilkan SnackBar melalui ScaffoldMessenger.of(context).

6. Hot reload memungkinkan perubahan kode diterapkan tanpa memulai ulang aplikasi sehingga state yang sedang berjalan umumnya tetap dipertahankan. Sementara itu, hot restart memulai ulang aplikasi dari fungsi main() sehingga state diinisialisasi kembali. Hot restart diperlukan ketika perubahan berkaitan dengan inisialisasi atau state aplikasi yang tidak dapat diperbarui melalui hot reload. Full restart diperlukan untuk perubahan tertentu pada kode native atau konfigurasi plugin.

### AI Disclosure
Dalam pengerjaan tugas 7 ini saya menggunakan chatgpt sebagai alat bantu untuk memahami materi Flutter dan memeriksa kode. Seluruh saran AI diperiksa dan disesuaikan kembali dengan kebutuhan proyek. Saya juga melakukan pengujian menggunakan flutter analyze untuk memastikan tidak terdapat masalah pada kode.