# NTTDATA - DIGITAL ARCHITECTURE
# Create: Marcos Cianci 
# Date: Seg, 21 Nov 2022


resource "local_file" "default" {

    count           = var.cluster_config_values ? 1: 0

    content         = local.cluster_config_values
    filename        = var.filename
    file_permission = "0644" 
}
