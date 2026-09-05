# Crosspoint 閱讀器 CJK 字型

[English](README.md) | [简体中文](README.zh-Hans.md) | **繁體中文** | [日本語](README.ja.md) | [한국어](README.ko.md)

為 [Crosspoint 閱讀器](https://github.com/crosspoint-reader/crosspoint-reader)
預先轉換好的 CJK（中文、日文、韓文）字型，下載即用。

## 背景

Crosspoint 閱讀器出廠時不支援 CJK 字元顯示。雖然官方提供了網頁版字型轉換工具，
但轉換過程緩慢，且每個字型變體都需要手動設定多個參數。

本專案自動建置最終的 `.cpfont` 檔案，讓你完全跳過繁瑣的轉換過程。

## 下載

前往 [**Releases**](../../releases) 頁面，下載適合你語言和風格的壓縮檔：

| 檔案 | 內容 |
|---|---|
| `Noto-Sans-CJK-SC.zip` | 簡體中文，黑體（無襯線） |
| `Noto-Sans-CJK-TC.zip` | 繁體中文（臺灣），黑體 |
| `Noto-Sans-CJK-HK.zip` | 繁體中文（香港），黑體 |
| `Noto-Sans-CJK-JP.zip` | 日文，黑體 |
| `Noto-Sans-CJK-KR.zip` | 韓文，黑體 |
| `Noto-Serif-CJK-*.zip` | 同樣五個地區變體，明體（襯線） |

每個壓縮檔內含一個目錄（如 `Noto Sans CJK TC/`），包括 **8、10、12、14、16、18**
六個字級的 `.cpfont` 檔案，每個字級均含**標準與粗體**兩種字重，並附帶來自
Noto Sans/Serif 的拉丁字母、希臘字母和西里爾字母後備字形。

## 使用方法

1. 下載並解壓縮適合你語言和風格的壓縮檔。
2. 將解壓出的目錄（如 `Noto Sans CJK TC`）複製到 microSD 卡的 `/fonts` 目錄。
3. 插入 microSD 卡並重新啟動裝置，然後在閱讀設定中選擇新字型。

## 遇到缺字？請告訴我們！

為控制檔案大小，轉換時只包含了部分 Unicode 區段。如果書中有字元顯示為
**空白方塊（豆腐字）**，請
[**提交「缺字回報」issue**](../../issues/new?template=missing-glyphs.yml)——
只需貼上無法顯示的字元，可選填 Unicode 碼位和語言。你的回報會直接改善所有人的
字元涵蓋率。

其他問題（字型無法載入、字形不符合本地寫法、間距異常等）請使用
[Bug 回報範本](../../issues/new?template=bug-report.yml)。

## 自行建置

需求：`bash`、`curl`、`unzip`、`git` 和 [uv](https://docs.astral.sh/uv/)。

```bash
git clone --depth 1 https://github.com/crosspoint-reader/crosspoint-reader.git
./download_fonts.bash    # 下載固定版本的 Noto 來源字型到 tmp/
uv sync                  # 安裝 fonttools 和 freetype-py
./cjk_font_convert.bash  # 產生 "Noto <風格> CJK <地區>/" 目錄
```

`.github/workflows/release.yml` 中的 GitHub Actions 工作流程執行完全相同的步驟：
推送 `v*` 標籤時自動建置並將壓縮檔附加到 Release；手動觸發（workflow_dispatch）
則只產生建置成品而不建立 Release。

## 授權

- 本儲存庫中的轉換腳本和工作流程採用 **GNU GPL v2** 授權（[LICENSE](LICENSE)）。
- 字型本身（包括 Noto 來源字型和轉換後的 `.cpfont` 檔案）採用
  **SIL Open Font License 1.1** 授權（[OFL.txt](OFL.txt)），每個 Release
  壓縮檔中均附帶該授權文本。

## 致謝

- 字型：[Noto CJK](https://github.com/notofonts/noto-cjk)（© Adobe）與
  [Noto Latin/Greek/Cyrillic](https://github.com/notofonts/latin-greek-cyrillic)
  （© The Noto Project Authors），SIL Open Font License 1.1 授權。
- 轉換工具：來自 [Crosspoint 閱讀器](https://github.com/crosspoint-reader/crosspoint-reader)
  專案的 `fontconvert_sdcard.py`（MIT 授權）。
