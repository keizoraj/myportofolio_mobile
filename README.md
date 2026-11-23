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

AI Disclosure:
Dalam pengerjaan tugas 7 ini saya menggunakan chatgpt sebagai alat bantu untuk memahami materi Flutter dan memeriksa kode. Seluruh saran AI diperiksa dan disesuaikan kembali dengan kebutuhan proyek. Saya juga melakukan pengujian menggunakan flutter analyze untuk memastikan tidak terdapat masalah pada kode.

### Tugas 8

1. Navigator.push() digunakan untuk membuka halaman baru dengan menambahkan halaman tersebut ke navigation stack, sehingga pengguna dapat kembali ke halaman sebelumnya menggunakan Navigator.pop() atau tombol Back. Navigator.pushReplacement() digunakan untuk mengganti halaman saat ini dengan halaman baru, sedangkan Navigator.pop() digunakan untuk menutup halaman yang sedang terbuka dan kembali ke halaman sebelumnya. Pada aplikasi MyPortfolio, Navigator.push() digunakan untuk membuka Education Form melalui kartu Add Education maupun opsi Add Education pada drawer. Sementara itu, opsi Home menggunakan Navigator.pushReplacement() untuk mengganti halaman formulir dengan halaman utama.

2. Scaffold berfungsi sebagai kerangka utama halaman yang menyediakan struktur seperti AppBar, Drawer, dan body. AppBar digunakan untuk menampilkan judul halaman, sedangkan Drawer menyediakan navigasi ant halaman. Penggunaan struktur tersebut membuat tampilan setiap halaman konsisten. Contohnya, halaman Home dan Education Form sama-sama menggunakan warna Indigo pada AppBar sehingga mempertahankan identitas visual aplikasi MyPortfolio.

3. SingleChildScrollView dipilih agar seluruh komponen formulir tetap dapat diakses ketika ukuran layar terbatas atau keyboard muncul. Widget Padding dan SizedBox membantu memberikan jarak antar komponen agar tampilan lebih rapi dan mudah dibaca. Dengan adanya SingleChildScrollView, pengguna dapat menggulir halaman untuk mengakses seluruh input dan tombol Save tanpa terhalang keterbatasan tinggi layar.

4. GlobalKey<FormState> digunakan untuk mengakses dan mengelola kondisi Form, termasuk menjalankan validasi seluruh input. Validator berfungsi memeriksa apakah nilai yang dimasukkan pengguna sudah memenuhi aturan yang ditentukan, sedangkan validate() menjalankan seluruh validator ketika tombol Save ditekan. Contohnya, input Institution Name yang hanya berisi spasi akan ditolak karena dianggap kosong setelah menggunakan trim(). Pemilihan jenis input atau keyboard saja belum cukup untuk menjamin kebenaran data karena pengguna masih dapat memasukkan nilai yang tidak sesuai aturan. Oleh karena itu, validasi tetap diperlukan untuk memastikan data yang dimasukkan benar.

AI Disclosure:
Dalam pengerjaan tugas 8 ini, saya menggunakan chatgpt sebagai alat bantu untuk memahami materi Flutter Navigation, Forms, Layouts, dan Input Elements serta membantu proses implementasi dan debugging. Saya memberikan kode yang sudah saya buat/implementasikan kepada AI untuk diperiksa dan meminta penjelasan mengenai perubahan jika diperlukan. Seluruh implementasi kemudian saya integrasikan dan uji kembali pada aplikasi Flutter.