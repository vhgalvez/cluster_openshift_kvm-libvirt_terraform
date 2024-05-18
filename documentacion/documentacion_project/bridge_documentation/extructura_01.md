
terraform_project/
├── main.tf
├── terraform.tfvars
├── network_br0/
│   ├── main.tf
│   ├── variables.tf
│   └── config/
│       ├── bastion1-user-data.tpl
│       └── network-config.tpl
├── network_kube_02/
│   ├── main.tf
│   ├── variables.tf
│   └── config/
│       ├── freeipa1-user-data.tpl
│       ├── load_balancer1-user-data.tpl
│       ├── postgresql1-user-data.tpl
│       └── network-config.tpl
└── network_kube_03/
    ├── main.tf
    ├── variables.tf
    └── configs/
        ├── machine-bootstrap1-config.yaml.tmpl
        ├── machine-master1-config.yaml.tmpl
        ├── machine-master2-config.yaml.tmpl
        ├── machine-master3-config.yaml.tmpl
        ├── machine-worker1-config.yaml.tmpl
        ├── machine-worker2-config.yaml.tmpl
        └── machine-worker3-config.yaml.tmpl
