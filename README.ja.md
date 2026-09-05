# Crosspoint リーダー用 CJK フォント

[English](README.md) | [简体中文](README.zh-Hans.md) | [繁體中文](README.zh-Hant.md) | **日本語** | [한국어](README.ko.md)

[Crosspoint リーダー](https://github.com/crosspoint-reader/crosspoint-reader)
向けに変換済みの CJK（中国語・日本語・韓国語）フォントです。ダウンロードして
すぐに使えます。

## 背景

Crosspoint リーダーは標準では CJK 文字を表示できません。Web ベースの
フォント変換ツールはありますが、処理が遅く、フォントのバリエーションごとに
多くのパラメータを設定する必要があります。

このプロジェクトは最終的な `.cpfont` ファイルを自動でビルドするため、面倒な
変換作業を完全に省略できます。

## ダウンロード

[**Releases**](../../releases) ページから、言語とスタイルに合った zip を
ダウンロードしてください。

| ファイル | 内容 |
|---|---|
| `Noto-Sans-CJK-SC.zip` | 簡体字中国語、ゴシック体 |
| `Noto-Sans-CJK-TC.zip` | 繁体字中国語（台湾）、ゴシック体 |
| `Noto-Sans-CJK-HK.zip` | 繁体字中国語（香港）、ゴシック体 |
| `Noto-Sans-CJK-JP.zip` | 日本語、ゴシック体 |
| `Noto-Sans-CJK-KR.zip` | 韓国語、ゴシック体 |
| `Noto-Serif-CJK-*.zip` | 同じ 5 地域、明朝体 |

各 zip にはディレクトリ（例：`Noto Sans CJK JP/`）が 1 つ含まれ、
**8・10・12・14・16・18** の 6 サイズの `.cpfont` ファイルが入っています。
各サイズとも**レギュラーとボールド**の 2 ウェイトを収録し、Noto Sans/Serif
由来のラテン文字・ギリシャ文字・キリル文字のフォールバックグリフも含みます。

## 使い方

1. 言語とスタイルに合ったパッケージをダウンロードして解凍します。
2. 解凍したディレクトリ（例：`Noto Sans CJK JP`）を microSD カードの
   `/fonts` ディレクトリにコピーします。
3. microSD カードを挿入して再起動し、端末の読書設定で新しいフォントを
   選択します。

## 文字が表示されない場合は、ぜひ報告してください！

ファイルサイズを抑えるため、変換時には一部の Unicode 範囲のみを含めています。
書籍内の文字が**空白の四角（豆腐）**として表示される場合は、
[**「Missing characters」issue**](../../issues/new?template=missing-glyphs.yml)
を作成してください。表示されない文字を貼り付けるだけで構いません
（Unicode コードポイントと言語の記入は任意です）。皆さんの報告が全ユーザーの
文字カバレッジ改善に直結します。

その他の問題（フォントが読み込めない、字形が日本の字体と異なる、字間の
不具合など）は[バグ報告テンプレート](../../issues/new?template=bug-report.yml)
をご利用ください。

## 自分でビルドする

必要なもの：`bash`、`curl`、`unzip`、`git`、[uv](https://docs.astral.sh/uv/)

```bash
git clone --depth 1 https://github.com/crosspoint-reader/crosspoint-reader.git
./download_fonts.bash    # バージョン固定の Noto ソースフォントを tmp/ に取得
uv sync                  # fonttools と freetype-py をインストール
./cjk_font_convert.bash  # "Noto <種類> CJK <地域>/" ディレクトリを生成
```

`.github/workflows/release.yml` の GitHub Actions ワークフローは、まったく
同じ手順を実行します。`v*` タグを push すると zip がリリースに添付され、
手動実行（workflow_dispatch）ではリリースを作成せずビルド成果物のみを
生成します。

## ライセンス

- このリポジトリの変換スクリプトとワークフローは **GNU GPL v2**
  （[LICENSE](LICENSE)）でライセンスされています。
- フォント自体（Noto ソースフォントおよび変換後の `.cpfont` ファイル）は
  **SIL Open Font License 1.1**（[OFL.txt](OFL.txt)）でライセンスされて
  おり、各リリース zip にライセンス文が同梱されています。

## クレジット

- フォント：[Noto CJK](https://github.com/notofonts/noto-cjk)（© Adobe）、
  [Noto Latin/Greek/Cyrillic](https://github.com/notofonts/latin-greek-cyrillic)
  （© The Noto Project Authors）、SIL Open Font License 1.1。
- 変換ツール：[Crosspoint リーダー](https://github.com/crosspoint-reader/crosspoint-reader)
  プロジェクトの `fontconvert_sdcard.py`（MIT ライセンス）。
