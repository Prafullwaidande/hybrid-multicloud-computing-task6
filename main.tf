provider "kubernetes" {
 config_context_cluster = "minikube"
}
resource "kubernetes_deployment" "wordpressdp" {
 metadata {
  name = "wordpress"
 }
 
 spec {
  replicas = 2
  
  selector {
   match_labels = {
    env = "dev"
    region = "IN"
    App = "wordpress"
   }
            
  }
  
  template {
   metadata {
    labels = {
     env = "dev"
     region = "IN"
     App = "wordpress"
    }
   }
   spec {
    container {
     image = "wordpress:4.8-apache"
     name = "mywp"
    }
   }
  }
 }
}

resource "kubernetes_service" "wplb" {
 metadata {
  name = "wordpress"
 }
 spec {
  selector = {
   App = "wordpress"
  }
  
  port {
   node_port = 32123
   port = 80
   target_port = 80
  }
  
  type = "NodePort"
 }
}