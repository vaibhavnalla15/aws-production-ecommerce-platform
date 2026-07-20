############################################################
# Local Values
############################################################

locals {

  # Networking resource names
  resource_names = {
    public_subnet_1a  = "tf-public-subnet-1a"
    public_subnet_1b  = "tf-public-subnet-1b"
    private_subnet_1a = "tf-private-subnet-1a"
    private_subnet_1b = "tf-private-subnet-1b"

    internet_gateway = "tf-igw"
    nat_gateway      = "tf-nat-gateway"

    public_route_table  = "tf-public-rt"
    private_route_table = "tf-private-rt"

    nat_elastic_ip = "tf-nat-eip"
  }

}