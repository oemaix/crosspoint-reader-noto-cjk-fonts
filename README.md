# Crosspoint Reader CJK Fonts

**English** | [简体中文](README.zh-Hans.md) | [繁體中文](README.zh-Hant.md) | [日本語](README.ja.md) | [한국어](README.ko.md)

Pre-converted CJK (Chinese, Japanese, Korean) fonts for the
[Crosspoint reader](https://github.com/crosspoint-reader/crosspoint-reader),
ready for immediate download and use.

## The Problem

Out of the box, the Crosspoint reader lacks native CJK character support.
While there is a web-based font conversion tool available, the process is
slow and requires configuring multiple parameters for every single font
variation.

This project builds the final `.cpfont` files automatically so you can skip
the tedious conversion process entirely.

## Download

Grab the zip for your language and style from the
[**Releases**](../../releases) page:

| Asset | Contents |
|---|---|
| `Noto-Sans-CJK-SC.zip` | Simplified Chinese, sans-serif |
| `Noto-Sans-CJK-TC.zip` | Traditional Chinese (Taiwan), sans-serif |
| `Noto-Sans-CJK-HK.zip` | Traditional Chinese (Hong Kong), sans-serif |
| `Noto-Sans-CJK-JP.zip` | Japanese, sans-serif |
| `Noto-Sans-CJK-KR.zip` | Korean, sans-serif |
| `Noto-Serif-CJK-*.zip` | Same five regions, serif |

Each zip contains one directory (e.g. `Noto Sans CJK HK/`) with `.cpfont`
files in sizes **8, 10, 12, 14, 16 and 18**, each with **Regular and Bold**
weights, plus Latin/Greek/Cyrillic fallback glyphs from Noto Sans/Serif.

## How to Use

1. Download and unzip the package for your preferred language and style.
2. Copy the contained directory (e.g. `Noto Sans CJK HK`) into the `/fonts`
   directory of the microSD card.
3. Insert the microSD card, reboot, and select the new font in the reading
   settings of your device.

## Missing Characters? Please Report Them!

To keep file sizes manageable, only selected Unicode ranges are converted.
If any character in your books shows up as a **blank box (tofu)**, please
[**open a "Missing characters" issue**](../../issues/new?template=missing-glyphs.yml)
— just paste the affected characters, and optionally their Unicode code
points and your language. Your reports directly improve the coverage for
everyone.

For any other problem (font not loading, wrong glyph shapes, spacing
issues), use the [bug report template](../../issues/new?template=bug-report.yml).

## Building Yourself

Requirements: `bash`, `curl`, `unzip`, `git` and [uv](https://docs.astral.sh/uv/).

```bash
git clone --depth 1 https://github.com/crosspoint-reader/crosspoint-reader.git
./download_fonts.bash    # fetches pinned Noto sources into tmp/
uv sync                  # installs fonttools + freetype-py
./cjk_font_convert.bash  # writes "Noto <kind> CJK <region>/" directories
```

The GitHub Actions workflow in `.github/workflows/release.yml` runs exactly
these steps and attaches the zipped results to a release whenever a `v*` tag
is pushed. A manual `workflow_dispatch` run produces the same zips as build
artifacts without creating a release.

## License

- The conversion scripts and workflow in this repository are licensed under
  the **GNU GPL v2** ([LICENSE](LICENSE)).
- The fonts (both the Noto sources and the converted `.cpfont` files) are
  licensed under the **SIL Open Font License 1.1** ([OFL.txt](OFL.txt)),
  which is included in every release zip.

## Credits

- Fonts: [Noto CJK](https://github.com/notofonts/noto-cjk) (© Adobe) and
  [Noto Latin/Greek/Cyrillic](https://github.com/notofonts/latin-greek-cyrillic)
  (© The Noto Project Authors), licensed under the SIL Open Font License 1.1.
- Converter: `fontconvert_sdcard.py` from the
  [Crosspoint reader](https://github.com/crosspoint-reader/crosspoint-reader)
  project (MIT).
