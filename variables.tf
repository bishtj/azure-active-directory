variable "dept_name" {
  type = string
  description = "Dept name used by a user group"
}

variable "resource_location" {
  type = string
  description = "location name for the resource"
}

variable "user_emails" {
  type = set(string)
}

variable "subscription_email" {
  type = list(string)
}
