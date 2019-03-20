workflow "Fission CD" {
  on = "push"
  resolves = ["FissionCD"]
}

action "FissionCD" {
  uses = "docker://vishalbiyani/fission-action:7"
  secrets = ["CERTIFICATE_AUTHORITY", "SERVER_ADDRESS", "USER_TOKEN"]
}