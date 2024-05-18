terraform_project/
├── main.tf
├── terraform.tfvars
├── bastion_network/
│   ├── main.tf
│   ├── variables.tf
│   └── config/
│       ├── bastion1-user-data.tpl
│       └── network-config.tpl
├── nat_network_02/
│   ├── main.tf
│   ├── variables.tf
│   └── config/
│       ├── freeipa1-user-data.tpl
│       ├── load_balancer1-user-data.tpl
│       ├── postgresql1-user-data.tpl
│       └── network-config.tpl
└── nat_network_03/
    ├── main.tf
    ├── variables.tf
    └── config/
        ├── machine-bootstrap1-config.yaml.tmpl
        ├── machine-master1-config.yaml.tmpl
        ├── machine-master2-config.yaml.tmpl
        ├── machine-master3-config.yaml.tmpl
        ├── machine-worker1-config.yaml.tmpl
        ├── machine-worker2-config.yaml.tmpl
        └── machine-worker3-config.yaml.tmpl
