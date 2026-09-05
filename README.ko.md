# Crosspoint 리더용 CJK 폰트

[English](README.md) | [简体中文](README.zh-Hans.md) | [繁體中文](README.zh-Hant.md) | [日本語](README.ja.md) | **한국어**

[Crosspoint 리더](https://github.com/crosspoint-reader/crosspoint-reader)를
위해 미리 변환된 CJK(중국어·일본어·한국어) 폰트입니다. 다운로드하여 바로
사용할 수 있습니다.

## 배경

Crosspoint 리더는 기본 상태에서 CJK 문자를 표시하지 못합니다. 웹 기반 폰트
변환 도구가 있지만 처리 속도가 느리고, 폰트 변형마다 여러 매개변수를 일일이
설정해야 합니다.

이 프로젝트는 최종 `.cpfont` 파일을 자동으로 빌드하므로 번거로운 변환 과정을
완전히 건너뛸 수 있습니다.

## 다운로드

[**Releases**](../../releases) 페이지에서 원하는 언어와 스타일의 zip 파일을
다운로드하세요.

| 파일 | 내용 |
|---|---|
| `Noto-Sans-CJK-SC.zip` | 중국어 간체, 고딕(산세리프) |
| `Noto-Sans-CJK-TC.zip` | 중국어 번체(대만), 고딕 |
| `Noto-Sans-CJK-HK.zip` | 중국어 번체(홍콩), 고딕 |
| `Noto-Sans-CJK-JP.zip` | 일본어, 고딕 |
| `Noto-Sans-CJK-KR.zip` | 한국어, 고딕 |
| `Noto-Serif-CJK-*.zip` | 동일한 5개 지역, 명조(세리프) |

각 zip에는 디렉터리(예: `Noto Sans CJK KR/`) 하나가 들어 있으며,
**8·10·12·14·16·18** 여섯 가지 크기의 `.cpfont` 파일이 포함됩니다. 각
크기마다 **일반과 굵게** 두 가지 굵기를 제공하고, Noto Sans/Serif에서 가져온
라틴·그리스·키릴 문자 대체 글리프도 포함되어 있습니다.

## 사용 방법

1. 원하는 언어와 스타일의 패키지를 다운로드하여 압축을 풉니다.
2. 압축 해제된 디렉터리(예: `Noto Sans CJK KR`)를 microSD 카드의 `/fonts`
   디렉터리에 복사합니다.
3. microSD 카드를 삽입하고 재부팅한 뒤, 기기의 읽기 설정에서 새 폰트를
   선택합니다.

## 표시되지 않는 문자가 있나요? 꼭 알려주세요!

파일 크기를 줄이기 위해 변환 시 일부 유니코드 범위만 포함했습니다. 책의
문자가 **빈 사각형(두부 글자)**으로 표시된다면
[**"Missing characters" 이슈**](../../issues/new?template=missing-glyphs.yml)를
등록해 주세요. 표시되지 않는 문자를 붙여넣기만 하면 됩니다(유니코드 코드
포인트와 언어는 선택 사항). 여러분의 제보가 모든 사용자의 문자 커버리지
개선으로 직결됩니다.

그 밖의 문제(폰트가 로드되지 않음, 글자 모양 오류, 자간 문제 등)는
[버그 신고 템플릿](../../issues/new?template=bug-report.yml)을 이용해 주세요.

## 직접 빌드하기

필요 도구: `bash`, `curl`, `unzip`, `git`, [uv](https://docs.astral.sh/uv/)

```bash
git clone --depth 1 https://github.com/crosspoint-reader/crosspoint-reader.git
./download_fonts.bash    # 버전이 고정된 Noto 원본 폰트를 tmp/에 다운로드
uv sync                  # fonttools와 freetype-py 설치
./cjk_font_convert.bash  # "Noto <종류> CJK <지역>/" 디렉터리 생성
```

`.github/workflows/release.yml`의 GitHub Actions 워크플로는 정확히 같은
단계를 실행합니다. `v*` 태그를 푸시하면 zip 파일이 릴리스에 첨부되고, 수동
실행(workflow_dispatch)에서는 릴리스를 만들지 않고 빌드 아티팩트만
생성합니다.

## 라이선스

- 이 저장소의 변환 스크립트와 워크플로는 **GNU GPL v2**([LICENSE](LICENSE))
  라이선스를 따릅니다.
- 폰트 자체(Noto 원본 폰트와 변환된 `.cpfont` 파일)는 **SIL Open Font
  License 1.1**([OFL.txt](OFL.txt)) 라이선스를 따르며, 모든 릴리스 zip에
  라이선스 전문이 포함됩니다.

## 크레딧

- 폰트: [Noto CJK](https://github.com/notofonts/noto-cjk)(© Adobe),
  [Noto Latin/Greek/Cyrillic](https://github.com/notofonts/latin-greek-cyrillic)
  (© The Noto Project Authors), SIL Open Font License 1.1.
- 변환 도구: [Crosspoint 리더](https://github.com/crosspoint-reader/crosspoint-reader)
  프로젝트의 `fontconvert_sdcard.py`(MIT 라이선스).
