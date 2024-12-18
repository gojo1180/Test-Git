% Fakta tentang anggota JKT48
oshi("Shani Indira Natio") :-
    kepribadian(elegan),
    gaya(kalem),
    minat(menari).

oshi("Feni Fitriyanti") :-
    kepribadian(ceria),
    gaya(imut),
    minat(interaksi).

oshi("Cindy Hapsari") :-
    kepribadian(humoris),
    gaya(tomboy),
    minat(bercanda).

oshi("Freyaa") :-
    kepribadian(pendiam),
    gaya(elegan),
    minat(bernyanyi).

% Predikat untuk menanyakan ke pengguna
kepribadian(K) :- 
    tanya_kepribadian(K).
gaya(G) :- 
    tanya_gaya(G).
minat(M) :- 
    tanya_minat(M).

% Tanya kepribadian
tanya_kepribadian(elegan) :- 
    tanya("Apakah Anda menyukai kepribadian elegan? (ya/tidak)").
tanya_kepribadian(ceria) :- 
    tanya("Apakah Anda menyukai kepribadian ceria? (ya/tidak)").
tanya_kepribadian(humoris) :- 
    tanya("Apakah Anda menyukai kepribadian humoris? (ya/tidak)").
tanya_kepribadian(pendiam) :- 
    tanya("Apakah Anda menyukai kepribadian pendiam? (ya/tidak)").

% Tanya gaya
tanya_gaya(kalem) :- 
    tanya("Apakah Anda menyukai gaya kalem? (ya/tidak)").
tanya_gaya(imut) :- 
    tanya("Apakah Anda menyukai gaya imut? (ya/tidak)").
tanya_gaya(tomboy) :- 
    tanya("Apakah Anda menyukai gaya tomboy? (ya/tidak)").
tanya_gaya(elegan) :- 
    tanya("Apakah Anda menyukai gaya elegan? (ya/tidak)").

% Tanya minat
tanya_minat(menari) :- 
    tanya("Apakah Anda menyukai anggota yang pandai menari? (ya/tidak)").
tanya_minat(interaksi) :- 
    tanya("Apakah Anda menyukai anggota yang interaktif dengan fans? (ya/tidak)").
tanya_minat(bercanda) :- 
    tanya("Apakah Anda menyukai anggota yang suka bercanda? (ya/tidak)").
tanya_minat(bernyanyi) :- 
    tanya("Apakah Anda menyukai anggota yang pandai bernyanyi? (ya/tidak)").

% Mekanisme pertanyaan
tanya(Pertanyaan) :-
    write(Pertanyaan), nl,
    read(Jawaban),
    Jawaban = 'ya'.

% Predikat utama untuk menjalankan sistem pakar
mulai :-
    write("Selamat datang di sistem pakar penentuan oshi JKT48!"), nl,
    write("Jawab pertanyaan berikut dengan 'ya' atau 'tidak':"), nl, nl,
    (oshi(Nama) -> 
        format("Oshi yang cocok untuk Anda adalah: ~w", [Nama]), nl;
        write("Maaf, tidak ada oshi yang cocok dengan preferensi Anda."), nl).
