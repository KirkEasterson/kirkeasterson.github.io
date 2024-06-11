resource "cloudflare_record" "mc" {
  zone_id = var.cf_zone_id
  name    = "mc"
  value   = var.mc_server_ip
  type    = "CNAME"
  proxied = false
  ttl     = 0 # auto # TODO: check how to specify auto
}

resource "cloudflare_record" "mc_srv" {
  zone_id = var.cf_zone_id
  name    = "_minecraft._tcp.mc"
  type    = "SRV"
  ttl     = 0 # auto # TODO: check how to specify auto

  data {
    service  = "_minecraft"
    proto    = "_tcp"
    name     = "mc"
    priority = 0
    weight   = 0
    port     = 25565
    target   = cloudflare_record.mc.hostname
  }
}
