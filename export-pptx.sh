#!/usr/bin/env bash

set -euo pipefail

SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
INPUT_FILE="$SCRIPT_DIR/self-introduction-ppt.md"
OUTPUT_FILE="$SCRIPT_DIR/self-introduction.pptx"

if ! command -v npx >/dev/null 2>&1; then
  echo "❌ 未检测到 npx。请先安装 Node.js（包含 npm/npx）。"
  exit 1
fi

if [[ ! -f "$INPUT_FILE" ]]; then
  echo "❌ 未找到输入文件: $INPUT_FILE"
  exit 1
fi

echo "📦 正在导出 PPTX..."
npx --yes @marp-team/marp-cli "$INPUT_FILE" --pptx -o "$OUTPUT_FILE"
echo "✅ 导出完成: $OUTPUT_FILE"
