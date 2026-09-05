# Crosspoint Reader CJK Fonts

This repository provides pre-converted CJK (Chinese, Japanese, Korean) fonts for the Crosspoint reader, ready for immediate download and use.

## The Problem
Out of the box, the Crosspoint reader lacks native CJK character support. While there is a web-based font conversion tool available, the process is often slow and requires configuring multiple parameters for every single font variation. 

To save time for the community, I wrote a local batch conversion script to process the fonts offline. This repository hosts the final, compiled `.cpfont` files so you can skip the tedious conversion process entirely.

## Included Fonts

All fonts are based on Google's open-source **Noto CJK** project. 

**Available Font Families:**
* `NotoSansCJK` (Sans-serif)
* `NotoSerifCJK` (Serif)

**Available Regional Variants:**
* **JP:** Japanese
* **KR:** Korean
* **SC:** Simplified Chinese
* **TC:** Traditional Chinese (Taiwan)
* **HK:** Traditional Chinese (Hong Kong)

**Included Specifications (per variant):**
* **Sizes:** 8, 10, 12, 14, 16, and 18
* **Weights:** Regular and Bold

## Directory Structure

The repository is organized by font family and region. Inside each folder, you will find the `.cpfont` files for all 6 sizes.

```text
├── NotoSansCJKHK/     (Sizes 8-18)
├── NotoSansCJKJP/     (Sizes 8-18)
├── NotoSansCJKKR/     (Sizes 8-18)
├── NotoSansCJKSC/     (Sizes 8-18)
├── NotoSansCJKTC/     (Sizes 8-18)
├── NotoSerifCJKHK/    (Sizes 8-18)
├── NotoSerifCJKJP/    (Sizes 8-18)
├── NotoSerifCJKKR/    (Sizes 8-18)
├── NotoSerifCJKSC/    (Sizes 8-18)
└── NotoSerifCJKTC/    (Sizes 8-18)

```

## How to Use

1. Download the directory (e.g., `NotoSansCJKHK`) for your preferred language and style.
2. Transfer the downloaded directory(e.g., `NotoSansCJKHK`) to the `/fonts` directory of the microSD card.
3. Insert the microSD card, reboot, and select the new font from your device's reading settings.
