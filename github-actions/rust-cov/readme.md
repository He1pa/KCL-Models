Steps:
1. select language in `rust-cov.k`

```
_language: "rust"|"python" = "rust"
```

2 compile to gengerate yaml
```
kcl rust-cov.k
```

3. new a github action config yaml
.github/workflows/cov.yml

4 paste compile result to cov.yml