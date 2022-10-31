schema GithubAtion:
    name: str
    on: {"push"|"pull_request":} = {
        "push": {branches: ["main", "master"]} 
        "pull_request": {branches: ["main", "master"]} 
    }
    jobs: Jobs = Jobs{}

schema Jobs:
    Test: {:} = {
        "runs-on" = "ubuntu-lastest"
        "steps" = []
    } 


schema Step:
    name?: str
    uses?: str
    with?: {:}
    run?: str
    $if?: str