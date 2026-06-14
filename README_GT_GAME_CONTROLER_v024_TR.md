# GT GAME CONTROLER V024 - Temiz Baştan Paket

Bu paket eski karışan V015/V016/V020 dosyalarına bağlı değildir. Amaç net:

- `piko1.uf2`  → Player 1 absolute mouse, aktif/pasif GP19
- `piko2.uf2`  → Player 2 absolute mouse, aktif/pasif GP19
- `controller.uf2` → Controller Pico: tuşlar + coin + tetik + röle + 3 dakika süre
- `GT_GAME_CONTROLER_v024.bat` → Programı açar
- `gt_game_controler_v024.py` → V021 tarzı renkli program

## Controller ayarları programdan seçilir

Programdaki **Controller Ayar** ekranından şunlar seçilir:

- P1 coin GP
- P2 coin GP
- P1 tetik GP
- P2 tetik GP
- P1 röle GP
- P2 röle GP
- Röle tipi: HIGH / LOW
- Coin tipi: DRY / HIGH

Varsayılan:

- P1 coin: GP17
- P2 coin: GP21
- P1 tetik: GP7
- P2 tetik: GP11
- P1 röle: GP26
- P2 röle: GP27

## Çalışma mantığı

1. Coin gelince ilgili oyuncu aktif olur.
2. Tetik basılınca seçilen röle GP çeker.
3. Tetik bırakılınca röle bırakır.
4. 3 dakika boyunca tetik basılmazsa oyuncu pasif olur.
5. Tekrar çalışması için yeniden coin gerekir.

## GitHub Actions ile UF2 üretme

1. GitHub'da tercihen yeni repo aç: `GT_GAME_CONTROLER_V024`
2. Bu paketin içindeki tüm dosya/klasörleri yükle.
3. `.github/workflows/build_uf2.yml` mutlaka depoda olmalı.
4. **Eylemler / Actions** sekmesine gir.
5. **Build GT GAME CONTROLER V024 UF2** işini çalıştır.
6. Yeşil tikten sonra **Yapıtlar / Artifacts** içinden ZIP indir.
7. ZIP içinden `controller.uf2`, `piko1.uf2`, `piko2.uf2` çıkar.

## İlk test

1. Önce sadece Controller Pico'ya `controller.uf2` yükle.
2. Not Defteri aç.
3. Varsayılan test: GP6 → GND = `5` yazmalı.
4. Programı aç: `GT_GAME_CONTROLER_v024.bat`
5. Cihazları Tara / Yenile yap.
6. Controller Ayar kısmından pinleri seçip **Kaydet**.
7. Röle Testi kısmından P1/P2 röle test et.

## Önemli güvenlik

- Pico GPIO pinlerine direkt 5V verme.
- 5V coin pulse için optokuplör veya seviye düşürücü kullan.
- Röle kartı VCC/V+ Pico VBUS olabilir, ama motoru Pico'dan besleme.
- Motor ayrı 12V adaptörden beslensin.

