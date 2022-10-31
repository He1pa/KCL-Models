import ..base.base
import yaml

_language: "rust"|"python" = "rust"


_action = base.GithubAtion {
    name = "rust-test"
    jobs = base.Jobs{
        Test = {
            "runs-on" = "ubuntu-latest"
            "container" = "rust:latest"
            "steps" = [
                base.Step {
                    uses: "actions/checkout@v2"
                },
                base.Step {
                    name: "Install cargo2junit"
                    run:  "cargo install cargo2junit"
                },
                base.Step {
                    name: "Test"
                    run: "cargo test -- -Z unstable-options --format json --report-time | cargo2junit > results.xml"
                },
                base.Step {
                    name: "Publish result"
                    uses: "EnricoMi/publish-unit-test-result-action@v1"
                    $if: "always()"
                    with: {
                        files: "results.xml"
                    }
                },
            ]
        } 
    }
}


if _language == "rust":
    print(yaml.encode(_action, ignore_private=True))