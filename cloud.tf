terraform {
  backend "remote" {
    organization = "yomafleet"

    workspaces {
      name = "yomafleet-staging"
    }
  }
}
