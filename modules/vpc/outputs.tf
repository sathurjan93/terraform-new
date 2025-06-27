output "vpc_id" {
  value = aws_vpc.main.id
}

output "prv_sub1" {
  value = aws_subnet.prv_sub1.id
}

output "prv_sub2" {
  value = aws_subnet.prv_sub2.id
}

output "pub_sub1" {
  value = aws_subnet.pub_sub1.id
}

output "pub_sub2" {
  value = aws_subnet.pub_sub2.id
}