
% Metode newton raphson oleh: H. A. Nurham. (hmprivates.blogspot.com)

% Membersihkan variabel sebelumnya dan mengosongkan command window
% Mendefinisikan variabel x
clear all
clc; syms x

% Judul program
disp('METODE NEWTON RAPHSON')
disp('=====================')

% Input persamaan dan tebakan nilai akar awal.
f=input('Persamaan  : ');
a=input('Nilai awal : ');

% Menghitung turunan pertama dari persamaan f(x)
ft=diff(f,x);

  disp('------------')
  
% Pemilihan sistem penentuan jika (1) galat jika (2) iterasi  
  disp('Sistem penentuan hampiran akar.')
  disp('1. Galat   2. Iterasi')
  pil=input('Pilih : ');
  switch pil

% Pilihan 1, hampiran akar berdasarkan nilai galat.      
      case 1

% Menentukan nilai galat.          
gal=input('Galat : ');
clc 

% contoh soal.
% f=exp(x)-5*x^2;
% a=0.5;
% gal=0.00001;

% Judul sub program (sub perhitungan)
disp('METODE NEWTON RAPHSON - Galat')
disp('=====================')

% Menampilkan ringkasan input.
h=sprintf('f(x)  = %s',char(f));
disp(h)
ha=sprintf('f"(x) = %s',char(ft));
disp(ha)
fprintf('Tebakan awal akar x0 = %.2f\n',a)
fprintf('Galat = %.5f\n',gal)
disp('---------------')

% cek keteradaan akar
if abs(subs(f,a))<gal
    fprintf('Maka hampiran akar = %.4f\n',a)
    return
end

% Menghitung nilai xn dan error ( |xn - xn-1| )
b=a-(subs(f,a)/subs(ft,a));
er=abs(b-a);

% Nilai iterasi 0
i=0;

% Kepala tabel perhitungan (iterasi)
disp(' i      xi         xi+1       error')
disp('------------------------------------')

% Memulai perulangan berdasarkan nilai error 
% Selama error > nilai galat soal
while er>gal  
    b=a-(subs(f,a)/subs(ft,a));
    er=abs(b-a);
    
    % Iterasi dimulai dari 1.
    i=i+1;
    
    % Menampilkan setiap variabel dalam perhitungan.
    fprintf('%2.d %10.5f %10.5f %11.5f\n',i,a,b,er)
    
    % Pada iterasi selanjutnya nilai xn+1 menjadi xn.
    if er>gal
    a=b;
    end
end

% Menampilkan ringkasan perhitungan.
disp('------------------------------------')
fprintf('Maka solusi hampiran akar = %.5f\n',b)
fprintf('Pada iterasi ke %d\n',i+1)

% Kondisi kedua (pilihan iterasi)
      case 2
          
% Menentukan jumlah iterasi maksimum perhitungan          
it=input('Iterasi maks : ');
clc 

% Menampilkan sub judul program (sub perhitungan)
disp('METODE NEWTON RAPHSON - Iterasi')
disp('=====================')

% Ringkasan input perhitungan.
h=sprintf('f(x) = %s',char(f));
disp(h)
ha=sprintf('f"(x) = %s',char(ft));
disp(ha)
fprintf('Tebakan awal akar x0 = %.2f\n',a)
fprintf('Iterasi Maks = %d\n',it)
disp('---------------')

% Menghitung turunan pertama dari persamaan f(x)
ft=diff(f,x);

% Menghitung nilai xn
b=a-(subs(f,a)/subs(ft,a));

% Menghitung nilai ( |xn - xn-1| )
er=abs(b-a);

% Kepala tabel perhitungan (iterasi)
disp(' i      xi         xi+1    |xi+1 - xi|')
disp('--------------------------------------')

% Memulai perulangan berdasarkan iterasi maksimum 
% Perulangan akan berlanjut hingga mencapai iterasi maksimum
 for i=1:it
     
    b=a-(subs(f,a)/subs(ft,a));
    er=abs(b-a);
    
    % Menampilkan setiap variabel dalam perhitungan.
    fprintf('%2.d %10.5f %10.5f %11.5f\n',i,a,b,er)
    
    % Pada iterasi selanjutnya nilai xn+1 menjadi xn.
    if i<it
    a=b;
    end
 end
 
% Menampilkan ringkasan perhitungan. 
disp('--------------------------------------')
fprintf('Maka solusi hampiran akar = %.5f\n',a)

      % Jika pilihan masukkan oleh pengguna tidak sesuai
      % maka perhitungan secara otomatis keluar
      otherwise
          disp('Pilihan tidak sesuai!')
          return
  end