variable "project" {
    description = "Project"
    default = "cogent-tree-453621-r6"
}

variable "region" {
  description = "Region"
  default = "us-west1"
}

variable "location" {
  description = "Project Location"
  default = "US"
}

variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  default = "taxi_dataset"
}

variable "gcs_bucket_name" {
  description = "My Storage Bucket Name"
  default = "cogent-tree-453621-r6-bucket"
}

variable "gcs_storage_class" {
  description = "Bucket Storage Class"
  default = "STANDARD"
}
