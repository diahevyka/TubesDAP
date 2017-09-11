program tubes;
uses crt;

type
  barang = record
    id : integer;
    nama : string;
    jumlah : integer;
    harga : integer;
    kategori : string;
  end;

  tabel = array[1..100] of barang;

var
  jumbarang : integer;
  cari      : integer;
  a         : tabel;
  totbar    : integer;

procedure insertdatabarang(jumbarang: integer; var a:tabel);
var
  i,x: integer;
begin
  x:=0;
  repeat
  x:=x+1;
  i:=i+1;
    begin
      writeln('Input data barang ke-',i);
      write('Id barang  : ');readln(a[i].id);
      write('Nama barang: ');readln(a[i].nama);
      write('Jumlah     : ');readln(a[i].jumlah);
      write('Harga      : ');readln(a[i].harga);
      write('Kategori   : ');readln(a[i].kategori);
      write;
    end;
  until (i=jumbarang) or(x=jumbarang);
  end;

procedure editdatabarang(cari, totbar : integer; var a: tabel);
var
  i : integer;
begin
  i:=1;
  while(a[i].id<>cari) and (i<totbar) do
      begin
           i:=i+1;
      end;
  if (cari=a[i].id) then
     begin
       writeln('Edit data barang id: ',a[i].id);
       write('Nama barang  : ');readln(a[i].nama);
       write('Jumlah       : ');readln(a[i].jumlah);
       write('Harga        : ');readln(a[i].harga);
       write('Kategori     : ');readln(a[i].kategori);
       writeln;
     end
  else
     writeln('Data barang tidak ada');
end;

procedure deletedatabarang(cari, totbar: integer; var a: tabel);
var
  i:integer;
  j:integer;
begin
  i:=1;
    while(a[i].id<>cari) and (i<totbar) do
        begin
              i:= i+1;
        end;

    if (cari=a[i].id) then
        begin
             writeln('Found');
             for j:=i+1 to totbar do
               begin
                     a[j-1] := a[j];
               end;
            writeln;

        end
    else
        writeln('Data Barang tidak ada');
end;

procedure showdatabarang(totbar: integer; var a: tabel);
var
  i: integer;
begin
  if (totbar<0) then
      begin
         writeln('Maaf anda belum menginputkan data barang');
      end
  else
      begin
        writeln;
        writeln('Tampil data barang');
        writeln;
        writeln('++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++');
        writeln('++| ID Barang | Nama Barang | Jumlah | Harga | Kategori |++');
        writeln('++--------------------------------------------------------++');

        for i:=1 to totbar do
        begin
          writeln('++  ',a[i].id,'           ',a[i].nama,'             ',a[i].jumlah,'           ',a[i].harga,'      ',a[i].kategori,'       ++');
        end;
        writeln('++--------------------------------------------------------++');
      end;

end;

procedure searchiddatabarang(totbar: integer; var a: tabel);
var
  cari,i: integer;
begin
  writeln('Masukkan id barang: ');
  readln(cari);
  i:=1;
  while (cari=a[i].id) or (i<totbar) do
  begin
    if (cari=a[i].id) then
        begin
            writeln('Nama barang     : ',a[i].nama);
            writeln('Jumlah barang   : ',a[i].jumlah);
            writeln('Harga barang    : ',a[i].harga);
            writeln('Kategori barang : ',a[i].kategori);
        end;
  i:=i+1;
  end;
end;


procedure searchnamabarang(totbar: integer; var a: tabel);
var
  i: integer;
  cari : string;
begin
  writeln('Masukkan nama barang: ');
  readln(cari);
  i:=0;
  repeat
  begin
    i:=i+1;
    if (cari=a[i].nama) then
        begin
            writeln('Id barang       : ',a[i].id);
            writeln('Jumlah barang   : ',a[i].jumlah);
            writeln('Harga barang    : ',a[i].harga);
            writeln('Kategori barang : ',a[i].kategori);
        end;
  end;
  until ((cari=a[i].nama) or (i=totbar));
end;


procedure sortidbarangasc(totbar: integer; var a: tabel);
var
  i,j,min: integer;
  tmp: barang;
begin
   for i:= 1 to (totbar-1) do
      begin
        min:=i;
        for j:=i+1 to totbar do
           if (a[j].id < a[min].id) then
            begin
                 min:=j;
            end;
      tmp:=a[min];
      a[min]:=a[i];
      a[i]:=tmp;
      end;
   showdatabarang(totbar,a);
end;


procedure sortidbarangdesc(totbar: integer; var a:tabel);
var
  i,j,min: integer;
  tmp : barang;
begin
   for i:= 1 to (totbar-1) do
      begin
        min:=i;
        for j:=i+1 to totbar do
           if (a[j].id > a[min].id) then
            begin
            min:=j;
         end;
      tmp:=a[min];
      a[min]:=a[i];
      a[i]:=tmp;
      end;
   showdatabarang(totbar,a);
end;


procedure sortnamabarangdesc(totbar: integer; var a:tabel);
var
  i,j,min: integer;
  tmp: barang;
begin
   for i:= 1 to (totbar-1) do
      begin
        min:=i;
        for j:=i+1 to totbar do
           if (a[j].nama > a[min].nama) then
            begin
            min:=j;
         end;
      tmp:=a[min];
      a[min]:=a[i];
      a[i]:=tmp;
      end;
   showdatabarang(totbar,a);
end;

procedure sortnamabarangasc(totbar: integer; var a:tabel);
var
  i,j,min: integer;
  tmp: barang;
begin
   for i:= 1 to (totbar-1) do
      begin
        min:=i;
        for j:=i+1 to totbar do
           if (a[j].nama < a[min].nama) then
            begin
                 min:=j;
            end;
      tmp:=a[min];
      a[min]:=a[i];
      a[i]:=tmp;

      end;
   showdatabarang(totbar,a);
end;


procedure mainmenu();
var
  menu,sort,search : integer;
  lanjut: char;
begin
  lanjut:='t';
  repeat
  writeln('Menu utama aplikasi: ');
  writeln('1. Insert data barang');
  writeln('2. Edit data barang  ');
  writeln('3. Hapus data barang ');
  writeln('4. Tampil data barang');
  writeln('5. Search data barang');
  writeln('6. sorting data barang');
  write('Masukkan pilihan[1/2/3/4/5/6]: ');
  readln(menu);
  if (menu=1) then
  begin
      write('Masukkan banyak item barang yang akan di input: ');
      readln(jumbarang);
      insertdatabarang(jumbarang,a);
      totbar:=totbar+jumbarang;
      write('Input selesai');
      showdatabarang(totbar,a);
      readln;
  end
  else if (menu=2) then
  begin
      write('Masukkan id barang yang akan dicari: ');
      readln(cari);
      editdatabarang(cari,totbar,a);
      showdatabarang(totbar,a);
  end
  else if (menu=3) then
  begin
      write('Masukkan id barang yang akan dihapus: ');
      readln(cari);
      deletedatabarang(cari,totbar,a);
      totbar:= totbar - 1;
      showdatabarang(totbar,a);
  end
  else if (menu=4) then
  begin
      showdatabarang(totbar,a);
  end
  else if (menu=5) then
  begin
      writeln('Mencari data berdasarkan: ');
      writeln('1. ID data barang');
      writeln('2. Nama data barang');
      write('pilih: ');
      readln(search);
      if (search=1) then
      begin
         searchiddatabarang(totbar,a);
      end
      else if(search=2) then
      begin
         searchnamabarang(totbar,a);
      end
      else
      begin
        writeln('Hanya ada 2 pilihan');
      end;
  end
  else if (menu=6) then
  begin
      writeln('Urutkan data berdasarkan: ');
      writeln('1. Nama Ascending');
      writeln('2. Nama Descending');
      writeln('3. ID ascending');
      writeln('4. ID Descending');
      write('pilih: ');
      readln(sort);
      if (sort=1) then
      begin
          sortnamabarangasc(totbar, a);
      end
      else if (sort=2) then
      begin
          sortnamabarangdesc(totbar, a);
      end
      else if (sort=3) then
      begin
          sortidbarangasc(totbar, a);
      end
      else if (sort=4) then
      begin
          sortidbarangdesc(totbar, a);
      end
      else
      begin
          writeln('Maaf pilihan hanya 4');
      end;
  end;

  writeln('Tutup aplikasi? (y or t)');
  readln(lanjut);
  until ((lanjut='y') or (lanjut='Y'));

end;

//program utama
begin
  mainmenu();
end.
