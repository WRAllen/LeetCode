# Just is like Make, but designed for modern workflows.
# use `just rust/go/py`` to run local script
rust:
    cargo run --manifest-path testCode/Cargo.toml

go:
    go run testCode/main.go

py:
    python testCode/main.py

# 用法: just acp "commit message"
# 用于快速提交
acp msg:
    git add .
    git commit -m "{{msg}}"
    git push