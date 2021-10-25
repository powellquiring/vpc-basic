# VPC Basic
Introduction to ibm cloud using the ibmcloud cli and terraform

# ibmcloud is - cli
create an api key: https://cloud.ibm.com/iam/apikeys . An apikey is the username and password to your account so keep it safe

The put the apikey into a file, local.env, like this:

```
$ ls
local.env
$ cat local.env
export TF_VAR_ibmcloud_api_key=SWzzzzzz
```

Now source the local.env file and lets get to work:

```
source local.env

ibmcloud login --apikey $TF_VAR_ibmcloud_api_key
```

Create a vpc, and check it out in the UI:

```
working $ ibmcloud is vpc-create fun
working $ ibmcloud is vpcs
Listing vpcs for generation 2 compute in all resource groups and region us-south under account Powell Quiring's Account as user pquiring@us.ibm.com...
No vpcs were found.
ID   Name   Status   Classic access   Default network ACL   Default security group   Resource group
working $ ibmcloud is vpc-create fun
Creating vpc fun in resource group  under account Powell Quiring's Account as user pquiring@us.ibm.com...

ID                                             r006-356b6559-e3d7-4c40-9db9-506ae0eda5c2
Name                                           fun
CRN                                            crn:v1:bluemix:public:is:us-south:a/713c783d9a507a53135fe6793c37cc74::vpc:r006-356b6559-e3d7-4c40-9db9-506ae0eda5c2
Status                                         pending
Classic access                                 false
Created                                        2021-10-25T09:43:30-07:00
Resource group                                 ID                                 Name
                                               b6503f25836d49029966ab5be7fe50b5   default

Default network ACL                            ID                                          Name
                                               r006-620c93e4-a46e-48bc-bc83-e91dc19f2f72   fossil-compound-dramatic-bade

Default security group                         ID                                          Name
                                               r006-a2a61f74-5d53-43b3-8414-b9f5bd0b979e   ripening-busboy-feline-plunder

Default routing table                          ID                                          Name
                                               r006-b333c9fb-e2d7-4f52-8fd8-bb056815c37c   penknife-strangely-elm-slinging


Cloud Service Endpoint source IP addresses:    Zone         Address
                                               us-south-1   10.12.126.61
                                               us-south-2   10.16.247.168
                                               us-south-3   10.16.250.219

working $ ibmcloud is vpcs
Listing vpcs for generation 2 compute in all resource groups and region us-south under account Powell Quiring's Account as user pquiring@us.ibm.com...
ID                                          Name   Status      Classic access   Default network ACL             Default security group           Resource group
r006-356b6559-e3d7-4c40-9db9-506ae0eda5c2   fun    available   false            fossil-compound-dramatic-bade   ripening-busboy-feline-plunder   default
```

# terraform
Create a working directory and cd into it

```
mkdir working
cd working
```

Add the files one at at time starting with 010- to the working directory.   After adding a file then:

```
terraform init
terraform apply
```

