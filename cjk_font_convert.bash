#!/bin/bash
# Convert Noto Sans/Serif CJK (all five regional variants) to .cpfont.
#
# Prerequisites:
#   - ./download_fonts.bash has populated tmp/ (or fonts were placed there
#     manually in the same layout):
#       tmp/Noto_Sans_CJK/<Region>/NotoSansCJK<xx>-{Regular,Bold}.otf
#       tmp/Noto_Serif_CJK/<Region>/NotoSerifCJK<xx>-{Regular,Bold}.otf
#       tmp/Noto_Sans/static/NotoSans-{Regular,Bold}.ttf     (Latin fallback)
#       tmp/Noto_Serif/static/NotoSerif-{Regular,Bold}.ttf   (Latin fallback)
#   - crosspoint-reader/ is a clone (or symlink to one) of
#     https://github.com/crosspoint-reader/crosspoint-reader
#   - uv is installed; dependencies come from pyproject.toml via `uv run`.
set -euo pipefail
cd "$(dirname "$0")"

SIZES="8,10,12,14,16,18"
# Beyond the cjk preset, books in all five regions routinely use:
#   symbols          arrows, box drawing (─), geometric shapes (○), Roman numerals
#   0x2460-24FF      Enclosed Alphanumerics (circled digits ①②③, in no preset)
#   0x3000-33FF      Bopomofo, Hangul compat jamo, Kanbun, strokes, Katakana
#                    extensions, enclosed CJK (㈱), CJK compat units/eras (㎞㍻)
#   0xFE10-FE4F      vertical + compatibility forms (﹁﹂︰, mainly TC/HK)
# Unmapped codepoints are trimmed against each font's cmap at convert time,
# so over-asking costs nothing in the output.
BASE_INTERVALS="cjk,latin-ext,greek,cyrillic,symbols,(0x2460-0x24FF),(0x3000-0x33FF),(0xFE10-0xFE1F),(0xFE30-0xFE4F)"

# region_code:release_directory — file suffix is the lowercased region code
REGIONS=(
  "SC:SimplifiedChinese"
  "TC:TraditionalChinese"
  "HK:TraditionalChineseHK"
  "JP:Japanese"
  "KR:Korean"
)

convert() {
  local kind="$1"       # Sans | Serif
  local region="$2"     # SC | TC | HK | JP | KR
  local dir="$3"        # region directory in the noto-cjk release
  local suffix intervals fb_dir fb_name

  suffix="$(echo "$region" | tr '[:upper:]' '[:lower:]')"
  intervals="$BASE_INTERVALS"
  case "$region" in
    # Hangul syllables/jamo are a separate preset, not part of cjk.
    KR) intervals="$intervals,hangul" ;;
    # Ext A: rare hanzi (names/places) show up far more often in TC text.
    TC) intervals="$intervals,(0x3400-0x4DBF)" ;;
    # HK additionally needs Ext B, where most HKSCS Cantonese chars live.
    HK) intervals="$intervals,(0x3400-0x4DBF),(0x20000-0x2A6DF)" ;;
    # Ext B carries the joyo kanji 𠮟 (U+20B9F) and other hyogai forms.
    JP) intervals="$intervals,(0x20000-0x2A6DF)" ;;
  esac

  if [ "$kind" = "Sans" ]; then
    fb_dir="tmp/Noto_Sans/static"
    fb_name="NotoSans"
  else
    fb_dir="tmp/Noto_Serif/static"
    fb_name="NotoSerif"
  fi

  local src="tmp/Noto_${kind}_CJK/$dir"
  local name="Noto ${kind} CJK ${region}"

  uv run python crosspoint-reader/lib/EpdFont/scripts/fontconvert_sdcard.py \
    --intervals "$intervals" \
    --sizes "$SIZES" \
    --name "$name" \
    --regular "$src/Noto${kind}CJK${suffix}-Regular.otf" \
    --bold "$src/Noto${kind}CJK${suffix}-Bold.otf" \
    --fallback-regular "$fb_dir/$fb_name-Regular.ttf" \
    --fallback-bold "$fb_dir/$fb_name-Bold.ttf" \
    --output-dir "$name"
}

for kind in Sans Serif; do
  for entry in "${REGIONS[@]}"; do
    convert "$kind" "${entry%%:*}" "${entry#*:}"
  done
done
