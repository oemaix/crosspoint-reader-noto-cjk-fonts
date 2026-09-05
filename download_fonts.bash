#!/bin/bash
# Download the Noto source fonts needed by cjk_font_convert.bash into tmp/.
#
# Sources (pinned for reproducible builds, override via env):
#   CJK OTFs:   github.com/notofonts/noto-cjk        (tags Sans2.004 / Serif2.003)
#   Latin TTFs: github.com/notofonts/latin-greek-cyrillic release zips
#               (hinted static TTFs, same files Google Fonts ships)
#
# Only Regular + Bold are fetched. Existing files are kept, so re-runs are cheap.
set -euo pipefail
cd "$(dirname "$0")"

NOTO_CJK_SANS_TAG="${NOTO_CJK_SANS_TAG:-Sans2.004}"
NOTO_CJK_SERIF_TAG="${NOTO_CJK_SERIF_TAG:-Serif2.003}"
NOTO_SANS_RELEASE="${NOTO_SANS_RELEASE:-NotoSans-v2.015}"
NOTO_SERIF_RELEASE="${NOTO_SERIF_RELEASE:-NotoSerif-v2.015}"

RAW_CJK="https://raw.githubusercontent.com/notofonts/noto-cjk"
LGC_RELEASES="https://github.com/notofonts/latin-greek-cyrillic/releases/download"

REGIONS=(
  "SC:SimplifiedChinese"
  "TC:TraditionalChinese"
  "HK:TraditionalChineseHK"
  "JP:Japanese"
  "KR:Korean"
)

fetch() { # fetch <url> <dest>
  local url="$1" dest="$2"
  if [ -s "$dest" ]; then
    echo "keep     $dest"
    return
  fi
  echo "download $dest"
  mkdir -p "$(dirname "$dest")"
  curl -fsSL --retry 3 --retry-delay 2 -o "$dest" "$url"
}

# --- CJK OTFs -----------------------------------------------------------
for kind in Sans Serif; do
  tag_var="NOTO_CJK_$(echo "$kind" | tr '[:lower:]' '[:upper:]')_TAG"
  tag="${!tag_var}"
  for entry in "${REGIONS[@]}"; do
    region="${entry%%:*}"
    dir="${entry#*:}"
    suffix="$(echo "$region" | tr '[:upper:]' '[:lower:]')"
    for weight in Regular Bold; do
      fetch "$RAW_CJK/$tag/$kind/OTF/$dir/Noto${kind}CJK${suffix}-${weight}.otf" \
            "tmp/Noto_${kind}_CJK/$dir/Noto${kind}CJK${suffix}-${weight}.otf"
    done
  done
done

# --- Latin fallback TTFs ------------------------------------------------
for kind in Sans Serif; do
  rel_var="NOTO_$(echo "$kind" | tr '[:lower:]' '[:upper:]')_RELEASE"
  rel="${!rel_var}"
  dest_dir="tmp/Noto_${kind}/static"
  if [ -s "$dest_dir/Noto${kind}-Regular.ttf" ] && [ -s "$dest_dir/Noto${kind}-Bold.ttf" ]; then
    echo "keep     $dest_dir/Noto${kind}-{Regular,Bold}.ttf"
    continue
  fi
  echo "download $rel.zip"
  tmpzip="$(mktemp --suffix=.zip)"
  curl -fsSL --retry 3 --retry-delay 2 -o "$tmpzip" "$LGC_RELEASES/$rel/$rel.zip"
  mkdir -p "$dest_dir"
  unzip -o -j -q "$tmpzip" \
    "Noto${kind}/hinted/ttf/Noto${kind}-Regular.ttf" \
    "Noto${kind}/hinted/ttf/Noto${kind}-Bold.ttf" \
    -d "$dest_dir"
  rm -f "$tmpzip"
done

echo "All source fonts ready under tmp/."
