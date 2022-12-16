#!/usr/bin/env bash

cwd="$(pwd)"
infile="$cwd/test/cli/t_types_base/test.rb"

tmp="$(mktemp -d)"

cp "$infile" "$tmp"

cd "$tmp" || exit 1
if "$cwd/main/sorbet" --silence-dev-message -a test.rb 2>&1; then
  echo "Expected to fail!"
  exit 1
fi

echo
echo --------------------------------------------------------------------------
echo

# Also cat the file, to make that the autocorrect applied
cat test.rb

rm test.rb
