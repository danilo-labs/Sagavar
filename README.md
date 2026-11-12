<div align="center">

# ⚡ Sagavar — Offline Language Tutor

**An AI language tutor for English, Russian and Chinese that runs entirely on your computer.**
No internet. No account. No data leaving your device.

![License](https://img.shields.io/badge/license-MIT-blue)
![Version](https://img.shields.io/badge/version-v2.2.2-8b5cf6)
![Platform](https://img.shields.io/badge/platform-Linux-success)
![RAM](https://img.shields.io/badge/RAM-4%20GB%20min-orange)
![Model](https://img.shields.io/badge/model-Qwen2.5--1.5B-informational)

![Screenshot dell'interfaccia di Sagavar](screenshot.png)

</div>

---

## ✨ Why Sagavar

- **🌍 Truly offline** — after the one-time download, everything runs locally. Perfect for low-connectivity regions, travel and privacy.
- **🤖 Ollama & KoboldCpp support** — auto-detects your setup! Works out of the box with either backend.
- **🔧 Runs on old hardware** — any PC with 4 GB RAM. The AI (Qwen 2.5 1.5B quantized) runs on the CPU.
- **🇬🇧🇷🇺🇨🇳 Three languages, one tutor** — English, Russian and Chinese, with pinyin for Chinese and automatic replies in the language you write in.
- **🔒 Privacy by design** — conversations are saved only in your browser's local storage. No server, no telemetry.
- **🎓 A tutor, not just a chat** — friendly interface with a daily streak, XP levels and a word of the day, computed locally.
- **💻 No installation** — download, double-click, chat. Responses stream token-by-token.
- **✨ New in v2.2.2** — Keyboard shortcuts (`Ctrl+Enter` to send, `Esc` to clear), Chat Export (save conversations as `.txt`), and Model Settings directly from the UI.

## 🚀 Quick start

**Requirements:** Linux (Simply Linux / ALT Linux, Ubuntu, Debian…), 4 GB RAM (8 GB recommended), ~5 GB disk, Python 3 and `wget` (usually pre-installed), internet **only** for the first run.

1. **Download the latest release** `Sagavar-v2.2.2.zip` from the [Releases page](https://github.com/danilo-labs/Sagavar/releases/latest) and extract it — you get a `Sagavar` folder.
2. Right-click `Sagavar.desktop` → **Properties → Permissions → "Allow executing file as program"**. *(If Linux blocks it, right-click → "Mark as Trusted").*
3. Double-click `Sagavar.desktop` (choose **"Run in Terminal"**). On the **first run it downloads everything automatically** (KoboldCpp + model) — then it's 100% offline forever after.
4. The launcher waits for the model to load, then opens your browser automatically. Chat away!
5. **To quit:** press `ENTER` in the terminal (or close it). All processes are stopped cleanly.

> If the browser doesn't open: go to <http://127.0.0.1:8000/sagavar.html>

## 🛠 Troubleshooting

- **Double-clicking `Sagavar.desktop` doesn't work** → right-click it → *Properties* → *Permissions* → check **"Allow executing file as program"**.
- **Linux blocks the file for security** → right-click → **"Mark as Trusted"** (Segna come fidato).
- **Alternatively**, open a terminal in the folder and run: `chmod +x avvia_sagavar.sh Sagavar.desktop && ./avvia_sagavar.sh`
- **Python not found** → `sudo apt install python3`
- **Slow start** → on old PCs the model takes up to ~1 minute to load; the launcher shows how long it waited.

## ⚠️ Known limitations (we're honest about these)

- The quantized 1.5B model can make mistakes in advanced Russian grammar and Chinese idioms.
- Best used for: conversation practice, basic translations and vocabulary.

## 🗺 Roadmap

- [x] Streaming responses (token-by-token)
- [x] Robust launcher: waits for the model, cleans up processes on exit
- [x] Friendly "Campus" UI with real streak, XP and word of the day
- [x] Auto-detect support for Ollama and KoboldCpp
- [x] UX improvements: Chat export, Keyboard shortcuts, Model settings (v2.2.2)
- [ ] Lesson engine: structured CEFR A1–B1 lessons (JSON packs)
- [ ] Windows support
- [ ] Voice practice, fully offline (whisper.cpp + piper)

## 🤝 Contributing

Issues and pull requests are welcome — check the [Roadmap](#-roadmap) above for ideas. Multilingual docs (EN/RU/ZH) improvements are especially appreciated.

## 📦 Credits

- [Ollama](https://ollama.com/) — modern local AI server
- [KoboldCpp](https://github.com/LostRuins/koboldcpp) — lightweight local AI server
- [Qwen2.5-1.5B-Instruct](https://huggingface.co/bartowski/Qwen2.5-1.5B-Instruct-GGUF) (GGUF by bartowski) — the language model

## 📄 License

MIT — free to use, study, modify and share.

---

# 🇷🇺 Русская версия

## Почему Sagavar

- **🌍 Полностью офлайн** — после первой загрузки всё работает локально.
- **🤖 Поддержка Ollama и KoboldCpp** — автоматическое определение бэкенда.
- **🔧 Работает на старом железе** — любой ПК с 4 ГБ ОЗУ.
- **🇬🇧🇷🇺🇨🇳 Три языка** — английский, русский и китайский (с пиньинем).
- **✨ Новое в v2.2.2** — Горячие клавиши (Ctrl+Enter), Экспорт чата в .txt, и Настройки модели прямо в интерфейсе.

## Быстрый старт

**Требования:** Linux, 4 ГБ ОЗУ (рекомендуется 8 ГБ), ~5 ГБ на диске, Python 3 и `wget`.

1. **Скачайте последний релиз** `Sagavar-v2.2.2.zip` со [страницы релизов](https://github.com/danilo-labs/Sagavar/releases/latest) и распакуйте.
2. Правой кнопкой по `Sagavar.desktop` → Свойства → Права → «Разрешить запуск файла как программы».
3. Двойной клик → «Запустить в терминале». При первом запуске всё скачается автоматически.
4. **Выход**: нажмите `ENTER` в терминале.

> Если браузер не открылся: <http://127.0.0.1:8000/sagavar.html>

---

# 🇨🇳 中文版

## 为什么选择 Sagavar

- **🌍 完全离线** — 首次下载后全部本地运行。
- **🤖 支持 Ollama 和 KoboldCpp** — 自动检测后端。
- **🔧 老电脑也能跑** — 4 GB 内存即可。
- **🇬🇧🇷🇺🇨🇳 三种语言** — 英语、俄语、中文（附拼音）。
- **✨ v2.2.2 新特性** — 快捷键 (Ctrl+Enter)、导出对话为 .txt 文件、界面内的模型设置。

## 快速开始

**系统要求：** Linux、4 GB 内存、约 5 GB 磁盘空间、Python 3 和 `wget`。

1. 从 [Releases 页面](https://github.com/danilo-labs/Sagavar/releases/latest) 下载最新的 `Sagavar-v2.2.2.zip` 并解压。
2. 右键 `Sagavar.desktop` → 属性 → 权限 → 勾选"允许作为程序执行文件"。
3. 双击运行（选"在终端中运行"）。首次运行会自动下载全部组件。
4. **退出**：在终端按 `ENTER`。