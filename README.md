# magento2-docker-installer
Alat untuk install magento 2 di dalam docker (untuk belajar)

## cara menggunakan
1. ubah file auth.json.sample menjadi auth.json

2. Set username dan password untuk download magento2 di file auth.json.
   Untuk username dan password bisa di dapat di situs resmi magento

3. set lebih jauh konfigurasi magento kamu di file docker-compose.yml

4. Install docker dan install magento dengan perintah di bawah
   ```bash
   make install-docker && make install
   ```

## Catatan : 
- Konfigurasi saat ini adalah konfigurasi untuk keperluan local (localhost) dengan port 801.
- Alamat url admin akan muncul di layar `terminal` setelah installasi magento dinyatakan berhasil.
  Jika lupa alamat url admin silakan buka file app/etc/env.php.