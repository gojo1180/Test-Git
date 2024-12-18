:- dynamic observation/1.

% Struktur utama sistem
mulai:-  
    init,  
    data_pengamatan,  
    (   rekomendasi_hp(Brand, Alasan)
    ->  write('Rekomendasi HP: '), write(Brand), nl,
        write('Alasan: '), write(Alasan), nl
    ;   default
    ),
    retractall(observation(_)).

default:-  
    rekomendasi_hp_fallback(Brand, Alasan),
    write('Rekomendasi Default: '), write(Brand), nl,
    write('Alasan: '), write(Alasan), nl,
    retractall(observation(_)).

init:-  
    write('====================SELAMAT DATANG===================='), nl,
    write('PROGRAM SISTEM PAKAR REKOMENDASI HP'), nl,
    write('Harap Jawab Pertanyaan dengan Ya(y) atau Tidak(t)'), nl,
    write('====================================================='), nl.

% Pertanyaan untuk pengguna
data_pengamatan:-  
    pertanyaan(Tanya, Obs),  
    write(Tanya), nl,  
    read(Yatidak),  
    (Yatidak=y -> assert(observation(Obs)); true),  
    fail.
data_pengamatan.

% Untuk pengujian semua kombinasi secara otomatis
data_pengamatan_otomatis:-
    generate_combination([A, B, C, D, E]),
    write('Kombinasi Jawaban: '), write([A, B, C, D, E]), nl,
    apply_observations([A, B, C, D, E]),
    (   rekomendasi_hp(Brand, Alasan)
    ->  write('Rekomendasi HP: '), write(Brand), nl,
        write('Alasan: '), write(Alasan), nl
    ;   default
    ),
    fail.
data_pengamatan_otomatis.

% Predikat untuk menghasilkan semua kombinasi jawaban
generate_combination([A, B, C, D, E]) :-
    member(A, [y, t]),
    member(B, [y, t]),
    member(C, [y, t]),
    member(D, [y, t]),
    member(E, [y, t]).

apply_observations([A, B, C, D, E]) :-
    retractall(observation(_)),
    (A = y -> assert(observation(budget_bawah_3jt)); true),
    (B = y -> assert(observation(baterai_besar)); true),
    (C = y -> assert(observation(kamera_utama)); true),
    (D = y -> assert(observation(digunakan_sehari_hari)); true),
    (E = y -> assert(observation(bermain_game)); true).

% Pertanyaan yang ditanyakan kepada pengguna
pertanyaan('Apakah budget Anda di bawah 3 juta?', budget_bawah_3jt).
pertanyaan('Apakah Anda membutuhkan baterai besar (>5000 mAh)?', baterai_besar).
pertanyaan('Apakah kamera HP adalah prioritas utama Anda (>50MP)?', kamera_utama).
pertanyaan('Apakah HP akan digunakan sehari-hari?', digunakan_sehari_hari).
pertanyaan('Apakah Anda sering bermain game berat?', bermain_game).

% Aturan Rekomendasi Komprehensif
% Kombinasi dengan 5 Ya
rekomendasi_hp('Samsung A15', 'Cocok untuk semua kebutuhan Anda, mulai dari budget terjangkau, baterai besar, kamera berkualitas, hingga gaming dan penggunaan sehari-hari.') :- 
    observation(budget_bawah_3jt), observation(baterai_besar), 
    observation(kamera_utama), observation(digunakan_sehari_hari), 
    observation(bermain_game), !.

% Kombinasi dengan 4 Ya
rekomendasi_hp('Samsung Galaxy S23 Ultra', 'Menyediakan kamera unggulan, baterai besar, performa terbaik untuk gaming, dan cocok untuk penggunaan sehari-hari.') :- 
    observation(baterai_besar), observation(kamera_utama), 
    observation(digunakan_sehari_hari), observation(bermain_game), !.

rekomendasi_hp('infinix gt10', 'Pilihan terbaik untuk budget di bawah 3 juta dengan kamera hebat, performa untuk gaming, dan penggunaan sehari-hari.') :- 
    observation(budget_bawah_3jt), observation(kamera_utama), 
    observation(digunakan_sehari_hari), observation(bermain_game), !.
rekomendasi_hp('Poco X5', 'Menyediakan baterai besar, kamera berkualitas tinggi, performa gaming, dan cocok untuk aktivitas sehari-hari.') :- 
    observation(baterai_besar), observation(kamera_utama), 
    observation(budget_bawah_3jt), observation(digunakan_sehari_hari), !.

% Kombinasi dengan 3 Ya
rekomendasi_hp('Xiaomi Redmi Note 12', 'Pilihan terbaik untuk budget di bawah 3 juta dengan baterai besar dan mendukung gaming.') :- 
    observation(budget_bawah_3jt), observation(baterai_besar), 
    observation(bermain_game), !.
rekomendasi_hp('Xiomi Redmi Note 13', 'Cocok untuk budget di bawah 3 juta, penggunaan sehari-hari, dan kamera berkualitas.') :- 
    observation(budget_bawah_3jt), observation(kamera_utama), 
    observation(digunakan_sehari_hari), !.
rekomendasi_hp('Realme Narzo 60', 'Pilihan ideal untuk budget terbatas, gaming, dan aktivitas sehari-hari.') :- 
    observation(budget_bawah_3jt), observation(bermain_game), 
    observation(digunakan_sehari_hari), !.
rekomendasi_hp('Redmi note 13 ', 'Menawarkan kamera berkualitas dan performa gaming yang baik dengan budget terjangkau.') :- 
    observation(budget_bawah_3jt), observation(kamera_utama), 
    observation(bermain_game), !.
rekomendasi_hp('Infinix Zero 30', 'Kamera bagus, gaming lancar, dan cocok untuk kebutuhan sehari-hari.') :- 
    observation(bermain_game), observation(kamera_utama), 
    observation(digunakan_sehari_hari), !.

% Kombinasi dengan 2 Ya
rekomendasi_hp('Samsung Galaxy M34', 'Baterai besar dan cocok untuk aktivitas sehari-hari.') :- 
    observation(baterai_besar), observation(digunakan_sehari_hari), !.
rekomendasi_hp('Vivo V27', 'Kamera berkualitas dan performa baik untuk gaming.') :- 
    observation(kamera_utama), observation(bermain_game), !.
rekomendasi_hp('OnePlus Nord CE 3', 'Pilihan untuk budget terbatas dengan baterai besar.') :- 
    observation(budget_bawah_3jt), observation(baterai_besar), !.

% Kombinasi dengan 1 Ya
rekomendasi_hp('tecno pova', 'Cocok untuk budget terbatas.') :- 
    observation(budget_bawah_3jt), !.
rekomendasi_hp('Huwawei pura70', 'Pilihan dengan kamera berkualitas.') :- 
    observation(kamera_utama), !.
rekomendasi_hp('Motorola Moto G Power', 'Menawarkan baterai besar.') :- 
    observation(baterai_besar), !.
rekomendasi_hp('Nokia G50', 'Cocok untuk penggunaan sehari-hari.') :- 
    observation(digunakan_sehari_hari), !.
rekomendasi_hp('ROG 6', 'Dirancang untuk gaming.') :- 
    observation(bermain_game), !.

% Fallback untuk kombinasi tanpa rekomendasi
rekomendasi_hp_fallback('Tidak Ada Rekomendasi', 'Maaf, tidak ada rekomendasi spesifik untuk kombinasi preferensi Anda. Silakan konsultasi dengan penjual HP untuk pilihan terbaik.').

% Untuk menjalankan pengujian kombinasi
jalankan_pengujian:-
    retractall(observation(_)),
    data_pengamatan_otomatis,
    write('Pengujian Selesai').