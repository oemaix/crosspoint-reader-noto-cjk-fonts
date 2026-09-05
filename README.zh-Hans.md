# Crosspoint 阅读器 CJK 字体

[English](README.md) | **简体中文** | [繁體中文](README.zh-Hant.md) | [日本語](README.ja.md) | [한국어](README.ko.md)

为 [Crosspoint 阅读器](https://github.com/crosspoint-reader/crosspoint-reader)
预先转换好的 CJK（中文、日文、韩文)字体，下载即用。

## 背景

Crosspoint 阅读器出厂时不支持 CJK 字符显示。虽然官方提供了网页版字体转换工具，
但转换过程缓慢，且每个字体变体都需要手动配置多个参数。

本项目自动构建最终的 `.cpfont` 文件，让你完全跳过繁琐的转换过程。

## 下载

前往 [**Releases**](../../releases) 页面，下载适合你语言和风格的压缩包：

| 文件 | 内容 |
|---|---|
| `Noto-Sans-CJK-SC.zip` | 简体中文，黑体（无衬线） |
| `Noto-Sans-CJK-TC.zip` | 繁体中文（台湾），黑体 |
| `Noto-Sans-CJK-HK.zip` | 繁体中文（香港），黑体 |
| `Noto-Sans-CJK-JP.zip` | 日文，黑体 |
| `Noto-Sans-CJK-KR.zip` | 韩文，黑体 |
| `Noto-Serif-CJK-*.zip` | 同样五个地区变体，宋体（衬线） |

每个压缩包内含一个目录（如 `Noto Sans CJK SC/`），包括 **8、10、12、14、16、18**
六个字号的 `.cpfont` 文件，每个字号均含**常规和粗体**两种字重，并附带来自
Noto Sans/Serif 的拉丁字母、希腊字母和西里尔字母回退字形。

## 使用方法

1. 下载并解压适合你语言和风格的压缩包。
2. 将解压出的目录（如 `Noto Sans CJK SC`）复制到 microSD 卡的 `/fonts` 目录。
3. 插入 microSD 卡并重启设备，然后在阅读设置中选择新字体。

## 遇到缺字？请告诉我们！

为控制文件体积，转换时只包含了部分 Unicode 区段。如果书中有字符显示为
**空白方块（豆腐块）**，请
[**提交"缺字报告" issue**](../../issues/new?template=missing-glyphs.yml)——
只需粘贴无法显示的字符，可选填 Unicode 码位和语言。你的反馈会直接改善所有人的
字符覆盖率。

其他问题（字体无法加载、字形不符合本地写法、间距异常等）请使用
[Bug 报告模板](../../issues/new?template=bug-report.yml)。

## 自行构建

依赖：`bash`、`curl`、`unzip`、`git` 和 [uv](https://docs.astral.sh/uv/)。

```bash
git clone --depth 1 https://github.com/crosspoint-reader/crosspoint-reader.git
./download_fonts.bash    # 下载固定版本的 Noto 源字体到 tmp/
uv sync                  # 安装 fonttools 和 freetype-py
./cjk_font_convert.bash  # 生成 "Noto <风格> CJK <地区>/" 目录
```

`.github/workflows/release.yml` 中的 GitHub Actions 工作流执行完全相同的步骤：
推送 `v*` 标签时自动构建并将压缩包附加到 Release；手动触发（workflow_dispatch）
则只生成构建产物而不创建 Release。

## 许可证

- 本仓库中的转换脚本和工作流采用 **GNU GPL v2** 许可（[LICENSE](LICENSE)）。
- 字体本身（包括 Noto 源字体和转换后的 `.cpfont` 文件）采用
  **SIL Open Font License 1.1** 许可（[OFL.txt](OFL.txt)），每个 Release
  压缩包中均附带该许可文本。

## 致谢

- 字体：[Noto CJK](https://github.com/notofonts/noto-cjk)（© Adobe）与
  [Noto Latin/Greek/Cyrillic](https://github.com/notofonts/latin-greek-cyrillic)
  （© The Noto Project Authors），SIL Open Font License 1.1 许可。
- 转换工具：来自 [Crosspoint 阅读器](https://github.com/crosspoint-reader/crosspoint-reader)
  项目的 `fontconvert_sdcard.py`（MIT 许可）。
