# VHDL Snake Game (LED Tabanlı Basit Yılan Oyunu)

## Açıklama (Türkçe)

Bu proje, VHDL ile yazılmış basit bir LED tabanlı **yılan oyunu (snake game)** benzeri uygulamadır. Sekiz adet LED kullanılarak, aktif LED'in yön tuşlarına basıldıkça hareket ettirilmesi sağlanır. Kenarlara ulaşıldığında özel davranışlar tetiklenir ve oyun mekaniği temel düzeyde gerçekleştirilir.

Kullanıcı, dört adet yön butonunu (`btn_up`, `btn_down`, `btn_left`, `btn_right`) kullanarak aktif LED'in konumunu değiştirebilir. Oyunda kenarlara çarpma algılanır ve LED’in yönü değiştirilebilir. Sistemde 12 MHz saat sinyali üzerinden zaman kontrolü yapılmaktadır.

### Özellikler

- 8-bit LED dizisi üzerinde hareket eden "yılan başı"
- Dört yön tuşu desteği: yukarı, aşağı, sağ, sol
- Kenarlara çarpma ve tepki kontrolü
- 12 MHz saat ile zaman kontrollü hareket
- Basit oyun mantığıyla simülasyon veya FPGA gösterimi için uygun

### Portlar

| Port        | Yön | Açıklama                            |
|-------------|-----|-------------------------------------|
| clk         | in  | Sistem saat sinyali (12 MHz)       |
| btn_right   | in  | Sağ yön tuşu                        |
| btn_left    | in  | Sol yön tuşu                        |
| btn_up      | in  | Yukarı yön tuşu                     |
| btn_down    | in  | Aşağı yön tuşu                      |
| led         | inout | 8-bit LED çıkışı (aktif LED konumu) |

### Nasıl Kullanılır

1. `snakeGame.vhd` dosyasını projenize ekleyin.
2. Buton girişlerini FPGA kartınıza bağlayın.
3. `clk` sinyalini 12 MHz olarak ayarlayın veya `clk_freq` sabitini değiştirin.
4. Sistemi simüle edin veya FPGA üzerinde çalıştırarak LED hareketini kontrol edin.
5. Butonlara birer kez bastığınızda aktif LED konumu değişecektir.

---

## Description (English)

This project implements a basic **snake-style LED game** written in VHDL. It simulates a moving LED head across an 8-bit LED strip. The LED position can be controlled using four directional inputs: up, down, left, and right. When reaching the edges, the LED behavior changes according to basic game logic.

Button edge detection ensures that movement only occurs on new button presses. A 12 MHz system clock is used for timing, ensuring one move per second (adjustable via `clk_freq` constant).

### Features

- 8-bit LED array with controllable LED position
- Directional control: up, down, left, right
- Edge collision handling
- Clock-based movement using 12 MHz input
- Suitable for simulation or FPGA demonstration

### Ports

| Port        | Direction | Description                          |
|-------------|-----------|--------------------------------------|
| clk         | in        | System clock (12 MHz)                |
| btn_right   | in        | Move LED to the right                |
| btn_left    | in        | Move LED to the left                 |
| btn_up      | in        | Move LED upward (jump 4 positions)   |
| btn_down    | in        | Move LED downward (jump -4 positions)|
| led         | inout     | 8-bit LED output (current position)  |

### How to Use

1. Add the `snakeGame.vhd` file to your VHDL project.
2. Connect the directional buttons to your FPGA board.
3. Use a 12 MHz clock signal or adjust the `clk_freq` constant.
4. Simulate or run on hardware to observe the LED movement.
5. Press directional buttons to shift the LED position.


