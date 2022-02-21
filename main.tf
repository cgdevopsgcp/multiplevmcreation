variable "region" {
default = "us-central1-a" 
}
provider "google" {
credentials = "${file("service.json")}"
project = "cg-anz-practice"
region = "${var.region}"
}
resource "google_compute_instance" "test" {
count = 1 // Adjust as desired
name = "test${count.index + 1}" // yields "test1", "test2", etc. It's also
machine_type = "f1-micro" // smallest (CPU & RAM) available instance
zone = "${var.region}" // yields "europe-west1-d" as setup previously.
boot_disk {
initialize_params {
image = "debian-7-wheezy-v20160301" 
}
}
network_interface {
network = "default"
access_config {
}
}
}
