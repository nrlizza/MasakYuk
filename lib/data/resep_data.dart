import '../models/resep_model.dart';

final List<Resep> resepList = [
  Resep(
    id: 1,
    nama: 'Lemper',
    kategori: 'Jawa',
    bahanPokok: 'Ayam',
    gambar: 'assets/img/lemper.jpg',
    bahan:
        '• 500 gr beras ketan\n'
        '• 250 ml santan kental\n'
        '• 1 sdt garam\n'
        '• Daun pisang secukupnya\n'
        '• 250 gr ayam suwir\n'
        '• 3 siung bawang putih\n'
        '• 1 sdt ketumbar\n'
        '• 2 lembar daun salam\n'
        '• Minyak untuk menumis',
    cara:
        'Kukus beras ketan hingga setengah matang.\n'
        'Rebus santan dan garam hingga mendidih, lalu tuang ke ketan, aduk rata.\n'
        'Kukus kembali ketan hingga matang sempurna.\n'
        'Tumis bumbu halus (bawang putih, ketumbar, daun salam), masukkan ayam suwir, aduk hingga kering.\n'
        'Ambil sedikit ket an, pipihkan, isi dengan ayam suwir, lalu bungkus daun pisang.\n'
        'Bakar sebentar hingga daun sedikit gosong dan harum.',
    tipsPenyajian: '',
    sumber: 'resepkoki.id',
  ),
  Resep(
    id: 2,
    nama: 'Pempek',
    kategori: 'Sumatera',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/pempek.jpg',
    bahan:
        '• 500 gr ikan tenggiri giling\n'
        '• 150–200 ml air es\n'
        '• 100 ml santan cair\n'
        '• 1 butir telur\n'
        '• 1/2 sdm garam\n'
        '• 1/2 sdm gula\n'
        '• 1/2 sdm kaldu ayam bubuk\n'
        '• 1/2 sdt lada\n'
        '• 250 gr tepung tapioka\n'
        '• Daun bawang cincang secukupnya\n\n'
        'Bahan cuko:\n'
        '• 250 gr gula aren\n'
        '• 100 ml air\n'
        '• 6 buah cabai rawit\n'
        '• 3 siung bawang putih\n'
        '• 2 sdt garam',
    cara:
        'Campur ikan giling dengan air es dan santan cair hingga lembut.\n'
        'Tambahkan telur, garam, gula, lada, dan kaldu ayam bubuk, aduk rata.\n'
        'Masukkan daun bawang dan tepung tapioka sedikit demi sedikit sambil diuleni.\n'
        'Bentuk adonan sesuai selera (lenjer, kapal selam, atau bulat kecil).\n'
        'Rebus pempek hingga mengapung, angkat dan tiriskan.\n'
        'Goreng pempek hingga kuning keemasan sebelum disajikan.\n'
        'Untuk cuko: haluskan bawang putih dan cabai, rebus dengan gula aren dan garam, lalu saring.',
    tipsPenyajian: '',
    sumber: 'jogja.tribunnews.com',
  ),
  Resep(
    id: 3,
    nama: 'Mie Aceh',
    kategori: 'Aceh',
    bahanPokok: 'Daging',
    gambar: 'assets/img/mie_aceh.jpg',
    bahan:
        '• 200 gr mie kuning basah\n'
        '• 100 gr daging sapi iris tipis\n'
        '• 2 siung bawang putih\n'
        '• 3 siung bawang merah\n'
        '• 1 sdt kari bubuk\n'
        '• 3 cabai merah\n'
        '• 2 sdm kecap manis\n'
        '• Garam dan lada secukupnya\n'
        '• 100 ml air kaldu sapi\n'
        '• Minyak untuk menumis',
    cara:
        'Haluskan bawang putih, bawang merah, dan cabai merah.\n'
        'Tumis bumbu halus hingga harum.\n'
        'Masukkan potongan daging sapi, aduk hingga berubah warna.\n'
        'Tambahkan air kaldu, kari bubuk, kecap manis, garam, dan lada.\n'
        'Setelah daging empuk, masukkan mie kuning basah.\n'
        'Aduk hingga semua bahan tercampur rata dan bumbu meresap.\n'
        'Sajikan dengan acar bawang dan emping.',
    tipsPenyajian: '',
    sumber: 'food.detik.com',
  ),
  Resep(
    id: 4,
    nama: 'Papeda',
    kategori: 'Papua',
    bahanPokok: 'Tepung',
    gambar: 'assets/img/papeda.jpg',
    bahan:
        '• 100 gr tepung sagu\n'
        '• 500 ml air\n'
        '• 1/2 sdt garam\n'
        '• Ikan tongkol atau kakap (untuk kuah kuning)\n'
        '• 3 siung bawang putih\n'
        '• 4 siung bawang merah\n'
        '• 1 ruas kunyit\n'
        '• 2 lembar daun salam\n'
        '• 1 batang serai\n'
        '• Garam dan air secukupnya',
    cara:
        'Campur tepung sagu dengan sedikit air hingga larut.\n'
        'Rebus sisa air bersama garam hingga hampir mendidih.\n'
        'Tuang air panas ke larutan sagu sambil diaduk cepat hingga bening dan mengental.\n'
        'Untuk kuah kuning: haluskan bawang putih, bawang merah, dan kunyit.\n'
        'Tumis bumbu dengan daun salam dan serai hingga harum, lalu masukkan ikan dan air.\n'
        'Masak hingga ikan matang dan kuah mengental.\n'
        'Sajikan papeda dengan kuah kuning ikan.',
    tipsPenyajian: '',
    sumber: 'primarasa.co.id',
  ),
  Resep(
    id: 5,
    nama: 'Ayam Betutu',
    kategori: 'Bali',
    bahanPokok: 'Ayam',
    gambar: 'assets/img/ayam_betutu.jpg',
    bahan:
        '• 1 ekor ayam kampung utuh\n'
        '• 5 lembar daun jeruk\n'
        '• 3 batang serai, memarkan\n'
        '• 3 lembar daun salam\n'
        '• 2 sdt garam\n'
        '• 1 sdt gula merah\n'
        '• 3 sdm minyak untuk menumis\n'
        '• Bumbu halus: 10 bawang merah, 5 bawang putih, 10 cabai merah keriting, 5 kemiri, 1 ruas jahe, 1 ruas kunyit, 1 sdt ketumbar, 1 ruas lengkuas',
    cara:
        'Tumis bumbu halus hingga harum bersama daun salam, serai, dan daun jeruk.\n'
        'Matikan api, lalu lumuri seluruh ayam dengan bumbu hingga merata, termasuk bagian dalamnya.\n'
        'Bungkus ayam dengan daun pisang dan aluminium foil.\n'
        'Kukus ayam selama 1 jam agar bumbu meresap.\n'
        'Panggang atau bakar hingga ayam matang dan beraroma harum.\n'
        'Sajikan dengan sambal matah dan nasi hangat.',
    tipsPenyajian:
        'Sajikan Ayam Betutu dengan nasi putih hangat dan sambal matah khas Bali.\n'
        'Tambahkan urap-urap sayuran sebagai pelengkap untuk memberikan tekstur dan rasa yang lebih kaya.\n'
        'Hias piring saji dengan irisan jeruk limau atau daun kemangi untuk tampilan yang lebih menarik dan aroma yang segar.',
    sumber: 'indonesiakaya.com',
  ),

  Resep(
    id: 6,
    nama: 'Ayam Taliwang',
    kategori: 'Nusa Tenggara Barat',
    bahanPokok: 'Ayam',
    gambar: 'assets/img/ayam_taliwang.jpg',
    bahan:
        '• 1 ekor ayam kampung muda\n'
        '• 2 sdt garam\n'
        '• 2 sdm minyak kelapa\n'
        '• Bumbu halus: 10 cabai merah keriting, 5 cabai rawit, 6 bawang merah, 4 bawang putih, 2 kemiri, 1 sdt terasi, 1 sdm gula merah, 1 sdm air jeruk limau',
    cara:
        'Lumuri ayam dengan garam dan minyak, diamkan selama 15 menit.\n'
        'Tumis bumbu halus hingga matang dan harum, sisihkan sebagian untuk olesan.\n'
        'Panggang ayam di atas bara api sambil diolesi bumbu hingga matang dan kecokelatan.\n'
        'Sajikan ayam taliwang dengan sambal dan plecing kangkung.',
    tipsPenyajian: '',
    sumber: 'indonesiakaya.com',
  ),

  Resep(
    id: 7,
    nama: 'Coto Makassar',
    kategori: 'Sulawesi Selatan',
    bahanPokok: 'Daging',
    gambar: 'assets/img/coto_makassar.jpg',
    bahan:
        '• 500 gr daging sapi campur jeroan\n'
        '• 2 liter air cucian beras (air tajin)\n'
        '• 3 batang serai\n'
        '• 4 lembar daun salam\n'
        '• Bumbu halus: 8 bawang putih, 6 bawang merah, 1 sdm ketumbar, 1 ruas jahe, 1 ruas lengkuas, 1 sdm merica, 3 kemiri\n'
        '• Pelengkap: daun bawang, bawang goreng, ketupat',
    cara:
        'Rebus daging dan jeroan hingga empuk, lalu potong kecil-kecil.\n'
        'Tumis bumbu halus bersama serai dan daun salam hingga wangi.\n'
        'Masukkan bumbu ke dalam rebusan daging, tambahkan air tajin dan garam.\n'
        'Masak hingga kuah mengental dan bumbu meresap sempurna.\n'
        'Sajikan dengan ketupat, daun bawang, dan bawang goreng.',
    tipsPenyajian: '',
    sumber: 'halodoc.com',
  ),

  Resep(
    id: 8,
    nama: 'Kerak Telor',
    kategori: 'Jakarta',
    bahanPokok: 'Beras',
    gambar: 'assets/img/kerak_telor.jpg',
    bahan:
        '• 100 gr beras ketan putih, rendam 2 jam\n'
        '• 3 butir telur bebek\n'
        '• 5 sdm kelapa parut sangrai\n'
        '• 2 sdm ebi sangrai halus\n'
        '• Bumbu halus: bawang merah goreng, cabai kering, garam, gula',
    cara:
        'Panaskan wajan kecil, tuang satu sendok ketan dan ratakan.\n'
        'Tuang telur bebek di atas ketan, aduk rata.\n'
        'Tambahkan ebi dan kelapa sangrai di atasnya.\n'
        'Masak di atas bara api hingga bagian bawah kering dan garing.\n'
        'Balik wajan agar bagian atas matang dengan panas arang.\n'
        'Sajikan hangat dengan taburan bawang goreng.',
    tipsPenyajian: '',
    sumber: 'fimela.com',
  ),

  Resep(
    id: 9,
    nama: 'Gudeg',
    kategori: 'Yogyakarta',
    bahanPokok: 'Nangka',
    gambar: 'assets/img/gudeg.jpg',
    bahan:
        '• 1 kg nangka muda, potong kecil\n'
        '• 500 ml santan kental\n'
        '• 5 lembar daun jati\n'
        '• 5 butir telur rebus\n'
        '• Bumbu halus: 10 bawang merah, 5 bawang putih, 6 kemiri, 2 ruas lengkuas, 1 sdt ketumbar, 100 gr gula merah',
    cara:
        'Rebus nangka muda bersama daun jati hingga setengah matang, tiriskan.\n'
        'Tumis bumbu halus hingga harum, masukkan nangka, telur, dan santan.\n'
        'Masak dengan api kecil hingga kuah menyusut dan warna cokelat merata.\n'
        'Biarkan bumbu meresap dan tekstur nangka lembut.\n'
        'Sajikan dengan sambal krecek dan nasi hangat.',
    tipsPenyajian: '',
    sumber: 'bango.co.id',
  ),

  Resep(
    id: 10,
    nama: 'Keripik Tempe',
    kategori: 'Jawa',
    bahanPokok: 'Kacang',
    gambar: 'assets/img/keripik_tempe.jpg',
    bahan:
        '• 10 papan tempe tipis\n'
        '• 100 gr tepung beras\n'
        '• 50 gr tepung tapioka\n'
        '• 2 siung bawang putih\n'
        '• 1/2 sdt ketumbar\n'
        '• 1/2 sdt garam\n'
        '• Air secukupnya\n'
        '• Minyak untuk menggoreng',
    cara:
        'Haluskan bawang putih, ketumbar, dan garam.\n'
        'Campur dengan tepung beras dan tapioka.\n'
        'Tambahkan air hingga adonan encer.\n'
        'Celupkan irisan tempe ke dalam adonan.\n'
        'Goreng dalam minyak panas hingga kering dan renyah.\n'
        'Tiriskan dan simpan di wadah kedap udara.',
    tipsPenyajian: '',
    sumber: 'cookpad.com',
  ),

  Resep(
    id: 11,
    nama: 'Nasi Kuning',
    kategori: 'Jawa',
    bahanPokok: 'Beras',
    gambar: 'assets/img/nasi_kuning.jpg',
    bahan:
        '• 500 gr beras\n'
        '• 400 ml santan\n'
        '• 1 ruas kunyit, parut dan peras airnya\n'
        '• 2 batang serai\n'
        '• 2 lembar daun salam\n'
        '• Garam secukupnya',
    cara:
        'Cuci beras hingga bersih, lalu kukus setengah matang.\n'
        'Rebus santan bersama air kunyit, daun salam, serai, dan garam.\n'
        'Tuang santan ke beras dan aduk hingga rata.\n'
        'Kukus kembali hingga matang sempurna.\n'
        'Sajikan dengan ayam goreng, sambal, dan telur balado.',
    tipsPenyajian: '',
    sumber: 'cookpad.com',
  ),
  Resep(
    id: 12,
    nama: 'Nasi Liwet',
    kategori: 'Jawa Barat',
    bahanPokok: 'Beras',
    gambar: 'assets/img/nasi_liwet.jpg',
    bahan:
        '• 500 gr beras\n'
        '• 600 ml air\n'
        '• 3 siung bawang merah, iris tipis\n'
        '• 2 siung bawang putih, iris tipis\n'
        '• 2 lembar daun salam\n'
        '• 1 batang serai, memarkan\n'
        '• 1 sdm minyak goreng\n'
        '• Garam secukupnya',
    cara:
        'Tumis bawang merah dan bawang putih hingga harum.\n'
        'Masukkan daun salam, serai, dan beras, aduk rata.\n'
        'Tambahkan air dan garam, masak hingga air terserap.\n'
        'Kukus nasi hingga matang sempurna.\n'
        'Sajikan dengan ikan asin, sambal, dan lalapan.',
    tipsPenyajian: '',
    sumber: 'royco.co.id',
  ),

  Resep(
    id: 13,
    nama: 'Rendang',
    kategori: 'Sumatera Barat',
    bahanPokok: 'Daging',
    gambar: 'assets/img/rendang.jpg',
    bahan:
        '• 1 kg daging sapi\n'
        '• 1 liter santan kental\n'
        '• 10 bawang merah\n'
        '• 6 bawang putih\n'
        '• 10 cabai merah besar\n'
        '• 5 kemiri\n'
        '• 2 batang serai\n'
        '• 4 daun jeruk\n'
        '• 2 daun salam\n'
        '• 1 ruas lengkuas\n'
        '• Garam dan gula merah secukupnya',
    cara:
        'Haluskan semua bumbu dan tumis hingga harum.\n'
        'Masukkan daging sapi dan aduk hingga berubah warna.\n'
        'Tuang santan kental dan tambahkan daun jeruk, serai, serta daun salam.\n'
        'Masak dengan api kecil sambil diaduk hingga santan mengering.\n'
        'Biarkan bumbu meresap hingga daging berwarna cokelat gelap dan empuk.\n'
        'Sajikan dengan nasi hangat.',
    tipsPenyajian: '',
    sumber: 'resepkoki.id',
  ),

  Resep(
    id: 14,
    nama: 'Saksang',
    kategori: 'Sumatera Utara',
    bahanPokok: 'Daging',
    gambar: 'assets/img/saksang.jpg',
    bahan:
        '• 500 gr daging sapi cincang\n'
        '• 300 ml santan kental\n'
        '• 10 bawang merah\n'
        '• 6 bawang putih\n'
        '• 5 cabai merah\n'
        '• 1 sdm andaliman\n'
        '• 1 ruas jahe\n'
        '• 1 ruas lengkuas\n'
        '• 1 batang serai\n'
        '• 3 daun jeruk',
    cara:
        'Tumis bumbu halus hingga harum.\n'
        'Masukkan daging cincang, aduk hingga berubah warna.\n'
        'Tambahkan santan dan biarkan mendidih perlahan.\n'
        'Masak hingga kuah menyusut dan bumbu meresap sempurna.\n'
        'Sajikan hangat dengan nasi putih.',
    tipsPenyajian: '',
    sumber: 'cahayameat.com',
  ),

  Resep(
    id: 15,
    nama: 'Tiwul',
    kategori: 'Jawa Tengah',
    bahanPokok: 'Singkong',
    gambar: 'assets/img/tiwul.jpg',
    bahan:
        '• 500 gr gaplek (singkong kering), haluskan\n'
        '• 200 ml air hangat\n'
        '• 100 gr gula merah serut\n'
        '• Kelapa parut kukus untuk taburan',
    cara:
        'Campur tepung gaplek dengan air hangat sedikit demi sedikit sambil diaduk hingga menggumpal halus.\n'
        'Kukus adonan hingga matang.\n'
        'Taburi dengan gula merah serut dan kelapa parut saat disajikan.\n'
        'Nikmati sebagai pengganti nasi atau makanan ringan tradisional.',
    tipsPenyajian: '',
    sumber: 'cookpad.com',
  ),

  Resep(
    id: 16,
    nama: 'Nasil Liwet Kecombrang',
    kategori: 'Jawa Tengah',
    bahanPokok: 'Beras',
    gambar: 'assets/img/liwet_kecombrang.jpg',
    bahan:
        '• 2 ½ gelas beras.\n'
        '• 6 siung bawang merah, iris.\n'
        '• 2 buah cabe merah besar, iris serong.\n'
        '• 2 batang serai, memarkan.\n'
        '• 2 lembar daun salam.\n'
        '• 3 lembar daun jeruk.\n'
        '• 3 ruas lengkuas, memarkan.\n'
        '• 1 buah bunga kecombrang ukuran kecil, belah menjadi 2 bagian, lalu iris tipis.\n'
        '• ½ sdt Bubuk MSG.\n'
        '• ½ sdt garam.\n'
        '• ½ sdt gula.\n'
        '• 50gr teri, goreng hingga matang.\n'
        '• 1 papan petai\n'
        '• 10 buah cabe rawit merah, buang tangkainya.\n'
        '• Air secukupnya untuk memasak nasi.',
    cara:
        'Tumis bawang merah dengan minyak bekas menggoreng ikan teri hingga harum, kemudian masukkan irisan cabe merah besar. Tumis hingga cabe layu, sisihkan.\n'
        'Cuci bersih beras, lalu masukkan dalam rice cooker. Kemudian tambahkan daun salam, daun jeruk, serai, kecombrang serta tumisan bawang merah dan cabe. Bumbui dengan Bubuk MSG, garam, dan gula. Terakhir, tambahkan air seperti memasak nasi seperti biasa, lalu aduk rata.\n'
        'Masak nasi seperti biasa.\n'
        'Sesaat setelah matang, taburi ikan teri dan cabe rawit, tutup lagi rice cooker selama 10-15 menit.\n'
        'Sajikan nasi liwet dengan sambal, dan lauk pauk sesuai selera.',
    tipsPenyajian:
        'Sajikan Hangat di Daun Pisang. Aroma nasi akan semakin wangi dan terasa lebih alam.\n'
        'Lengkapi dengan Lauk Tradisional. Ayam goreng, tahu-tempe, sambal kecombrang, dan lalapan segar adalah pasangan pas.\n'
        'Tambahkan Taburan Bawang Goreng. Memberi sensasi renyah dan aroma tambahan yang menggoda.\n'
        'Hidangkan dalam Porsi Besar untuk Keluarga. Nasi liwet selalu lebih nikmat saat disantap bersama-sama.\n'
        'Cocok Disajikan di Acara Spesial. Dari arisan, selamatan, hingga makan malam keluarga, nasi ini selalu mencuri perhatian',
    sumber: 'sasa.co.id',
  ),
  Resep(
    id: 17,
    nama: 'Udang Saus Padang',
    kategori: 'Sumatera Barat',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/udang_saus_padang.jpg',
    bahan:
        '• 350 gr udang.\n'
        '• 2 buah jagung manis, sudah dimasak.\n'
        '• 1 tomat.\n'
        '• 2 cabe hijau.\n'
        '• 2 cabe merah besar.\n'
        '• 1 bawang bombay.\n'
        '• 1 Daun bawang.\n'
        '• 1 telur\n'
        '• Air +/- 500 ml\n\n'
        'Bahan Saus\n'
        '• 1 sdm Saus Tomat\n'
        '• 2 sdm Saus Sambal Asli\n'
        '• 1 ½ sdm saus tiram\n'
        '• 1 sdm minyak wijen\n'
        '• 1 sdm kecap inggris\n'
        '• 1 sdm kecap ikan\n'
        '• ½ sdt garam\n'
        '• 2 sdm gula pasir\n'
        '• ½ sdt lada bubuk\n'
        '• ½ sdt Bubuk MSG\n\n'
        'Bahan Bumbu Halus\n'
        '• 8 cabe merah keriting\n'
        '• 1 ruas jari jahe\n'
        '• 3 bawang putih\n'
        '• 5 bawang merah\n'
        '• Air untuk blender\n',
    cara:
        'Blender bahan-bahan untuk bumbu halus, sisihkan.\n'
        'Campurkan semua bahan bahan saus, aduk rata.\n'
        'Goreng udang 1 menit\n'
        'Tumis bumbu halus kemudian diikuti dengan bahan saus.\n'
        'Masukkan bawang bombay\n'
        'Tambahkan air secukupnya.\n'
        'Beri kocokan telur.\n'
        'Masukkan jagung manis dan udang, masak kembali 2-3 menit.\n'
        'Masukkan cabe merah, cabe hijau, tomat, dan bawang daun, aduk rata kembali.\n'
        'Jika dirasa kurang kental bisa tambahkan larutan maizena dan sajikan',
    tipsPenyajian:
        'Sajikan Panas Bersama Nasi Putih Hangat. Kombinasi sempurna untuk menikmati rasa pedas gurih saus padang.\n'
        'Tambahkan Jeruk Nipis di Atas Udang. Memberi sentuhan segar dan menonjolkan cita rasa udangnyan'
        'Hidangkan dengan Lalapan Segar – Timun, selada, atau kol bisa jadi penyeimbang rasa pedas.\n'
        'Cocok Jadi Menu Spesial di Akhir Pekan – Bikin suasana makan di rumah terasa seperti di restoran seafood favoritmu.',
    sumber: 'sasa.co.id',
  ),
  Resep(
    id: 18,
    nama: 'Ayam Kari Aceh',
    kategori: 'Aceh',
    bahanPokok: 'Ayam',
    gambar: 'assets/img/ayam_kari_aceh.jpg',
    bahan:
        '• 2 ekor ayam pejantan\n'
        '• 1 jeruk nipis\n'
        '• 10 cabe keriting\n'
        '• 6 bawang putih\n'
        '• 5 kemiri sangrai\n'
        '• 1 jempol jahe\n\n'
        'Rempah Kering\n'
        '• 1 sdm ketumbar bubuk\n'
        '• 1 sdt kunyit bubuk\n'
        '• 1 sdt garam\n'
        '• 1 sdt jinten bubuk\n'
        '• 1 sdt pala bubuk\n'
        '• 2 sdt adas\n\n'
        'Bahan Rempah Tumis\n'
        '• 8 bawang merah\n'
        '• 5 bawang putih\n'
        '• 5 cengkeh\n'
        '• 1 kayu manis\n'
        '• 4 kapulaga\n'
        '• 2 bunga lawang\n'
        '• 1 batang serai\n'
        '• 5 batang daun kari\n'
        '• 1 L air\n'
        '• 3 sdm kelapa gongseng\n'
        '• 1 pcs Santan Cair 200ml\n'
        '• 1 sdm Bumbu Ekstrak Daging Ayam\n'
        '• 1 sdt garam\n'
        '• 1 sdt lada\n'
        '• 1,5 sdm gula\n'
        '• 5 sdm air asam jawa\n',
    cara:
        'Beri ayam pejantan perasan jeruk nipis, diamkan sejenak.\n'
        'Haluskan cabe, bawang, kemiri, dan jahe\n'
        'Marinasi ayam dengan bumbu halus dan rempah kering, minimal 60 menit.\n'
        'Tumis bawang putih dan bawang merah serta masukkan bahan rempah tumis lainnya hingga wangi.\n'
        'Masukkan ayam beserta bumbunya.\n'
        'Tambahkan kelapa gongseng dan air. Masak dengan api kecil selama kurang lebih 60 menit atau sampai empuk.\n'
        'Seasoning dan tambahkan Bumbu Ekstrak Daging Ayam Dan Santan Cair 200ml.\n'
        'Beri air asam jawa dan masak kembali sebentar saja. Bisa ditambahkan lagi daun kari supaya lebih wangi.\n'
        'Sajikan.',
    tipsPenyajian:
        'Sajikan dengan Nasi Hangat atau Roti Cane. Kuah kental dan gurih sangat cocok dinikmati bersama nasi putih pulen atau roti cane khas Aceh yang bisa dicocol ke dalam kuah kari.\n'
        'Tambahkan Acar Segar. Acar timun dan wortel bisa menjadi pelengkap segar untuk menyeimbangkan rasa gurih dan pedas.\n'
        'Lengkapi dengan Sambal dan Kerupuk. Sambal rawit atau sambal bajak akan menambah sensasi pedas, sementara kerupuk bisa menambah tekstur kriuk.\n'
        'Cocok untuk Makan Bersama Keluarga. Porsinya yang besar dan rasanya yang berani membuat ayam kari Aceh pas untuk hidangan utama saat makan siang atau malam bersama keluarga',
    sumber: 'sasa.co.id',
  ),
  Resep(
    id: 19,
    nama: 'Sayur Asem Betawi',
    kategori: 'Jakarta',
    bahanPokok: 'Sayur',
    gambar: 'assets/img/sayur_asem_betawi.jpg',
    bahan:
        '• 2 ekor ayam pejantan\n'
        '• 1 jeruk nipis\n'
        '• 10 cabe keriting\n'
        '• 6 bawang putih\n'
        '• 5 kemiri sangrai\n'
        '• 1 jempol jahe\n\n'
        'Rempah Kering\n'
        '• 1 sdm ketumbar bubuk\n'
        '• 1 sdt kunyit bubuk\n'
        '• 1 sdt garam\n'
        '• 1 sdt jinten bubuk\n'
        '• 1 sdt pala bubuk\n'
        '• 2 sdt adas\n\n'
        'Bahan Rempah Tumis\n'
        '• 8 bawang merah\n'
        '• 5 bawang putih\n'
        '• 5 cengkehn'
        '• 1 kayu manis\n'
        '• 4 kapulaga\n'
        '• 2 bunga lawang\n'
        '• 1 batang serai\n'
        '• 5 batang daun kari\n'
        '• 1 L air\n'
        '• 3 sdm kelapa gongseng\n'
        '• 1 pcs Santan Cair 200ml\n'
        '• 1 sdm Bumbu Ekstrak Daging Ayam\n'
        '• 1 sdt garam\n'
        '• 1 sdt lada\n'
        '• 1,5 sdm gula\n'
        '• 5 sdm air asam jawa\n',
    cara:
        'Beri ayam pejantan perasan jeruk nipis, diamkan sejenak.\n'
        'Haluskan cabe, bawang, kemiri, dan jahe\n'
        'Marinasi ayam dengan bumbu halus dan rempah kering, minimal 60 menit.\n'
        'Tumis bawang putih dan bawang merah serta masukkan bahan rempah tumis lainnya hingga wangi.\n'
        'Masukkan ayam beserta bumbunya.\n'
        'Tambahkan kelapa gongseng dan air. Masak dengan api kecil selama kurang lebih 60 menit atau sampai empuk.\n'
        'Seasoning dan tambahkan Bumbu Ekstrak Daging Ayam Dan Santan Cair 200ml.\n'
        'Beri air asam jawa dan masak kembali sebentar saja. Bisa ditambahkan lagi daun kari supaya lebih wangi.\n'
        'Sajikan.',
    tipsPenyajian:
        'Padukan dengan Lauk Kering atau Goreng - Sajikan bersama ikan asin, tempe goreng, atau tahu goreng untuk rasa yang saling melengkapi.\n'
        'Sajikan hangat-hangat - Sayur asem paling enak dinikmati dalam keadaan hangat, apalagi saat cuaca mendung atau hujan.\n'
        'Disajikan dalam Porsi Besar untuk Keluarga - Cocok banget jadi menu utama saat makan bersama di akhir pekan.\n'
        'Tambahkan Nasi Uduk atau Nasi Merah - Kalau bosan dengan nasi putih, coba sajikan dengan nasi uduk atau nasi merah untuk variasi yang menarik.',
    sumber: 'sasa.co.id',
  ),
  Resep(
    id: 20,
    nama: 'Asem-Asem Pindang',
    kategori: 'Sumatera Selatan',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/asem_asem_pindang.jpg',
    bahan:
        '• 5 ikan pindang keranjang (sudah dibersihkan)\n'
        '• 15 bawang putih\n'
        '• 20 bawang merah\n'
        '• 3 belimbing wuluh\n'
        '• 2 cabe merah besar\n'
        '• 2 cabe hijau besar\n'
        '• 7 cabe rawit\n'
        '• 2 tomat merah\n'
        '• 2 tomat hijau\n'
        '• 2 lbr daun salam\n'
        '• 1 jempol lengkuas\n'
        '• 1 ruas jahe\n'
        '• 1 ruas kencur\n'
        '• 5 sdm Tepung Bumbu Serbaguna\n'
        '• ½ sdt Bubuk MSG\n'
        '• 1,5 sdm gula\n'
        '• 1 sdt garam\n'
        '• 400 ml air',
    cara:
        'Siapkan bumbu.\n'
        'Iris bawang merah, bawang putih, cabai merah, cabai hijau, cabai rawit, tomat merah, dan tomat hijau..\n'
        'Iris juga belimbing wuluh.\n'
        'Tumis bumbu.\n'
        'Tumis bawang merah dan bawang putih dengan sedikit minyak hingga harum.\n'
        'Masukkan cabai, tomat, belimbing wuluh, daun salam, lengkuas, jahe, dan kencur. Tumis hingga layu dan wangi.\n'
        'Masukkan bumbu pelengkap.\n'
        'Tambahkan 5 sdm Tepung Bumbu Serbaguna dan aduk rata.\n'
        'Tuang 400 ml air, lalu masukkan gula, garam, dan Bubuk MSG. Aduk rata dan biarkan mendidih.\n'
        'Masukkan ikan pindang.\n'
        'Setelah kuah mendidih dan bumbu tercampur rata, masukkan ikan pindang.\n'
        'Masak dengan api kecil ± 10-15 menit hingga ikan meresap dan kuah agak mengental.\n'
        'Koreksi rasa, lalu sajikan.\n'
        'Sajikan pindang keranjang bumbu pedas gurih ini dengan nasi putih hangat dan lalapan.',
    tipsPenyajian:
        'Sajikan dengan Nasi Putih Hangat. Kuah asem-asem yang segar akan terasa makin nikmat jika disantap bersama nasi hangat yang pulen.\n'
        'Tambahkan Sambal Terasi atau Sambal Bajak. Meski kuahnya sudah pedas, sambal bisa jadi pelengkap yang pas untuk penggemar rasa nendang.\n'
        'Hidangkan Bersama Kerupuk atau Emping. Tambahan renyah ini bisa jadi kontras tekstur yang menyenangkan di setiap suapan.\n'
        'Bisa Disimpan dalam Lemari Es. Kuahnya akan semakin meresap dan lezat keesokan harinya. Tinggal panaskan sebelum disajikan kembali.',
    sumber: '',
  ),
  Resep(
    id: 21,
    nama: 'Tempe Bacem',
    kategori: 'Jawa Tengah',
    bahanPokok: 'Kacang',
    gambar: 'assets/img/tempe_bacem.jpg',
    bahan:
        '• 1 papan tempe, potong tempe setebal 2 cm\n'
        '• 2 lembar daun salam\n'
        '• 3 cm lengkuas, geprek\n'
        '• 1 sdt garam\n'
        '• 1 sdm gula merah\n'
        '• cabai rawit hijau\n'
        '• 3 sdm Bango Kecap Manis\n'
        '• 500 ml air kelapa muda\n'
        '• 100 ml minyak sayur\n\n'
        'Bumbu Halus\n'
        '• 4 siung bawang putih\n'
        '• 2 butir kemiri, sangrai\n'
        '• 6 butir bawang merah\n'
        '• ½ sdt ketumbar',
    cara:
        'Haluskan semua bumbu halus dengan menggunakan blender.\n'
        'Campur tempe dengan air kelapa, daun salam, lengkuas, garam, gula merah, dan bumbu halus. Kemudian aduk hingga tercampur rata.\n'
        'Panaskan air di panci, lalu masukkan tempe ke dalamnya. Tambahkan Kecap Manis. Masak di atas api kecil hingga matang dan bumbu meresap.\n'
        'Panaskan minyak di wajan. Goreng hingga berwarna kecokelatan. Sajikan.',
    tipsPenyajian:
        'Disantap dengan Nasi Hangat dan Sayur Lodeh. Kombinasi rasa manis gurih tempe bacem cocok banget dipadukan dengan lodeh atau sayur bening.\n'
        'Jadikan Pelengkap Nasi Kuning atau Nasi Uduk. Tempe bacem bisa jadi lauk komplet dalam hidangan nasi tradisional.\n'
        'Bisa Dibekukan dan Digoreng Saat Butuh. Setelah diungkep, simpan dalam wadah tertutup dan bekukan. Saat butuh tinggal goreng sebentar.',
    sumber: 'bango.co.id',
  ),
  Resep(
    id: 22,
    nama: 'Sop Konro',
    kategori: 'Makassar',
    bahanPokok: 'Daging',
    gambar: 'assets/img/sop_konro.jpg',
    bahan:
        '• 600 gram iga sapi, potong-potong sesuai selera\n'
        '• 2 liter air untuk merebus dan membuat kuah kaldu\n'
        '• 100 ml air asam Jawa\n'
        '• 2 ruas lengkuas, pipihkan\n'
        '• 5 lembar daun salam\n'
        '• 1 sdm garam\n'
        '• ½ sdm gula pasir\n'
        '• 5 siung bawang merah iris\n'
        '• 5 butir cengkeh\n'
        '• 3 butir kapulaga\n'
        '• 2 batang kayu manis\n'
        '• 2 batang daun bawang, rajang halus\n'
        '• Bawang goreng secukupnya untuk taburan\n\n'
        '• 2 butir keluwak\n'
        '• 2 sdt merica\n'
        '• 5 butir kemiri, sangrai\n'
        '• ½ butir pala\n'
        '• 1 sdm ketumbar, sangrai'
        '• 1 ruas kunyit, bakar\n'
        '• 8 siung bawang merah\n'
        '• 5 siung bawang putih\n'
        '• 2 batang serai ambil bagian putihnya\n'
        '• 2 ruas jahe\n'
        '• ¼ sdt jinten\n'
        '• Minyak untuk menumis',
    cara:
        'Rebus air hingga mendidih. Masukkan potongan iga dan rebus hingga iga lunak. Buang kotoran yang mengapung di permukaan air. Jika air berkurang dan iga belum empuk, tambahkan air panas dan rebus hingga iga benar-benar empuk. Sisihkan. \n'
        'Tumis bumbu halus hingga harum dan matang. Masukkan daun salam, lengkuas, dan bawang merah iris. Aduk dan tumis hingga daun salam layu. Matikan api. \n'
        'Tuangkan tumisan bumbu ke dalam rebusan iga. Masukkan kayu manis, cengkeh, kapulaga, garam, gula, dan air asam jawa. Rebus hingga kuah mendidih. Koreksi rasa. Masukkan daun bawang, aduk, dan masak sebentar. Angkat.\n'
        'Sajikan sup konro dengan taburan bawang merah goreng di atasnya.',
    tipsPenyajian:
        'Sop Konro paling enak dimakan selagi kuahnya masih mendidih panas agar aroma rempah dan lemak iganya tercium kuat.\n'
        'Sajikan bersama burasa (ketan kukus daun pisang) atau ketupat.\n'
        'Tambahkan kerupuk emping atau kerupuk kulit sebagai pelengkap.\n'
        'Makan dengan cara menyuwir daging iga pakai tangan dan menghisap sumsum tulang.',
    sumber: 'lingkar.news',
  ),
  Resep(
    id: 23,
    nama: 'Soto Balungan',
    kategori: 'Jawa Tengah',
    bahanPokok: 'Ayam',
    gambar: 'assets/img/soto_balungan.jpg',
    bahan:
        '• 2 potong tulang dada ayam\n'
        '• 1 buah wortel\n'
        '• 3 lembar kubis\n'
        '• 1 batang daun bawang\n'
        '• 1 batang seledri\n'
        '• 1/2 buah tomat\n'
        '• 1 batang serai\n'
        '• 1 lembar daun salam\n'
        '• 3 lembar daun jeruk purut\n'
        '• 3 cm jahe\n'
        '• 3 cm lengkuas\n\n'
        'Bumbu Halus\n'
        '• 1/2 sdt ketumbar\n'
        '• 2 buah kemiri\n'
        '• 3 siung bawang merah\n'
        '• 5 siung bawang putih\n'
        '• 2 cm kunyit\n'
        '• 1 sdt garam\n'
        '• 1 sdt penyedap\n'
        '• 1/2 sdt lada bubuk',
    cara:
        'Siapkan bahan. Sangrai ketumbar dan kemiri. Haluskan bumbu.\n'
        'Panaskan minyak. Goreng irisan bawang merah sampai setengah matang. Masukkan Bumbu halus. Tumis sampai layu. Masukkan daun salam,daun jeruk,sereh. Tumis sampai keluar minyak.\n'
        'Masukkan air. Didihkan. Masukkan potongan balungan, jahe,dan lengkuas. Masak selama 5 menit.\n'
        'Masukkan irisan wortel. Masak sampai setengah matang. Masukkan irisan kubis, daun bawang, seledri, tomat, garam,penyedap, lada bubuk. Masak sampai mendidih. Matikan api. Siap dihidangkan',
    tipsPenyajian:
        'Sajikan Hangat. Kuah soto yang disajikan panas akan terasa lebih sedap dan harum. Apalagi balungan akan lebih mudah dinikmati saat masih hangat.\n'
        'Lengkapi dengan Jeruk Nipis. Tambahan perasan jeruk nipis bikin rasa kuah lebih seimbang, segar, dan terasa makin nikmat.\n'
        'Bisa Dibuat dalam Porsi Besar untuk Keluarga. Cocok banget buat disajikan saat kumpul keluarga atau acara spesial, tinggal rebus balungan dalam jumlah banyak dan sajikan dalam panci besar.\n'
        'Eksperimen dengan Topping. Selain bawang goreng dan seledri, kamu bisa tambahkan irisan telur rebus, sambal bajak, atau kerupuk sebagai pelengkap',
    sumber: 'cookpad.com',
  ),
  Resep(
    id: 24,
    nama: 'Garang Asem Ayam Santan',
    kategori: 'Jawa Tengah',
    bahanPokok: 'Ayam',
    gambar: 'assets/img/garang_asem.jpg',
    bahan:
        '• 1 pcs Santan Cair 65ml\n'
        '• 300 gr daging ayam\n'
        '• 300 ml air\n'
        '• Daun pisang\n\n'
        'Bumbu Halus\n'
        '• 6 siung bawang merah\n'
        '• 3 siung bawang putih\n'
        '• 2 butir kemiri\n'
        '• 1 ruas jahe\n'
        '• 1 sdm garam\n\n'
        'Bumbu Iris\n'
        '• 1 ruas lengkuas\n'
        '• 3 daun salam\n'
        '• 1 batang sereh\n'
        '• 15 cabai rawit\n'
        '• 3 cabai keriting\n'
        '• 2 cabai hijau\n'
        '• 15 belimbing wuluh\n'
        '• 3 tomat hijau',
    cara:
        'Tumis bumbu halus. Tambahkan lengkuas, daun salam dan sereh. Masak hingga matang.\n'
        'Tambahkan air dan santan, aduk dan masak sampai mendidih.\n'
        'Masukkan ayam, aduk rata. Tutup panci masak hingga ayam matang.\n'
        'Masukkan cabai, tomat, dan belimbing wuluh. Masak sebentar lalu matikan api.\n'
        'Bungkus dengan daun pisang lalu kukus selama 30 menit.\n'
        'Sajikan dengan nasi hangat.',
    tipsPenyajian:
        'Sajikan dengan Nasi Hangat. Garang asem paling cocok disantap bersama nasi putih hangat agar kuahnya lebih terasa nikmat.\n'
        'Pas untuk Bekal atau Hidangan Spesial. Karena dibungkus daun pisang, garang asem ini cocok juga untuk dibawa bekal atau disajikan saat ada tamu.\n'
        'Eksperimen Isian. Selain ayam, kamu bisa menambahkan tahu, tempe, atau bahkan jamur untuk variasi rasa dan tekstur.',
    sumber: 'sasa.co.id',
  ),
  Resep(
    id: 25,
    nama: 'Asinan Sayur Betawi',
    kategori: 'Jakarta',
    bahanPokok: 'Sayur',
    gambar: 'assets/img/asinan_sayur_betawi.jpg',
    bahan:
        '• 200 gr kol\n'
        '• 200 gr taoge\n'
        '• Mi kuning, secukupnya\n'
        '• 10 lembar daun selada\n'
        '• 4 buah tahu kuning\n'
        '• 2 buah timun\n'
        '• 1 L air\n'
        '• 300 gr gula merah\n'
        '• 100 gr gula pasir\n'
        '• 10 sdm air asam jawa\n'
        '• 6 sdm air perasan jeruk nipis\n'
        '• 1 sdt garam\n'
        '• 100 gr kacang tanah goreng\n'
        '• 10 buah cabai rawit\n'
        '• 4 buah cabai merah besar\n'
        '• 2 sdm ebi, disangrai\n'
        '• Kerupuk Udang',
    cara:
        'Haluskan kacang tanah yang udah digoreng, cabai rawit, cabai merah besar, dan ebi yang udah disangrai. Sisihkan.\n'
        'Siapkan panci dan didihkan air. Masukkan gula merah, gula pasir, air asam jawa, jeruk nipis, dan garam. Lalu tambahkan bumbu halus yang udah kamu buat tadi. Rebus hingga mendidih, lalu biarkan hingga dingin.\n'
        'Potong bahan-bahan seperti kol, selada, dan timun. Sisihkan.\n'
        'Rebus tahu dan mi di panci terpisah, lalu pindahkan ke atas piring saji.\n'
        'Tambahkan mentimun, kol, daun selada, sawi asin, dan kacang tanah goreng ke piring saji.\n'
        'Tuangkan bumbu asinan yang udah dimasak ke atasnya.\n'
        'Sajikan dengan Kerupuk Udang Finna dan asinan sayur betawi siap dinikmati.',
    tipsPenyajian:
        'Sajikan dalam keadaan dingin, lebih enak taruh di kulkas dulu 1-2 jam.\n'
        'Gunakan mangkuk atau piring dalam yang agak besar supaya kuahnya banyak.\n'
        'Tuang kuah asam manis pedas sampai semua sayuran terendam setengahnya (jangan terlalu penuh biar masih renyah).\n'
        'Taburi kacang tanah goreng yang banyak di atasnya sesaat sebelum makan.\n'
        'Siapkan sendok sayur kecil dan garpu supaya mudah ambil sayur dan kerupuknya.\n'
        'Beri irisan cabai rawit merah di atas kalau suka lebih pedas.\n'
        'Makan segera setelah dituang kuah supaya sayuran masih kriuk dan kerupuk belum lembek.',
    sumber: 'finnafood.com',
  ),
  Resep(
    id: 26,
    nama: 'Lumpia Semarang',
    kategori: 'Semarang',
    bahanPokok: 'Sayur',
    gambar: 'assets/img/lumpia_semarang.jpg',
    bahan:
        '• 10 lembar kulit lumpia siap pakai\n'
        '• 300 gr rebung, iris korek api\n'
        '• 100 gr taoge\n'
        '• 75 gr udang cincang\n'
        '• 75 gr ayam cincang\n'
        '• 1 batang daun bawang, iris halus\n'
        '• 1 butir telur, kocok lepas\n'
        '• 1 butir putih telur untuk perekat\n'
        '• 4 siung bawang merah + 2 siung bawang putih\n'
        '• 2 sdm ebi sangrai\n'
        '• Kecap manis, garam, gula, lada secukupnya\n'
        '• Minyak untuk menumis dan menggoreng\n\n'
        'Acar:\n'
        '• 100 gr timun iris tipis\n'
        '• 100 gr wortel iris tipis\n'
        '• 50 ml cuka masak\n'
        '• 1 sdt gula + ½ sdt garam\n\n'
        'Saus Kacang:\n'
        '• 150 gr kacang tanah goreng, haluskan\n'
        '• 2 siung bawang putih cincang\n'
        '• 50 gr gula merah\n'
        '• 300 ml air\n'
        '• 2 sdm tepung sagu larutkan\n'
        '• Garam secukupnya',
    cara:
        'Tumis bumbu halus dan ebi sampai harum. Masukkan udang dan ayam cincang, aduk hingga berubah warna. Tambahkan rebung, taoge, dan daun bawang, masak sampai layu. Beri kecap manis, garam, gula, dan lada, aduk rata. Tuang telur kocok, aduk cepat sampai kering, angkat dan dinginkan. Ambil selembar kulit lumpia, beri isian, lipat rapi, rekatkan dengan putih telur, lalu goreng dalam minyak panas sedang hingga kuning kecokelatan, angkat dan tiriskan.\n\n'
        'Acar: Campur semua bahan acar, aduk rata, diamkan 15-30 menit sampai rasa meresap.\n\n'
        'Saus Kacang: Tumis bawang putih sampai harum, tuang air, gula merah, dan garam, didihkan. Masukkan kacang tanah halus, aduk rata. Tuang larutan tepung sagu sambil terus diaduk hingga kental dan meletup-letup, angkat.',
    tipsPenyajian:
        'Sajikan lumpia selagi panas agar kulit tetap renyah kriuk\n'
        'Potong serong 2-3 bagian supaya cantik dan mudah dimakan\n'
        'Taruh acar timun wortel di samping, jangan ditumpuk di atas lumpia\n'
        'Siram saus kacang kental atau sediakan mangkuk kecil untuk dicelup\n'
        'Taburi bawang goreng dan irisan cabe rawit merah\n'
        'Peras jeruk nipis atau jeruk sambal tepat sebelum makan biar segar\n'
        'Lengkapi dengan kerupuk udang atau kerupuk gendar\n',
    sumber: 'Adaptasi Kompas.com',
  ),
  Resep(
    id: 27,
    nama: 'Mie Gomak',
    kategori: 'Sumatera Utara',
    bahanPokok: 'Daging',
    gambar: 'assets/img/mie_gomak.jpg',
    bahan:
        '• 300 g mie lidi\n'
        '• 500 g daging sapi (sengkel/sandung lamur), potong kecil\n'
        '• 400 ml santan\n'
        '• 1200 ml susu rendah lemak (atau air kaldu)\n'
        '• 70 g bunga kecombrang, iris halus\n'
        '• 3 batang daun bawang, iris\n'
        '• 3 buah tomat, potong dadu\n'
        '• 3 batang serai, memarkan\n'
        '• 6 lembar daun jeruk\n'
        '• 2 sdm andaliman, haluskan\n'
        '• 1 sdt Kaldu Sapi\n'
        '• 3 sdm minyak goreng\n\n'
        'Bumbu Halus:\n'
        '• 12 butir bawang merah\n'
        '• 8 buah cabai rawit merah\n'
        '• 5 buah cabai merah besar\n'
        '• 3 siung bawang putih\n'
        '• 3 cm kunyit\n'
        '• 2 cm jahe\n'
        '• 1 sdt garam',
    cara:
        'Panaskan minyak, tumis bumbu halus bersama serai dan daun jeruk hingga harum\n'
        'Masukkan potongan daging sapi, aduk hingga berubah warna\n'
        'Tuang susu rendah lemak, masak dengan api kecil sampai daging empuk\n'
        'Tambahkan Kaldu Sapi, santan, andaliman halus, dan bunga kecombrang\n'
        'Aduk rata, masak hingga kuah mendidih dan sedikit mengental\n'
        'Masukkan daun bawang dan tomat, masak sebentar lalu matikan api\n'
        'Rebus atau seduh mie lidi hingga matang, tiriskan\n'
        'Tata mie di mangkuk saji, siram dengan kuah dan daging panas\n'
        'Sajikan segera selagi hangat',
    tipsPenyajian:
        'Sajikan sangat panas supaya aroma andaliman dan santan tercium kuat\n'
        'Tambahkan telur rebus belah atau telur mata sapi di atasnya\n'
        'Hidangkan dengan sambal andaliman atau sambal ijo di samping\n'
        'Taburi bawang goreng dan irisan daun bawang ekstra\n'
        'Beri perasan jeruk nipis atau jeruk purut untuk kesegaran\n'
        'Cocok dimakan dengan kerupuk kulit atau empal daging goreng kering',
    sumber: 'Royco.co.id - Resep Mie Gomak Khas Batak',
  ),
  Resep(
    id: 28,
    nama: 'Sei Reuboh',
    kategori: 'Aceh',
    bahanPokok: 'Daging',
    gambar: 'assets/img/sei_reuboh.jpg',
    bahan:
        '• 1 kg daging sapi berlemak atau sandung lamur, potong kasar\n'
        '• 15 butir bawang merah\n'
        '• 5 siung bawang putih\n'
        '• 10 buah cabe merah besar\n'
        '• 5 buah cabe merah kering\n'
        '• 3 cm kunyit tua\n'
        '• 3 cm jahe\n'
        '• 1 sdt ketumbar butir\n'
        '• 1 sdt merica butir\n'
        '• 2 sdt garam\n'
        '• 3 batang serai, memarkan\n'
        '• 3 cm lengkuas, memarkan\n'
        '• 60 ml cuka aren\n'
        '• 1 sdm gula pasir\n'
        '• 1,5 liter air\n'
        '• 5 buah cabe merah kering tambahan (pelengkap)\n'
        '• 10 buah cabe rawit merah (pelengkap)',
    cara:
        'Cuci bersih daging sapi lalu potong-potong kasar\n'
        'Haluskan atau ulek kasar bawang merah, bawang putih, cabe merah besar, cabe merah kering, kunyit, jahe, ketumbar, merica, dan garam\n'
        'Masukkan potongan daging ke dalam panci besar\n'
        'Tambahkan bumbu halus, aduk rata hingga daging tercampur sempurna\n'
        'Tuang 1,5 liter air, tambahkan serai dan lengkuas yang sudah dimemarkan\n'
        'Masukkan cuka aren dan gula pasir, aduk sebentar\n'
        'Masak dengan api besar hingga mendidih, lalu kecilkan api\n'
        'Masak sambil sesekali diaduk hingga daging hampir empuk\n'
        'Tambahkan cabe merah kering dan cabe rawit utuh\n'
        'Terus masak hingga daging benar-benar empuk dan kuah menyusut berminyak\n'
        'Jika air berkurang, tambahkan air panas secukupnya\n'
        'Angkat dari api dan sisihkan',
    tipsPenyajian:
        'Sajikan Sei Reuboh selagi hangat untuk rasa gurih maksimal\n'
        'Hidangkan dengan ketupat atau nasi hangat sebagai pendamping utama\n'
        'Tambahkan irisan timun segar di samping untuk kesegaran\n'
        'Siram dengan sambal Aceh pedas atau sambal matah\n'
        'Taburi bawang merah goreng renyah di atasnya\n'
        'Nikmati bersama lalapan kemangi atau daun singkong muda\n'
        'Gunakan sebagai isian roti tawar untuk camilan variatif\n'
        'Sajikan dengan kuah sisa rebusan untuk cita rasa lebih kaya',
    sumber: 'food.detik.com',
  ),
  Resep(
    id: 29,
    nama: 'Sate Padang',
    kategori: 'Sumatera Barat',
    bahanPokok: 'Daging',
    gambar: 'assets/img/sate_padang.jpg',
    bahan:
        '• 1 kg daging sapi (bagian berlemak sedang), potong dadu sate\n'
        '• 50 ml kecap manis\n'
        '• 2 sdm minyak goreng\n'
        '• 2 siung bawang putih, haluskan\n'
        '• 1 sdt merica bubuk\n'
        '• 1 sdt garam\n'
        '• 1 sdt ketumbar bubuk\n'
        '• 1 sdt kunyit bubuk\n'
        '• 1 sdt cabe bubuk (opsional)\n'
        '• 10 tusuk sate bambu\n\n'
        'Bumbu Marinasi:\n'
        '• 8 butir bawang merah\n'
        '• 4 siung bawang putih\n'
        '• 2 cm jahe\n'
        '• 2 batang serai, ambil putihnya\n'
        '• 1 sdt ketumbar sangrai\n'
        '• ½ sdt jintan\n'
        '• Garam secukupnya\n\n'
        'Saus Sate:\n'
        '• 500 ml santan cair Sasa\n'
        '• 4 siung bawang putih, haluskan\n'
        '• 2 batang serai, memarkan\n'
        '• 5 lembar daun jeruk purut\n'
        '• 2 lembar daun salam\n'
        '• 2 cm lengkuas, memarkan\n'
        '• 1 sdm gula merah serut\n'
        '• 1 sdt garam\n'
        '• ½ sdt merica bubuk\n'
        '• Minyak untuk menumis',
    cara:
        'Haluskan semua bahan bumbu marinasi menjadi pasta halus\n'
        'Campur pasta bumbu marinasi dengan kecap manis, minyak, bawang putih halus, merica, garam, ketumbar, kunyit, dan cabe bubuk\n'
        'Rendam potongan daging sapi dalam campuran bumbu marinasi, aduk rata, dan diamkan minimal 2 jam di kulkas\n'
        'Tusuk daging ke tusuk sate, sisakan sedikit ruang di ujung tusuk\n'
        'Panggang sate di atas bara arang atau panggangan dengan api sedang sambil dibalik-balik hingga matang kecokelatan\n'
        'Siram sesekali dengan sisa marinasi selama memanggang agar lebih empuk\n\n'
        'Saus Sate: Panaskan minyak, tumis bawang putih halus, serai, daun jeruk, daun salam, dan lengkuas hingga harum\n'
        'Tuang santan, aduk rata, masukkan gula merah, garam, dan merica\n'
        'Masak dengan api kecil sambil diaduk perlahan hingga mengental 15-20 menit\n'
        'Angkat dan sisihkan',
    tipsPenyajian:
        'Sajikan sate panas dengan saus sate kental yang dituang di atasnya\n'
        'Hidangkan bersama lontong atau nasi hangat sebagai pendamping\n'
        'Tambahkan irisan timun, bawang merah, dan daun ketumbar segar di samping\n'
        'Siram dengan perasan jeruk nipis untuk kesegaran ekstra\n'
        'Taburi bawang goreng renyah di atas saus sate\n'
        'Nikmati dengan sambal cabai hijau atau sambal matah Aceh sebagai pelengkap\n'
        'Untuk variasi, tambah parutan kelapa atau kacang tanah halus ke saus\n'
        'Pilih arang berkualitas agar ada aroma asap yang khas',
    sumber: 'Sasa.co.id',
  ),
  Resep(
    id: 30,
    nama: 'Mie Tarempa',
    kategori: 'Kepulauan Riau',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/mie_tarempa.jpg',
    bahan:
        '• 150 gr mie telur gepeng\n'
        '• 250 gr ikan tongkol\n'
        '• 2 butir telur, kocok lepas\n'
        '• 1 genggam taoge\n'
        '• 1 batang daun bawang, iris tipis\n'
        '• 1 tangkai seledri, iris halus\n'
        '• 2 siung bawang putih, geprek cincang halus\n'
        '• 3 buah cabai merah\n'
        '• 2 buah cabai rawit\n'
        '• 2 sdm saus tomat\n'
        '• 2 sdm saus tiram\n'
        '• 1 sdm kecap manis\n'
        '• 1 sdm kecap asin\n'
        '• 500 ml air atau air kaldu\n'
        '• Minyak goreng secukupnya\n\n'
        'Pelengkap:\n'
        '• Bawang goreng secukupnya\n'
        '• Irisan seledri secukupnya',
    cara:
        'Kukus ikan tongkol sampai matang, kemudian haluskan kasar dengan chopper\n'
        'Rebus mie hingga setengah matang sekitar 3 menit, angkat dan tiriskan\n'
        'Haluskan cabai merah dan cabai rawit, tumis hingga harum bersama bawang putih\n'
        'Geser bumbu ke tepi wajan, masukkan telur kocok, orak-arik hingga matang\n'
        'Masukkan ikan tongkol halus dan mie rebus, aduk rata\n'
        'Tuang air kaldu atau air biasa, aduk hingga tercampur\n'
        'Tambahkan saus tiram, saus tomat, kecap manis, dan kecap asin, aduk rata\n'
        'Masukkan taoge, daun bawang, dan seledri, aduk rata\n'
        'Masak hingga mie matang, koreksi rasa, tambahkan garam jika perlu\n'
        'Tata di piring saji, taburi bawang goreng dan irisan seledri',
    tipsPenyajian:
        'Sajikan Mie Tarempa selagi panas untuk rasa gurih maksimal\n'
        'Taburi bawang goreng renyah dan irisan seledri segar di atasnya\n'
        'Hidangkan sebagai hidangan utama atau camilan ringan\n'
        'Tambahkan jeruk nipis peras untuk kesegaran ekstra\n'
        'Cocok dinikmati dengan teh hangat atau es jeruk\n'
        'Variasi: tambah udang atau cumi untuk rasa seafood lebih kaya',
    sumber: 'ResepKoki.id',
  ),
  Resep(
    id: 31,
    nama: 'Tempoyak Ikan Patin',
    kategori: 'Jambi',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/tempoyak_ikan_patin.jpg',
    bahan:
        '• 1 ekor ikan patin, potong-potong\n'
        '• 200 gr tempoyak\n'
        '• 1 ruas kunyit\n'
        '• 6 batang cabai merah\n'
        '• 7 batang cabai rawit hijau\n'
        '• ½ sdm garam halus\n'
        '• 2-3 sdm gula pasir (sesuai selera)\n'
        '• 1 sdt masako/Maggie/Royco\n'
        '• 150-200 ml air\n'
        '• 1 buah timun, potong-potong\n'
        '• 1 batang cabai merah, iris miring\n'
        '• 2 batang serai, geprek\n\n'
        'Bumbu Halus:\n'
        '• 1 ruas kunyit\n'
        '• 6 batang cabai merah\n'
        '• 7 batang cabai rawit hijau',
    cara:
        'Blender kunyit, cabai merah, dan cabai rawit hingga halus\n'
        'Siapkan kuali bersih, masukkan bumbu halus dan tempoyak\n'
        'Campur bumbu hingga rata, tambahkan gula, garam, penyedap, dan serai\n'
        'Aduk hingga tercampur rata\n'
        'Hidupkan kompor, masukkan air, masak kuah tempoyak hingga setengah matang\n'
        'Tambahkan ikan patin dan potongan timun, aduk perlahan\n'
        'Masak dengan api kecil selama 10-12 menit\n'
        'Angkat dan siap disajikan',
    tipsPenyajian:
        'Sajikan Tempoyak Ikan Patin selagi panas dengan nasi hangat\n'
        'Hidangkan dengan lalapan segar seperti timun dan daun singkong\n'
        'Tambahkan sambal cabai rawit untuk sensasi pedas lebih kuat\n'
        'Nikmati sebagai lauk utama untuk makan siang keluarga\n'
        'Variasi: ganti ikan patin dengan ikan nila atau lele segar\n'
        'Taburi bawang goreng renyah di atasnya untuk tekstur tambahan',
    sumber: 'Baradja Jambi - Resep Tempoyak Ikan Patin Khas Jambi',
  ),
  Resep(
    id: 32,
    nama: 'Tekwan',
    kategori: 'Palembang',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/tekwan.jpg',
    bahan:
        '• 250 gr ikan tenggiri, giling halus\n'
        '• 2 putih telur\n'
        '• 150 ml air es\n'
        '• 175 gr tepung tapioka\n'
        '• ½ sdm garam\n'
        '• ½ sdt penyedap rasa\n'
        '• 250 gr udang, kupas (simpan kulit & kepala)\n'
        '• 3 sdm ebi, rendam air panas & cincang\n'
        '• 15 siung bawang merah\n'
        '• 7 siung bawang putih (5 untuk bumbu kuah)\n'
        '• 1,5 liter air\n'
        '• Secukupnya garam, gula, lada bubuk\n'
        '• Secukupnya jamur kuping & bengkoang (opsional)\n'
        '• 1 batang daun bawang & seledri, iris\n'
        '• Secukupnya bawang goreng\n'
        '• Minyak goreng secukupnya\n\n'
        'Pelengkap:\n'
        '• Bihun atau soun\n'
        '• Sambal cabe rawit ulek\n'
        '• Jeruk limau\n'
        '• Kecap manis & saus sambal (opsional)',
    cara:
        'Campur daging ikan tenggiri giling dengan putih telur, aduk rata dengan tangan\n'
        'Tambahkan air es, aduk lagi hingga tercampur\n'
        'Masukkan garam dan penyedap, aduk rata\n'
        'Tambah tepung tapioka, uleni hingga kalis\n'
        'Didihkan air mendidih, ambil adonan tekwan bentuk bulat kecil, masukkan ke air mendidih\n'
        'Masak hingga tekwan mengapung, angkat sisihkan\n'
        'Kupas udang, cincang dagingnya kasar, simpan kulit & kepala\n'
        'Tumis bawang putih cincang hingga harum, masukkan kulit & kepala udang, aduk\n'
        'Tuang 1,5 liter air, rebus hingga kaldu keluar, saring sisihkan\n'
        'Tumis bawang merah, bawang putih, ebi cincang hingga harum kecokelatan\n'
        'Masukkan daging udang cincang, aduk rata sebentar\n'
        'Tuang kaldu udang, tambah garam, gula, lada, jamur kuping, bengkoang\n'
        'Masukkan tekwan yang sudah direbus, didihkan sebentar\n'
        'Taburi daun bawang & seledri, angkat',
    tipsPenyajian:
        'Sajikan tekwan selagi panas dengan bihun atau soun di dasar mangkuk\n'
        'Tuang kuah panas di atasnya hingga merata\n'
        'Taburi bawang goreng, irisan daun bawang, dan seledri segar\n'
        'Beri perasan jeruk limau untuk kesegaran\n'
        'Tambahkan kecap manis dan saus sambal sesuai selera\n'
        'Hidangkan dengan sambal cabe rawit ulek di samping\n'
        'Nikmati sebagai sup pembuka atau hidangan utama ringan',
    sumber: 'halodoc.com',
  ),
  Resep(
    id: 33,
    nama: 'Gulai Pisang',
    kategori: 'Bengkulu',
    bahanPokok: 'Daging',
    gambar: 'assets/img/gulai_pisang.jpg',
    bahan:
        '• 250 gr kulit sapi tebal, potong-potong\n'
        '• 3 buah pisang uli mentah\n\n'
        'Bumbu Halus:\n'
        '• 4 buah cabe merah keriting, rebus\n'
        '• 2 sdm bumbu dasar kuning\n'
        '• 1 sdm bumbu gulai bubuk\n\n'
        'Bumbu Cemplung:\n'
        '• 3 batang serai kecil, memarkan\n'
        '• 2 cm lengkuas, memarkan\n'
        '• 2 lembar daun salam\n'
        '• 1 buah pekak (ukuran kecil)\n'
        '• 1 buah cengkeh\n'
        '• 1 buah kapulaga\n'
        '• 1 kuku kelingking asam kandis\n\n'
        'Perasa:\n'
        '• ½ sdt garam (sesuaikan)\n'
        '• ½ sdt kaldu sapi (opsional)\n'
        '• ½ sdt gula pasir (opsional)\n\n'
        'Kuah:\n'
        '• 400 ml air\n'
        '• ½-1 sachet santan instan 65 ml\n'
        '• 2-3 sdm minyak untuk menumis\n\n'
        'Penyajian:\n'
        '• Bawang goreng secukupnya',
    cara:
        'Rebus pisang uli mentah hingga empuk dan matang, angkat tiriskan lalu iris tebal minimal 1 cm\n'
        'Cuci bersih kulit sapi, potong sesuai selera, rebus sebentar dalam air garam hingga melunak, angkat tiriskan\n'
        'Haluskan bumbu halus, tumis hingga harum dan pecah minyak\n'
        'Tambahkan bumbu cemplung, tumis sebentar lalu tuang air, didihkan hingga harum\n'
        'Masukkan perasa, cicipi dan sesuaikan rasa\n'
        'Tambahkan kulit sapi dan irisan pisang uli, masak hingga kulit empuk dan bumbu meresap\n'
        'Tuang santan, aduk rata, masak hingga mendidih kembali\n'
        'Matikan api, angkat dan pindah ke wadah saji',
    tipsPenyajian:
        'Sajikan gulai selagi hangat dengan taburan bawang goreng di atasnya\n'
        'Nikmati dengan nasi hangat atau langsung sebagai gado-gado\n'
        'Pisang uli berfungsi sebagai sumber karbohidrat alami\n'
        'Gunakan bumbu gulai atau kari sesuai selera pedas\n'
        'Cocok untuk lauk makan siang keluarga\n'
        'Variasi: tambah daun kemangi segar untuk aroma lebih kuat',
    sumber: 'cookpad.com',
  ),
  Resep(
    id: 34,
    nama: 'Seruit',
    kategori: 'Lampung',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/seruit.jpg',
    bahan:
        'Untuk Ikan:\n'
        '• 2 ekor ikan patin (atau ikan segar lain)\n'
        '• ½ sdt garam\n'
        '• 1 buah jeruk nipis\n'
        '• 1 ruas kunyit\n'
        '• 1 siung bawang putih\n'
        '• 1 sdt garam\n\n'
        'Untuk Sambal:\n'
        '• 2 sdm mangga muda, cincang\n'
        '• 2 sdm tempoyak\n'
        '• 3 buah cabai keriting\n'
        '• 5 buah cabai rawit\n'
        '• 1 buah tomat\n'
        '• 3 siung bawang merah\n'
        '• 2 siung bawang putih\n'
        '• 1 cm terasi bakar\n'
        '• 1 sdm perasan jeruk nipis\n'
        '• Garam dan gula secukupnya\n'
        '• Minyak untuk menggoreng dan menumis',
    cara:
        'Cuci bersih ikan patin, lumuri dengan garam dan perasan jeruk nipis\n'
        'Diamkan selama 10 menit, lalu bilas bersih\n'
        'Haluskan kunyit, bawang putih, dan garam\n'
        'Lumuri ikan dengan bumbu halus, diamkan 15 menit\n'
        'Goreng ikan hingga matang dan keemasan, angkat tiriskan\n'
        'Cincang halus semua bahan sambal kecuali jeruk nipis dan mangga muda\n'
        'Tumis bumbu sambal hingga harum dan matang\n'
        'Tes rasa, tambahkan garam dan gula secukupnya\n'
        'Angkat, campur dengan mangga muda cincang dan perasan jeruk nipis',
    tipsPenyajian:
        'Sajikan ikan goreng selagi panas dengan sambal mangga tempoyak di samping\n'
        'Nikmati bersama nasi hangat sebagai lauk utama\n'
        'Tambahkan lalapan segar seperti timun atau kemangi untuk kesegaran\n'
        'Variasi: gunakan ikan tenggiri atau nila untuk rasa berbeda\n'
        'Hidangkan dengan kerupuk emping atau bawang goreng taburan\n'
        'Cocok untuk makan siang keluarga ala Lampung autentik',
    sumber: 'kelampung.com',
  ),
  Resep(
    id: 35,
    nama: 'Nasi Uduk',
    kategori: 'Jakarta',
    bahanPokok: 'Beras',
    gambar: 'assets/img/nasi_uduk.jpg',
    bahan:
        '• 500 gr beras putih, cuci bersih\n'
        '• 1000 ml air\n'
        '• 250 ml santan kental\n'
        '• 2 lembar daun salam\n'
        '• 2 batang serai, memarkan\n'
        '• 3 lembar daun jeruk, sobek pinggir\n'
        '• 2 sdt garam\n'
        '• 2 sdm minyak goreng\n'
        '• 1 sdt ketumbar bubuk (opsional)\n\n'
        'Pelengkap:\n'
        '• 200 gr ayam goreng atau suwir\n'
        '• 100 gr telur balado\n'
        '• 100 gr tempe orek\n'
        '• 100 gr sambal goreng ati ampela\n'
        '• Bawang goreng secukupnya\n'
        '• Timun iris dan kerupuk',
    cara:
        'Cuci bersih beras, masukkan ke rice cooker atau panci\n'
        'Tambahkan air dan santan, aduk rata\n'
        'Masukkan daun salam, serai, daun jeruk, garam, dan minyak goreng\n'
        'Aduk semua bahan hingga tercampur\n'
        'Masak seperti memasak nasi biasa hingga matang dan airnya surut\n'
        'Jika pakai rice cooker, tekan tombol cook hingga matang\n'
        'Biarkan nasi mengembang 10 menit setelah matang\n'
        'Kukus sebentar jika perlu agar lebih pulen\n'
        'Tata di piring saji dengan pelengkap',
    tipsPenyajian:
        'Sajikan Nasi Uduk selagi hangat untuk aroma santan maksimal\n'
        'Tata nasi di tengah piring, susun lauk di sekitarnya\n'
        'Taburi bawang goreng renyah di atas nasi dan lauk\n'
        'Tambahkan irisan timun segar dan kerupuk di samping\n'
        'Nikmati dengan kuah kuah ayam atau sambal kacang\n'
        'Cocok untuk sarapan atau makan malam keluarga\n'
        'Variasi: tambah perkedel atau dendeng balado',
    sumber: 'Segari.id - Resep Nasi Uduk Sederhana',
  ),
  Resep(
    id: 36,
    nama: 'Rabeg Kambing',
    kategori: 'Banten',
    bahanPokok: 'Daging',
    gambar: 'assets/img/rabeg.jpg',
    bahan:
        '• 350 gr daging kambing\n'
        '• 250 gr usus kambing (cuci bersih, potong-potong)\n'
        '• 200 gr hati kambing\n'
        '• 4 cm jahe (memarkan)\n'
        '• 3 batang serai (ambil putihnya, memarkan)\n'
        '• 4 lembar daun jeruk purut (buang tulang daunnya)\n'
        '• 10 siung bawang merah, iris tipis\n'
        '• 4 cm jahe, iris tipis\n'
        '• 1 buah tomat merah, potong-potong\n'
        '• 5 sdm kecap manis\n'
        '• 2 sdm gula merah, sisir halus\n'
        '• 2 sdt garam\n'
        '• 1 ½ sdt merica bubuk\n'
        '• 8 butir cengkeh\n'
        '• 4 cm kayu manis\n'
        '• ½ butir biji pala (parut atau haluskan)\n'
        '• 300 ml air\n'
        '• 5 sdm minyak goreng',
    cara:
        'Rebus daging kambing, usus, dan hati kambing secara terpisah dengan campuran jahe, serai, dan daun jeruk purut sampai empuk\n'
        'Setelah itu angkat dan potong-potong sesuai selera\n'
        'Campur daging dan jeroan kambing dengan bawang merah iris, jahe iris, tomat, kecap manis, gula merah, garam, merica, cengkeh, kayu manis, pala bubuk, dan air\n'
        'Masak menggunakan api sedang sampai bumbu meresap dan air menyusut\n'
        'Beri minyak goreng lalu teruskan memasak rabeg sembari diaduk hingga rata dan keluar minyak\n'
        'Angkat dan sajikan rabeg selagi hangat',
    tipsPenyajian:
        'Sajikan Rabeg Kambing dengan nasi hangat atau ketupat untuk rasa autentik\n'
        'Tambahkan taburan bawang goreng dan irisan daun bawang di atasnya\n'
        'Hidangkan bersama acar timun, wortel, dan emping melinjo segar\n'
        'Nikmati dengan sambal cabai rawit atau sambal tomat di samping\n'
        'Variasi: tambahkan jeroan lain seperti paru atau babat untuk tekstur lebih kaya\n'
        'Cocok untuk hidangan spesial seperti Idul Adha atau acara keluarga',
    sumber: 'Kompas.com - Resep Rabeg Khas Banten',
  ),
  Resep(
    id: 37,
    nama: 'Rawon',
    kategori: 'Jawa Timur',
    bahanPokok: 'Daging',
    gambar: 'assets/img/rawon.jpg',
    bahan:
        '• 500 gr daging sapi (sengkel/sandung lamur), potong sesuai selera\n'
        '• 2 liter air\n'
        '• 4 lembar daun jeruk\n'
        '• 2 batang serai, memarkan\n'
        '• 2 lembar daun salam\n'
        '• 3 sdm minyak goreng\n'
        '• 4 butir kluwek (ambil isi, rendam air panas)\n'
        '• 1 sdm gula merah\n'
        '• Garam secukupnya\n'
        '• Bubuk MSG secukupnya\n\n'
        'Bumbu Halus:\n'
        '• 8 siung bawang merah\n'
        '• 4 siung bawang putih\n'
        '• 5 butir kemiri, sangrai\n'
        '• 1 sdt ketumbar, sangrai\n'
        '• 1 cm kunyit, bakar\n'
        '• 1 cm jahe\n'
        '• 1 cm lengkuas',
    cara:
        'Potong daging sapi sesuai selera, cuci bersih dan tiriskan\n'
        'Haluskan semua bumbu halus\n'
        'Panaskan minyak goreng, tumis bumbu halus dengan daun jeruk, serai, dan daun salam hingga harum\n'
        'Masukkan daging sapi, aduk hingga berubah warna\n'
        'Tuang air, tambahkan gula merah, garam, dan Bubuk MSG\n'
        'Masak dengan api kecil hingga daging empuk dan bumbu meresap (1,5-2 jam)\n'
        'Cicipi dan koreksi rasa\n'
        'Angkat dan siap disajikan',
    tipsPenyajian:
        'Pilih kluwek matang dan rendam air panas dulu untuk hilangkan rasa pahit\n'
        'Gunakan daging berlemak sedang agar kuah gurih dan empuk\n'
        'Masak pelan-pelan supaya bumbu meresap sempurna\n'
        'Sajikan dengan nasi hangat, tauge pendek, telur asin, sambal terasi\n'
        'Taburi bawang goreng dan tambah kerupuk udang\n'
        'Tambah tempe/tahu goreng sebagai variasi pelengkap',
    sumber: 'Sasa.co.id - Resep Rawon Daging Sapi Khas Jawa Timur',
  ),
  Resep(
    id: 38,
    nama: 'Jagung Bose',
    kategori: 'Nusa Tenggara Timur',
    bahanPokok: 'Beras',
    gambar: 'assets/img/jagung_bose.jpg',
    bahan:
        '• 1 kaleng susu jagung bose / jagung bose pulut\n'
        '• Segenggam kacang nasi putih (boleh hitam/merah)\n'
        '• Segenggam kacang hijau\n'
        '• Segenggam kacang tanah\n'
        '• ½ butir kelapa, ambil santannya secukupnya\n'
        '• 1 mangkuk kecil irisan labu kuning\n'
        '• Air secukupnya\n'
        '• Garam secukupnya\n'
        '• Penyedap rasa secukupnya (opsional)',
    cara:
        'Cuci bersih jagung bose/jagung bose pulut bersama kacang nasi sampai bersih\n'
        'Masak sampai setengah jam, lalu masukkan kacang hijau yang telah dicuci bersih\n'
        'Masak sampai benar-benar matang semua, sekitar 45 menit lagi\n'
        'Ingat, sesekali cek dan tambah air jika sudah susut, jangan sampai hangus di dasar panci/wajan\n'
        'Masukkan labu kuning dan kacang tanah\n'
        'Tunggu 5 menit, lalu masukkan santan secukupnya\n'
        'Jika ingin jagung bose dengan kuah banyak, tambahkan lebih banyak santan; jika suka yang kental, kurangi\n'
        'Baik pakai santan atau tidak, tunggu 15 menit sampai labu kuning dan kacang tanah matang, tapi jangan lebih dari itu agar rasa santan tidak terlalu kuat\n'
        'Masukkan garam, tes rasa, dan tambahkan penyedap rasa jika suka\n'
        'Siap disajikan',
    tipsPenyajian:
        'Sajikan Jagung Bose selagi hangat dengan sambal lu\'at sebagai teman wajib\n'
        'Nikmati sebagai makanan utama atau camilan bergizi\n'
        'Tambahkan irisan timun atau lalapan segar untuk kesegaran\n'
        'Variasi: ganti kacang nasi dengan warna hitam atau merah\n'
        'Jika suka kuah encer, tambah lebih banyak santan; suka kental, kurangi santan\n'
        'Cocok untuk sarapan atau hidangan keluarga ala NTT',
    sumber: 'Cookpad - Resep Jagung Bose oleh Meylan',
  ),
  Resep(
    id: 39,
    nama: 'Bubur Pedas Sambas',
    kategori: 'Kalimantan Barat',
    bahanPokok: 'Beras',
    gambar: 'assets/img/bubur_pedas.jpg',
    bahan:
        '• 300 gr beras, cuci bersih\n'
        '• 2 liter air (atau campur kaldu ikan bilis)\n'
        '• 200 gr ikan teri medan / ikan bilis, goreng kering\n'
        '• 150 gr kacang tanah goreng\n'
        '• 100 gr kelapa sangrai, haluskan kasar\n'
        '• 2 ikat daun kesum (laksa)\n'
        '• 2 ikat daun kunyit, iris halus\n'
        '• 3 lembar daun salam koja\n'
        '• 3 batang serai, memarkan\n'
        '• 1 ruas lengkuas, memarkan\n'
        '• 2 sdm santan kental (opsional)\n'
        '• Garam dan gula secukupnya\n\n'
        'Bumbu Halus:\n'
        '• 15 butir bawang merah\n'
        '• 8 siung bawang putih\n'
        '• 10 buah cabai merah keriting\n'
        '• 10 buah cabai rawit merah (sesuai selera pedas)\n'
        '• 2 cm kunyit\n'
        '• 2 cm jahe\n'
        '• 1 sdt terasi bakar\n'
        '• 1 sdt ketumbar sangrai',
    cara:
        'Rebus beras dengan 2 liter air sambil diaduk sesekali sampai jadi bubur setengah kental\n'
        'Tumis bumbu halus bersama serai, lengkuas, daun salam koja hingga harum dan matang\n'
        'Masukkan tumisan bumbu ke dalam bubur, aduk rata\n'
        'Tambahkan daun kesum, daun kunyit iris, kelapa sangrai halus, garam, dan gula\n'
        'Masak terus dengan api kecil sambil diaduk supaya tidak gosong hingga bubur benar-benar kental dan berminyak\n'
        'Cicipi rasa, tambahkan santan kental jika suka lebih gurih (opsional)\n'
        'Matikan api, buang daun-daunan yang sudah layu',
    tipsPenyajian:
        'Sajikan Bubur Pedas panas-panas di mangkuk dalam\n'
        'Taburi ikan teri goreng dan kacang tanah goreng melimpah di atasnya\n'
        'Beri sedikit kelapa sangrai tambahan untuk aroma\n'
        'Hidangkan bersama telur rebus, sambal belacan, dan jeruk limau\n'
        'Makan pakai sendok kayu ala Sambas semakin autentik\n'
        'Cocok untuk sarapan, takjil, atau makan malam keluarga',
    sumber: 'MyLittle-Kitchen – Bubur Pedas Melayu Sambas',
  ),
  Resep(
    id: 40,
    nama: 'Umbut Rotan',
    kategori: 'Kalimantan Tengah',
    bahanPokok: 'Sayur',
    gambar: 'assets/img/umbut_rotan.jpg',
    bahan:
        '• 1 kg umbut rotan muda, bersihkan dan iris tipis\n'
        '• 500 gr daging sapi atau ikan patin, potong-potong (opsional untuk variasi)\n'
        '• 200 ml santan kental\n'
        '• 3 batang serai, memarkan\n'
        '• 4 lembar daun jeruk\n'
        '• 2 cm lengkuas, memarkan\n'
        '• 2 sdm asam jawa, rendam air panas\n'
        '• Garam, gula merah, dan penyedap secukupnya\n'
        '• Minyak goreng secukupnya\n\n'
        'Bumbu Halus:\n'
        '• 10 butir bawang merah\n'
        '• 5 siung bawang putih\n'
        '• 10 buah cabai merah keriting\n'
        '• 5 buah cabai rawit (sesuai selera)\n'
        '• 3 cm kunyit\n'
        '• 2 cm jahe\n'
        '• 1 sdt terasi bakar\n'
        '• 1 sdt ketumbar sangrai',
    cara:
        'Cuci bersih umbut rotan, iris tipis, rendam air garam 15 menit untuk hilangkan getah, tiriskan\n'
        'Haluskan semua bumbu halus\n'
        'Panaskan minyak, tumis bumbu halus, serai, lengkuas, dan daun jeruk hingga harum\n'
        'Masukkan daging atau ikan jika digunakan, aduk hingga berubah warna\n'
        'Tambahkan umbut rotan, aduk rata, masak sebentar\n'
        'Tuang santan dan air asam jawa, aduk rata\n'
        'Beri garam, gula merah, dan penyedap, masak dengan api kecil hingga umbut empuk dan kuah mengental\n'
        'Koreksi rasa, angkat jika sudah matang',
    tipsPenyajian:
        'Sajikan Umbut Rotan selagi panas dengan nasi hangat sebagai lauk utama\n'
        'Taburi bawang goreng renyah dan irisan daun bawang untuk aroma\n'
        'Hidangkan dengan sambal terasi atau sambal dabu-dabu di samping\n'
        'Tambahkan lalapan timun atau daun singkong muda untuk kesegaran\n'
        'Variasi: masak tanpa daging untuk versi vegetarian, mirip sayur rebung\n'
        'Cocok untuk hidangan khas Dayak Kalimantan Tengah',
    sumber: 'KaltengPos.info - Umbut Rotan Enak Mirip Sayur Rebung',
  ),
  Resep(
    id: 41,
    nama: 'Ketupat Kandangan',
    kategori: 'Kalimantan Selatan',
    bahanPokok: 'Daging',
    gambar: 'assets/img/ketupat_kandangan.jpg',
    bahan:
        '• 1 kg daging sapi has dalam, potong kotak 3x3 cm\n'
        '• 500 gr babat sapi, potong sesuai selera\n'
        '• 500 ml air kelapa muda\n'
        '• 1 sdm gula merah, sisir halus\n'
        '• 2 sdm garam\n'
        '• 2 sdm asam jawa, seduh dengan 100 ml air panas\n'
        '• 3 sdm minyak goreng\n'
        '• 5 lembar daun jeruk, buang tulangnya\n'
        '• 4 cm lengkuas, memarkan\n'
        '• 4 batang serai, memarkan\n\n'
        'Bumbu Halus:\n'
        '• 10 siung bawang putih\n'
        '• 15 butir bawang merah\n'
        '• 10 buah cabai merah besar\n'
        '• 20 buah cabai rawit merah\n'
        '• 3 cm kunyit\n'
        '• 3 cm jahe\n'
        '• 3 butir kemiri, sangrai\n'
        '• 1 sdt ketumbar sangrai\n'
        '• 1 sdt merica butir\n'
        '• 1 ruas kunci pala\n\n'
        'Pelengkap:\n'
        '• Ketupat atau lontong\n'
        '• Taburan bawang goreng',
    cara:
        'Rebus daging sapi dan babat secara terpisah dalam air mendidih hingga empuk, angkat dan potong sesuai selera, sisihkan air rebusannya\n'
        'Haluskan semua bahan bumbu halus hingga lembut\n'
        'Panaskan minyak goreng, tumis bumbu halus hingga harum dan matang\n'
        'Masukkan daun jeruk, lengkuas, dan serai, aduk rata sebentar\n'
        'Tuang air kelapa muda dan air rebusan daging, didihkan hingga mendidih\n'
        'Masukkan daging dan babat yang sudah direbus, aduk rata\n'
        'Tambahkan gula merah, garam, dan air asam jawa, aduk hingga tercampur\n'
        'Masak dengan api kecil hingga kuah menyusut dan bumbu meresap\n'
        'Koreksi rasa, angkat dari api',
    tipsPenyajian:
        'Sajikan Ketupat Kandangan selagi panas dengan ketupat atau lontong di samping\n'
        'Taburi bawang goreng renyah di atas kuah untuk tekstur garing\n'
        'Hidangkan dengan sambal cabai rawit atau sambal tomat segar\n'
        'Tambahkan irisan timun atau daun kemangi untuk kesegaran\n'
        'Variasi: tambahkan jeroan sapi lain seperti usus untuk rasa lebih kaya\n'
        'Cocok untuk hidangan spesial seperti Idul Fitri atau acara keluarga',
    sumber: 'Dapur Umami - Resep Ketupat Kandangan',
  ),
  Resep(
    id: 42,
    nama: 'Nasi Subut',
    kategori: 'Kalimantan Utara',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/nasi_subut.jpg',
    bahan:
        'Nasi Subut:\n'
        '• 200 gr beras, cuci bersih\n'
        '• 100 gr ubi ungu, potong dadu\n'
        '• 100 gr jagung manis, pipil\n'
        '• Secukupnya air\n'
        '• Secukupnya garam\n'
        '• Secukupnya kaldu jamur\n\n'
        'Sate Ikan Pari:\n'
        '• 500 gr ikan pari, potong dadu\n'
        '• 1 sdm air jeruk nipis\n'
        '• Tusuk sate secukupnya\n'
        '• Minyak goreng secukupnya\n\n'
        'Bumbu Halus:\n'
        '• 5 butir bawang merah\n'
        '• 3 siung bawang putih\n'
        '• 2 cm kunyit\n'
        '• 1 sdt merica butir\n\n'
        'Bahan Saus:\n'
        '• 5 butir bawang merah, iris halus\n'
        '• 5 sdm saus sambal botol\n'
        '• 2 buah tomat, haluskan\n'
        '• Secukupnya gula\n'
        '• Secukupnya garam\n'
        '• Secukupnya kaldu jamur\n'
        '• Secukupnya air',
    cara:
        'Nasi Subut: Cuci bersih beras, masukkan ke rice cooker dengan air secukupnya\n'
        'Tambahkan ubi ungu potong dadu dan jagung pipil\n'
        'Beri sejumput garam dan kaldu jamur, aduk rata\n'
        'Masak seperti nasi biasa hingga matang dan air surut\n'
        'Angkat dan sisihkan\n\n'
        'Sate Ikan Pari: Rendam potongan ikan pari dengan air jeruk nipis selama 2 menit, tiriskan\n'
        'Haluskan semua bahan bumbu halus\n'
        'Lumuri ikan pari dengan bumbu halus, diamkan 15 menit\n'
        'Tusuk ikan ke tusuk sate\n'
        'Panggang di atas bara atau teflon hingga matang kecokelatan, angkat\n\n'
        'Saus: Panaskan minyak goreng, tumis bawang merah iris hingga harum\n'
        'Masukkan tomat halus, gula, garam, dan kaldu jamur, aduk rata\n'
        'Tambahkan saus sambal dan sedikit air, masak hingga mengental dan matang\n'
        'Angkat saus dan sisihkan',
    tipsPenyajian:
        'Sajikan nasi subut hangat dengan sate ikan pari di atasnya\n'
        'Siram saus sambal kental di atas sate untuk rasa pedas manis\n'
        'Taburi bawang goreng atau daun bawang iris untuk aroma\n'
        'Tambahkan lalapan timun atau kemangi segar di samping\n'
        'Nikmati selagi panas agar ikan pari tetap juicy dan nasi pulen\n'
        'Variasi: tambah kerupuk emping atau sambal matah ekstra',
    sumber:
        'Alfa InsidePontianak - Resep Nasi Subut dan Sate Ikan Pari Khas Kaltara',
  ),
  Resep(
    id: 43,
    nama: 'Tinutuan',
    kategori: 'Sulawesi Utara',
    bahanPokok: 'Beras',
    gambar: 'assets/img/tinutuan.jpg',
    bahan:
        '• 300 g beras, cuci bersih\n'
        '• 3 L air\n'
        '• 1 sdt garam\n'
        '• 2 sdt kaldu ayam bubuk\n'
        '• 100 g labu kuning, kupas, potong dadu\n'
        '• 75 g ubi jalar, kupas, potong dadu\n'
        '• 75 g jagung muda, pipil\n'
        '• 75 g bayam, petiki, cuci bersih\n'
        '• 75 g kangkung, petiki, cuci bersih\n'
        '• 4 batang daun kemangi, petiki, cuci bersih\n'
        '• 2 batang serai, memarkan\n'
        '• 1 batang daun bawang, iris halus\n'
        '• 2 lembar daun kunyit\n'
        '• 150 g ikan asin jambal, potong dadu, goreng\n'
        '• Daun melinjo secukupnya (opsional)',
    cara:
        'Dalam panci, masak beras bersama air, garam, daun bawang, serai, daun kunyit, dan kaldu ayam bubuk\n'
        'Aduk terus di atas api sedang hingga beras setengah matang\n'
        'Masukkan ubi jalar, labu kuning, dan jagung\n'
        'Aduk rata, masak hingga ubi lembut\n'
        'Masukkan bayam, kangkung, daun melinjo, dan daun kemangi\n'
        'Aduk rata, masak hingga matang dan bubur mengental\n'
        'Angkat dari api',
    tipsPenyajian:
        'Sajikan Tinutuan selagi panas dengan ikan asin goreng di samping\n'
        'Padukan dengan sambal kesukaan untuk rasa pedas tambahan\n'
        'Tambahkan taburan bawang goreng renyah untuk tekstur garing\n'
        'Nikmati sebagai sarapan bergizi atau hidangan utama\n'
        'Variasi: tambah telur rebus atau ikan segar goreng\n'
        'Hidangkan dengan jeruk nipis peras untuk kesegaran',
    sumber: 'Royco.co.id - Resep Tinutuan Khas Manado',
  ),
  Resep(
    id: 44,
    nama: 'Binte Biluhuta',
    kategori: 'Gorontalo',
    bahanPokok: 'Seafood',
    gambar: 'assets/img/binte_biluhuta.jpg',
    bahan:
        '• 500 gr ikan tuna atau cakalang segar, potong dadu besar\n'
        '• 4 buah jagung manis, pipil kasar\n'
        '• 1 butir kelapa muda, ambil airnya + parut kasar dagingnya\n'
        '• 5 lembar daun jeruk\n'
        '• 3 batang serai, memarkan\n'
        '• 2 cm jahe, memarkan\n'
        '• 2 cm lengkuas, memarkan\n'
        '• 1 ikat daun kemangi, petiki\n'
        '• 5 sdm air asam jawa\n'
        '• Garam dan gula secukupnya\n'
        '• 2 sdt kaldu ayam bubuk\n\n'
        'Bumbu Halus:\n'
        '• 8 butir bawang merah\n'
        '• 4 siung bawang putih\n'
        '• 10 buah cabai rawit merah (sesuai selera)\n'
        '• 2 cm kunyit\n'
        '• 1 sdt terasi bakar',
    cara:
        'Rebus air kelapa muda bersama serai, lengkuas, jahe, dan daun jeruk hingga harum\n'
        'Masukkan bumbu halus, aduk rata, masak hingga bau langu hilang\n'
        'Tambahkan jagung pipil, masak sampai setengah empuk\n'
        'Masukkan potongan ikan, garam, gula, kaldu ayam bubuk, dan air asam jawa\n'
        'Masak hingga ikan matang dan jagung empuk, jangan terlalu lama agar ikan tidak hancur\n'
        'Terakhir masukkan parutan kelapa muda dan daun kemangi, aduk sebentar, matikan api\n'
        'Sajikan segera selagi panas',
    tipsPenyajian:
        'Sajikan Binte Biluhuta sangat panas dalam mangkuk dalam\n'
        'Taburi bawang goreng dan daun kemangi ekstra di atasnya\n'
        'Nikmati dengan nasi hangat atau langsung sebagai sup utama\n'
        'Tambahkan perasan jeruk nipis untuk rasa lebih segar\n'
        'Padukan dengan sambal roa atau sambal dabu-dabu khas Gorontalo\n'
        'Cocok untuk menu sahur, berbuka, atau makan malam keluarga',
    sumber: 'Royco.co.id - Resep Binte Biluhuta Khas Gorontalo',
  ),
];
