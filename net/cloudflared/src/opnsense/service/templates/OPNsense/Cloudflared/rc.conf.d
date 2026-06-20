{% if not helpers.empty('OPNsense.Cloudflared.general.enabled') %}
cloudflared_enable="YES"
cloudflared_conf="/usr/local/etc/cloudflared/config.yml"
{% if not helpers.empty('OPNsense.Cloudflared.general.token') %}
{% set ns = namespace(env='TUNNEL_TOKEN=' + OPNsense.Cloudflared.general.token|trim) %}
{% if not helpers.empty('OPNsense.Cloudflared.general.edge_ip_version') %}
{% set ns.env = ns.env + ' TUNNEL_EDGE_IP_VERSION=' + OPNsense.Cloudflared.general.edge_ip_version %}
{% endif %}
cloudflared_env="{{ ns.env }}"
{% endif %}
cloudflared_mode_options="run{% if helpers.exists('OPNsense.Cloudflared.general.icmpv4_src') and OPNsense.Cloudflared.general.icmpv4_src != '' %} --icmpv4-src={{ OPNsense.Cloudflared.general.icmpv4_src|trim }}{% endif %}{% if helpers.exists('OPNsense.Cloudflared.general.icmpv6_src') and OPNsense.Cloudflared.general.icmpv6_src != '' %} --icmpv6-src={{ OPNsense.Cloudflared.general.icmpv6_src|trim }}{% endif %}"
{% else %}
cloudflared_enable="NO"
{% endif %}
