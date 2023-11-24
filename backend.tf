terraform {
 backend "oss" {
    bucket = "project-2023"
    key    = "main"
    region = "me-central-1"
 }
}
