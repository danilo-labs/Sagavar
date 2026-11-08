<div align="center">

# ⚡ Sagavar — Offline Language Tutor

**An AI language tutor for English, Russian and Chinese that runs entirely on your computer.**
No internet. No account. No data leaving your device.

![License](https://img.shields.io/badge/license-MIT-blue)
![Platform](https://img.shields.io/badge/platform-Linux-success)
![RAM](https://img.shields.io/badge/RAM-4%20GB%20min-orange)
![Model](https://img.shields.io/badge/model-Qwen2.5--1.5B-informational)

![Screenshot dell'interfaccia di Sagavar](screenshot.png)

</div>

---

## ✨ Why Sagavar

- **🌍 Truly offline** — after the one-time download, everything runs locally. Perfect for low-connectivity regions, travel and privacy.
- **🔧 Runs on old hardware** — any PC with 4 GB RAM. The AI (KoboldCpp + Qwen 2.5 1.5B quantized) runs on the CPU.
- **🇬🇧🇷🇺🇨🇳 Three languages, one tutor** — English, Russian and Chinese, with pinyin for Chinese and automatic replies in the language you write in.
- **🔒 Privacy by design** — conversations are saved only in your browser's local storage. No server, no telemetry, no tracking.
- **🎓 A tutor, not just a chat** — friendly interface with a daily streak, XP levels and a word of the day, all computed locally from your real activity. No gimmicks, no accounts.
- **💻 No installation** — download, double-click, chat. Responses stream token-by-token, so you start reading immediately even on slow CPUs.

## 🚀 Quick start

**Requirements:** Linux (Simply Linux / ALT Linux, Ubuntu, Debian…), 4 GB RAM (8 GB recommended), ~5 GB disk, Python 3 and `wget` (usually pre-installed), internet **only** for the first run.

1. **Download this repository** (green "Code" button → "Download ZIP") and extract it — you get a `Sagavar` folder.
2. Right-click `avvia_sagavar.sh` → **Properties → Permissions → "Allow executing file as program"**.
3. Double-click it (choose **"Run in Terminal"**). On the **first run it downloads everything automatically** (KoboldCpp ~500 MB + model ~1.3 GB, resumable if interrupted) — then it's 100% offline forever after.
4. The launcher waits for the model to load, then opens your browser automatically. Chat away — try `Say 'hello' in Chinese`.
5. **To quit:** press `ENTER` in the terminal (or close it). All processes are stopped cleanly.

> If the browser doesn't open: go to <http://127.0.0.1:8000/sagavar.html>
>
> Prefer manual download? Put these two files into the `Sagavar` folder yourself: `koboldcpp-linux-x64-nocuda` from [the latest release](https://github.com/LostRuins/koboldcpp/releases/latest) and `Qwen2.5-1.5B-Instruct-Q4_K_M.gguf` from [bartowski on Hugging Face](https://huggingface.co/bartowski/Qwen2.5-1.5B-Instruct-GGUF).

## 🛠 Troubleshooting

- **Python not found** → `sudo apt install python3`
- **"manca koboldcpp…" / model errors** → make sure both downloaded files are in the `Sagavar` folder and the filenames match exactly; details in `kobold.log`
- **Slow start** → on old PCs the model takes up to ~1 minute to load; the launcher shows how long it waited
- **Port already in use** → a previous Sagavar is still running; the launcher reuses it automatically

## ⚠️ Known limitations (we're honest about these)

- The quantized 1.5B model can make mistakes in advanced Russian grammar and Chinese idioms.
- For complex questions (proverbs, subtle grammar differences) it may answer imprecisely or ask you to rephrase.
- Best used for: conversation practice, basic translations and vocabulary.

## 🗺 Roadmap

- [x] Streaming responses (token-by-token)
- [x] Robust launcher: waits for the model, cleans up processes on exit
- [x] Friendly "Campus" UI with real streak, XP and word of the day
- [ ] Lesson engine: structured CEFR A1–B1 lessons (JSON packs)
- [ ] Spaced repetition (FSRS) for vocabulary
- [ ] Deterministic language tools: exact Russian declension tables (pymorphy3), automatic pinyin (pypinyin)
- [ ] Newer default model (Qwen3-1.7B) and an 8 GB "Plus" profile (Qwen3-4B)
- [ ] One-command installer with checksums + mirror fallback
- [ ] Windows support
- [ ] Voice practice, fully offline (whisper.cpp + piper)

## 🤝 Contributing

Issues and pull requests are welcome — check the [Roadmap](#-roadmap) above for ideas. Multilingual docs (EN/RU/ZH) improvements are especially appreciated.

## 📦 Credits

- [KoboldCpp](https://github.com/LostRuins/koboldcpp) — the local AI server
- [Qwen2.5-1.5B-Instruct](https://huggingface.co/bartowski/Qwen2.5-1.5B-Instruct-GGUF) (GGUF by bartowski) — the language model
- The UI is a single HTML file with no dependencies: it works with zero internet.

## 📄 License

MIT — free to use, study, modify and share.

---

# 🇷🇺 Русская версия

## Почему Sagavar

- **🌍 Полностью офлайн** — после первой загрузки всё работает локально. Идеально для регионов со слабым интернетом, поездок и приватности.
- **🔧 Работает на старом железе** — любой ПК с 4 ГБ ОЗУ, ИИ работает на процессоре без видеокарты.
- **🇬🇧🇷🇺🇨🇳 Три языка** — английский, русский и китайский (с пиньинем), ответы приходят на языке вашего вопроса.
- **🔒 Приватность** — диалоги хранятся только в вашем браузере. Ни серверов, ни телеметрии.
- **💻 Без установки** — скачал, запустил, общаешься. Ответ печатается постепенно, поэтому читать можно сразу.

## Быстрый старт

1. **Скачайте репозиторий** (зелёная кнопка "Code" → "Download ZIP") и распакуйте — получите папку `Sagavar`.
2. **Скачайте два файла** в эту папку:
   - **KoboldCpp**: `koboldcpp-linux-x64-nocuda` со [страницы релизов](https://github.com/LostRuins/koboldcpp/releases/latest)
   - **Модель**: `Qwen2.5-1.5B-Instruct-Q4_0.gguf` с [Hugging Face (bartowski)](https://huggingface.co/bartowski/Qwen2.5-1.5B-Instruct-GGUF)
3. Правой кнопкой по `avvia_sagavar.sh` → Свойства → Права → «Разрешить запуск».
4. Двойной клик → «Запустить в терминале». Лаунчер дождётся загрузки модели и сам откроет браузер.
5. Задавайте вопросы, например `Say 'hello' in Chinese`.
6. **Выход**: нажмите `ENTER` в терминале — все процессы корректно завершатся.

> Если браузер не открылся: <http://127.0.0.1:8000/sagavar.html>

## Решение проблем

- **Python не найден** → `sudo apt install python3`
- **Ошибки файлов** — проверьте, что оба файла лежат в папке `Sagavar` и имена совпадают; подробности в `kobold.log`
- **Медленный старт** — на старых ПК модель грузится до минуты, лаунчер покажет время ожидания

## Известные ограничения

Квантованная модель 1.5B может ошибаться в сложной русской грамматике и китайских идиомах. Лучше всего подходит для практики разговора, базовых переводов и пополнения словарного запаса. Честно об этом пишем — и работаем над этим (см. Roadmap выше).

---

# 🇨🇳 中文版

## 为什么选择 Sagavar

- **🌍 完全离线** — 首次下载后全部本地运行，适合网络不便的地区，保护隐私。
- **🔧 老电脑也能跑** — 4 GB 内存即可，AI 在 CPU 上运行，无需显卡。
- **🇬🇧🇷🇺🇨🇳 三种语言** — 英语、俄语、中文（附拼音），并用你提问的语言回答。
- **🔒 隐私** — 对话只保存在你的浏览器里，没有服务器、没有追踪。
- **💻 无需安装** — 下载、双击、开始聊天。回答逐字显示，慢速 CPU 上也能立刻开始阅读。

## 快速开始

1. **下载本仓库**（绿色 "Code" → "Download ZIP"）并解压，得到 `Sagavar` 文件夹。
2. **下载两个文件**放入该文件夹：
   - **KoboldCpp**：`koboldcpp-linux-x64-nocuda`，来自[最新发布页](https://github.com/LostRuins/koboldcpp/releases/latest)
   - **模型**：`Qwen2.5-1.5B-Instruct-Q4_0.gguf`，来自 [Hugging Face (bartowski)](https://huggingface.co/bartowski/Qwen2.5-1.5B-Instruct-GGUF)
3. 右键 `avvia_sagavar.sh` → 属性 → 权限 → 勾选"允许作为程序执行"。
4. 双击运行（选"在终端中运行"），启动器会等待模型加载并自动打开浏览器。
5. 开始提问，例如 `Say 'hello' in Chinese`。
6. **退出**：在终端按 `ENTER`，所有进程会被干净地结束。

> 如果浏览器没有打开：<http://127.0.0.1:8000/sagavar.html>

## 已知限制

量化后的 1.5B 模型在高级俄语语法和中文成语上可能出错，最适合对话练习、基础翻译和词汇学习。我们对此保持诚实，并正在改进（见上方 Roadmap）。
