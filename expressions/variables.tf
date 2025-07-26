variable "numbers_list" {
  type = list(number)
}

variable "object_list" {
  type = list(object({
    firstname = string
    lastname = string
  }))
}