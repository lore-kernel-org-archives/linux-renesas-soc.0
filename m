Return-Path: <SRS0+gsVm=QA=vger.kernel.org=netdev-owner@vergenet.net>
MIME-Version: 1.0
In-Reply-To: <2f2080cbe948be319e5725b2aa484e8996ed36ae.1459860270.git.jbenc@redhat.com>
References: <cover.1459860270.git.jbenc@redhat.com>
	<2f2080cbe948be319e5725b2aa484e8996ed36ae.1459860270.git.jbenc@redhat.com>
Date: Tue, 5 Apr 2016 10:50:57 -0300
Message-ID: <CALx6S35gFDe+hiOtQqDUuzahkeh7vB3du3TN=noYefuDNGmCJw@mail.gmail.com>
Subject: Re: [PATCH net-next v3 4/4] vxlan: implement GPE
From: Tom Herbert <tom@herbertland.com>
To: Jiri Benc <jbenc@redhat.com>
Cc: Linux Kernel Network Developers <netdev@vger.kernel.org>,
	Jesse Gross <jesse@kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: netdev-owner@vger.kernel.org
Return-Path: <SRS0+0DFd=QB=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:36469 "EHLO
	mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1754432AbcDFXPE (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 6 Apr 2016 19:15:04 -0400
Received: by mail-lf0-f50.google.com with SMTP id g184so44838905lfb.3
        for <linux-renesas-soc@vger.kernel.org>; Wed, 06 Apr 2016 16:15:03 -0700 (PDT)
Subject: Re: [PATCH] ARM: dts: r8a7791: Don't disable referenced optional
 clocks
To: Sjoerd Simons <sjoerd.simons@collabora.co.uk>,
	Simon Horman <horms@verge.net.au>
References: <1459947173-6664-1-git-send-email-sjoerd.simons@collabora.co.uk>
Cc: linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	Geert Uytterhoeven <geert@linux-m68k.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <57059874.1070309@cogentembedded.com>
Date: Thu, 7 Apr 2016 02:15:00 +0300
MIME-Version: 1.0
In-Reply-To: <1459947173-6664-1-git-send-email-sjoerd.simons@collabora.co.uk>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>
Return-Path: <SRS0+0DFd=QB=vger.kernel.org=linux-renesas-soc-owner@vergenet.net>
Received: from bhuna.collabora.co.uk ([46.235.227.227]:59362 "EHLO
	bhuna.collabora.co.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S933944AbcDFKQy convert rfc822-to-8bit (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 6 Apr 2016 06:16:54 -0400
Message-ID: <1459937810.23936.7.camel@collabora.co.uk>
Subject: No serial since ARM: dts: r8a7791: Add BRG support for (H)SCIF
From: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: linux-renesas-soc@vger.kernel.org
Date: Wed, 06 Apr 2016 12:16:50 +0200
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Mime-Version: 1.0
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>
Return-Path: <SRS0+ET7P=QT=vger.kernel.org=netdev-owner@vergenet.net>
From: Jiri Benc <jbenc@redhat.com>
To: netdev@vger.kernel.org
Cc: Pravin B Shelar <pshelar@nicira.com>, Thomas Graf <tgraf@suug.ch>,
	Simon Horman <simon.horman@netronome.com>
Subject: [PATCH net v2 1/3] gre: do not assign header_ops in collect metadata mode
Date: Sun, 24 Apr 2016 13:00:20 +0200
Message-Id: <bd50f4691e9edc28c5a9ec861863f7f6cf316077.1461495411.git.jbenc@redhat.com>
In-Reply-To: <cover.1461495411.git.jbenc@redhat.com>
References: <cover.1461495411.git.jbenc@redhat.com>
Sender: netdev-owner@vger.kernel.org
Return-Path: <SRS0+w310=QW=vger.kernel.org=netdev-owner@vergenet.net>
From: Jiri Benc <jbenc@redhat.com>
To: netdev@vger.kernel.org
Cc: Stephen Hemminger <stephen@networkplumber.org>,
	Paolo Abeni <pabeni@redhat.com>,
	Pravin Shelar <pshelar@ovn.org>
Subject: [PATCH iproute2 0/2] ip link gre: fix external mode handling
Date: Wed, 27 Apr 2016 16:11:12 +0200
Message-Id: <cover.1461766016.git.jbenc@redhat.com>
Sender: netdev-owner@vger.kernel.org
Return-Path: <horms@penelope.isobedori.kobe.vergenet.net>
From: Simon Horman <horms+renesas@verge.net.au>
To: linux-renesas-soc@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org,
	Magnus Damm <magnus.damm@gmail.com>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms+renesas@verge.net.au>
Subject: [PATCH 3/7] soc: renesas: Add r8a7790 SYSC PM Domain Binding Definitions
Date: Thu, 21 Apr 2016 13:44:45 +1000
Message-Id: <3dc4c00a33a82824b710892be4b059637c99cabf.1461210185.git.horms+renesas@verge.net.au>
In-Reply-To: <cover.1461210185.git.horms+renesas@verge.net.au>
References: <cover.1461210185.git.horms+renesas@verge.net.au>

On Tue, Apr 5, 2016 at 9:47 AM, Jiri Benc <jbenc@redhat.com> wrote:
> Implement VXLAN-GPE. Only COLLECT_METADATA is supported for now (it is
> possible to support static configuration, too, if there is demand for it).
>
> The GPE header parsing has to be moved before iptunnel_pull_header, as we
> need to know the protocol.
>
> v2: Removed what was called "L2 mode" in v1 of the patchset. Only "L3 mode"
>     (now called "raw mode") is added by this patch. This mode does not allow
>     Ethernet header to be encapsulated in VXLAN-GPE when using ip route to
>     specify the encapsulation, IP header is encapsulated instead. The patch
>     does support Ethernet to be encapsulated, though, using ETH_P_TEB in
>     skb->protocol. This will be utilized by other COLLECT_METADATA users
>     (openvswitch in particular).
>
>     If there is ever demand for Ethernet encapsulation with VXLAN-GPE using
>     ip route, it's easy to add a new flag switching the interface to
>     "Ethernet mode" (called "L2 mode" in v1 of this patchset). For now,
>     leave this out, it seems we don't need it.
>
>     Disallowed more flag combinations, especially RCO with GPE.
>     Added comment explaining that GBP and GPE cannot be set together.
>
I requested input from VXLAN protocol experts on whether RCO is
architecturally correct in VXLAN and whether we are using the right
fields both on the mailing list and in WG meeting yesterday @IETF.
Have not gotten any response, so I am going to assume all this is
reasonable. I will add explicit support to VXLAN-RCO draft for
VXLAN-GPE. The configuration option for RX RCO can be removed and RCO
can be supported for VXLAN/VXLAN-GPE in same way. Presumably, GBP
might make same assumptions but GBP format as defined for VXLAN isn't
compatible with VXLAN-GPE.

Tom

> Signed-off-by: Jiri Benc <jbenc@redhat.com>
> ---
>  drivers/net/vxlan.c          | 170 ++++++++++++++++++++++++++++++++++++++-----
>  include/net/vxlan.h          |  68 +++++++++++++++++
>  include/uapi/linux/if_link.h |   1 +
>  3 files changed, 222 insertions(+), 17 deletions(-)
>
> diff --git a/drivers/net/vxlan.c b/drivers/net/vxlan.c
> index d62eebaa9720..51cccddfe403 100644
> --- a/drivers/net/vxlan.c
> +++ b/drivers/net/vxlan.c
> @@ -1192,6 +1192,45 @@ out:
>         unparsed->vx_flags &= ~VXLAN_GBP_USED_BITS;
>  }
>
> +static bool vxlan_parse_gpe_hdr(struct vxlanhdr *unparsed,
> +                               __be32 *protocol,
> +                               struct sk_buff *skb, u32 vxflags)
> +{
> +       struct vxlanhdr_gpe *gpe = (struct vxlanhdr_gpe *)unparsed;
> +
> +       /* Need to have Next Protocol set for interfaces in GPE mode. */
> +       if (!gpe->np_applied)
> +               return false;
> +       /* "The initial version is 0. If a receiver does not support the
> +        * version indicated it MUST drop the packet.
> +        */
> +       if (gpe->version != 0)
> +               return false;
> +       /* "When the O bit is set to 1, the packet is an OAM packet and OAM
> +        * processing MUST occur." However, we don't implement OAM
> +        * processing, thus drop the packet.
> +        */
> +       if (gpe->oam_flag)
> +               return false;
> +
> +       switch (gpe->next_protocol) {
> +       case VXLAN_GPE_NP_IPV4:
> +               *protocol = htons(ETH_P_IP);
> +               break;
> +       case VXLAN_GPE_NP_IPV6:
> +               *protocol = htons(ETH_P_IPV6);
> +               break;
> +       case VXLAN_GPE_NP_ETHERNET:
> +               *protocol = htons(ETH_P_TEB);
> +               break;
> +       default:
> +               return false;
> +       }
> +
> +       unparsed->vx_flags &= ~VXLAN_GPE_USED_BITS;
> +       return true;
> +}
> +
>  static bool vxlan_set_mac(struct vxlan_dev *vxlan,
>                           struct vxlan_sock *vs,
>                           struct sk_buff *skb)
> @@ -1257,9 +1296,11 @@ static int vxlan_rcv(struct sock *sk, struct sk_buff *skb)
>         struct vxlanhdr unparsed;
>         struct vxlan_metadata _md;
>         struct vxlan_metadata *md = &_md;
> +       __be32 protocol = htons(ETH_P_TEB);
> +       bool raw_proto = false;
>         void *oiph;
>
> -       /* Need Vxlan and inner Ethernet header to be present */
> +       /* Need UDP and VXLAN header to be present */
>         if (!pskb_may_pull(skb, VXLAN_HLEN))
>                 return 1;
>
> @@ -1283,9 +1324,18 @@ static int vxlan_rcv(struct sock *sk, struct sk_buff *skb)
>         if (!vxlan)
>                 goto drop;
>
> -       if (iptunnel_pull_header(skb, VXLAN_HLEN, htons(ETH_P_TEB),
> -                                !net_eq(vxlan->net, dev_net(vxlan->dev))))
> -               goto drop;
> +       /* For backwards compatibility, only allow reserved fields to be
> +        * used by VXLAN extensions if explicitly requested.
> +        */
> +       if (vs->flags & VXLAN_F_GPE) {
> +               if (!vxlan_parse_gpe_hdr(&unparsed, &protocol, skb, vs->flags))
> +                       goto drop;
> +               raw_proto = true;
> +       }
> +
> +       if (__iptunnel_pull_header(skb, VXLAN_HLEN, protocol, raw_proto,
> +                                  !net_eq(vxlan->net, dev_net(vxlan->dev))))
> +                       goto drop;
>
>         if (vxlan_collect_metadata(vs)) {
>                 __be32 vni = vxlan_vni(vxlan_hdr(skb)->vx_vni);
> @@ -1304,14 +1354,14 @@ static int vxlan_rcv(struct sock *sk, struct sk_buff *skb)
>                 memset(md, 0, sizeof(*md));
>         }
>
> -       /* For backwards compatibility, only allow reserved fields to be
> -        * used by VXLAN extensions if explicitly requested.
> -        */
>         if (vs->flags & VXLAN_F_REMCSUM_RX)
>                 if (!vxlan_remcsum(&unparsed, skb, vs->flags))
>                         goto drop;
>         if (vs->flags & VXLAN_F_GBP)
>                 vxlan_parse_gbp_hdr(&unparsed, skb, vs->flags, md);
> +       /* Note that GBP and GPE can never be active together. This is
> +        * ensured in vxlan_dev_configure.
> +        */
>
>         if (unparsed.vx_flags || unparsed.vx_vni) {
>                 /* If there are any unprocessed flags remaining treat
> @@ -1325,8 +1375,13 @@ static int vxlan_rcv(struct sock *sk, struct sk_buff *skb)
>                 goto drop;
>         }
>
> -       if (!vxlan_set_mac(vxlan, vs, skb))
> -               goto drop;
> +       if (!raw_proto) {
> +               if (!vxlan_set_mac(vxlan, vs, skb))
> +                       goto drop;
> +       } else {
> +               skb->dev = vxlan->dev;
> +               skb->pkt_type = PACKET_HOST;
> +       }
>
>         oiph = skb_network_header(skb);
>         skb_reset_network_header(skb);
> @@ -1685,6 +1740,27 @@ static void vxlan_build_gbp_hdr(struct vxlanhdr *vxh, u32 vxflags,
>         gbp->policy_id = htons(md->gbp & VXLAN_GBP_ID_MASK);
>  }
>
> +static int vxlan_build_gpe_hdr(struct vxlanhdr *vxh, u32 vxflags,
> +                              __be16 protocol)
> +{
> +       struct vxlanhdr_gpe *gpe = (struct vxlanhdr_gpe *)vxh;
> +
> +       gpe->np_applied = 1;
> +
> +       switch (protocol) {
> +       case htons(ETH_P_IP):
> +               gpe->next_protocol = VXLAN_GPE_NP_IPV4;
> +               return 0;
> +       case htons(ETH_P_IPV6):
> +               gpe->next_protocol = VXLAN_GPE_NP_IPV6;
> +               return 0;
> +       case htons(ETH_P_TEB):
> +               gpe->next_protocol = VXLAN_GPE_NP_ETHERNET;
> +               return 0;
> +       }
> +       return -EPFNOSUPPORT;
> +}
> +
>  static int vxlan_build_skb(struct sk_buff *skb, struct dst_entry *dst,
>                            int iphdr_len, __be32 vni,
>                            struct vxlan_metadata *md, u32 vxflags,
> @@ -1694,6 +1770,7 @@ static int vxlan_build_skb(struct sk_buff *skb, struct dst_entry *dst,
>         int min_headroom;
>         int err;
>         int type = udp_sum ? SKB_GSO_UDP_TUNNEL_CSUM : SKB_GSO_UDP_TUNNEL;
> +       __be16 inner_protocol = htons(ETH_P_TEB);
>
>         if ((vxflags & VXLAN_F_REMCSUM_TX) &&
>             skb->ip_summed == CHECKSUM_PARTIAL) {
> @@ -1712,10 +1789,8 @@ static int vxlan_build_skb(struct sk_buff *skb, struct dst_entry *dst,
>
>         /* Need space for new headers (invalidates iph ptr) */
>         err = skb_cow_head(skb, min_headroom);
> -       if (unlikely(err)) {
> -               kfree_skb(skb);
> -               return err;
> -       }
> +       if (unlikely(err))
> +               goto out_free;
>
>         skb = vlan_hwaccel_push_inside(skb);
>         if (WARN_ON(!skb))
> @@ -1744,9 +1819,19 @@ static int vxlan_build_skb(struct sk_buff *skb, struct dst_entry *dst,
>
>         if (vxflags & VXLAN_F_GBP)
>                 vxlan_build_gbp_hdr(vxh, vxflags, md);
> +       if (vxflags & VXLAN_F_GPE) {
> +               err = vxlan_build_gpe_hdr(vxh, vxflags, skb->protocol);
> +               if (err < 0)
> +                       goto out_free;
> +               inner_protocol = skb->protocol;
> +       }
>
> -       skb_set_inner_protocol(skb, htons(ETH_P_TEB));
> +       skb_set_inner_protocol(skb, inner_protocol);
>         return 0;
> +
> +out_free:
> +       kfree_skb(skb);
> +       return err;
>  }
>
>  static struct rtable *vxlan_get_route(struct vxlan_dev *vxlan,
> @@ -2421,6 +2506,17 @@ static const struct net_device_ops vxlan_netdev_ether_ops = {
>         .ndo_fill_metadata_dst  = vxlan_fill_metadata_dst,
>  };
>
> +static const struct net_device_ops vxlan_netdev_raw_ops = {
> +       .ndo_init               = vxlan_init,
> +       .ndo_uninit             = vxlan_uninit,
> +       .ndo_open               = vxlan_open,
> +       .ndo_stop               = vxlan_stop,
> +       .ndo_start_xmit         = vxlan_xmit,
> +       .ndo_get_stats64        = ip_tunnel_get_stats64,
> +       .ndo_change_mtu         = vxlan_change_mtu,
> +       .ndo_fill_metadata_dst  = vxlan_fill_metadata_dst,
> +};
> +
>  /* Info for udev, that this is a virtual tunnel endpoint */
>  static struct device_type vxlan_type = {
>         .name = "vxlan",
> @@ -2500,6 +2596,17 @@ static void vxlan_ether_setup(struct net_device *dev)
>         dev->netdev_ops = &vxlan_netdev_ether_ops;
>  }
>
> +static void vxlan_raw_setup(struct net_device *dev)
> +{
> +       dev->type = ARPHRD_NONE;
> +       dev->hard_header_len = 0;
> +       dev->addr_len = 0;
> +       dev->mtu = ETH_DATA_LEN;
> +       dev->tx_queue_len = 1000;
> +       dev->flags = IFF_POINTOPOINT | IFF_NOARP | IFF_MULTICAST;
> +       dev->netdev_ops = &vxlan_netdev_raw_ops;
> +}
> +
>  static const struct nla_policy vxlan_policy[IFLA_VXLAN_MAX + 1] = {
>         [IFLA_VXLAN_ID]         = { .type = NLA_U32 },
>         [IFLA_VXLAN_GROUP]      = { .len = FIELD_SIZEOF(struct iphdr, daddr) },
> @@ -2526,6 +2633,7 @@ static const struct nla_policy vxlan_policy[IFLA_VXLAN_MAX + 1] = {
>         [IFLA_VXLAN_REMCSUM_TX] = { .type = NLA_U8 },
>         [IFLA_VXLAN_REMCSUM_RX] = { .type = NLA_U8 },
>         [IFLA_VXLAN_GBP]        = { .type = NLA_FLAG, },
> +       [IFLA_VXLAN_GPE]        = { .type = NLA_FLAG, },
>         [IFLA_VXLAN_REMCSUM_NOPARTIAL]  = { .type = NLA_FLAG },
>  };
>
> @@ -2726,7 +2834,20 @@ static int vxlan_dev_configure(struct net *src_net, struct net_device *dev,
>         __be16 default_port = vxlan->cfg.dst_port;
>         struct net_device *lowerdev = NULL;
>
> -       vxlan_ether_setup(dev);
> +       if (conf->flags & VXLAN_F_GPE) {
> +               if (conf->flags & ~VXLAN_F_ALLOWED_GPE)
> +                       return -EINVAL;
> +               /* For now, allow GPE only together with COLLECT_METADATA.
> +                * This can be relaxed later; in such case, the other side
> +                * of the PtP link will have to be provided.
> +                */
> +               if (!(conf->flags & VXLAN_F_COLLECT_METADATA))
> +                       return -EINVAL;
> +
> +               vxlan_raw_setup(dev);
> +       } else {
> +               vxlan_ether_setup(dev);
> +       }
>
>         vxlan->net = src_net;
>
> @@ -2789,8 +2910,12 @@ static int vxlan_dev_configure(struct net *src_net, struct net_device *dev,
>         dev->needed_headroom = needed_headroom;
>
>         memcpy(&vxlan->cfg, conf, sizeof(*conf));
> -       if (!vxlan->cfg.dst_port)
> -               vxlan->cfg.dst_port = default_port;
> +       if (!vxlan->cfg.dst_port) {
> +               if (conf->flags & VXLAN_F_GPE)
> +                       vxlan->cfg.dst_port = 4790; /* IANA assigned VXLAN-GPE port */
> +               else
> +                       vxlan->cfg.dst_port = default_port;
> +       }
>         vxlan->flags |= conf->flags;
>
>         if (!vxlan->cfg.age_interval)
> @@ -2961,6 +3086,9 @@ static int vxlan_newlink(struct net *src_net, struct net_device *dev,
>         if (data[IFLA_VXLAN_GBP])
>                 conf.flags |= VXLAN_F_GBP;
>
> +       if (data[IFLA_VXLAN_GPE])
> +               conf.flags |= VXLAN_F_GPE;
> +
>         if (data[IFLA_VXLAN_REMCSUM_NOPARTIAL])
>                 conf.flags |= VXLAN_F_REMCSUM_NOPARTIAL;
>
> @@ -2977,6 +3105,10 @@ static int vxlan_newlink(struct net *src_net, struct net_device *dev,
>         case -EEXIST:
>                 pr_info("duplicate VNI %u\n", be32_to_cpu(conf.vni));
>                 break;
> +
> +       case -EINVAL:
> +               pr_info("unsupported combination of extensions\n");
> +               break;
>         }
>
>         return err;
> @@ -3104,6 +3236,10 @@ static int vxlan_fill_info(struct sk_buff *skb, const struct net_device *dev)
>             nla_put_flag(skb, IFLA_VXLAN_GBP))
>                 goto nla_put_failure;
>
> +       if (vxlan->flags & VXLAN_F_GPE &&
> +           nla_put_flag(skb, IFLA_VXLAN_GPE))
> +               goto nla_put_failure;
> +
>         if (vxlan->flags & VXLAN_F_REMCSUM_NOPARTIAL &&
>             nla_put_flag(skb, IFLA_VXLAN_REMCSUM_NOPARTIAL))
>                 goto nla_put_failure;
> diff --git a/include/net/vxlan.h b/include/net/vxlan.h
> index 73ed2e951c02..dcc6f4057115 100644
> --- a/include/net/vxlan.h
> +++ b/include/net/vxlan.h
> @@ -119,6 +119,64 @@ struct vxlanhdr_gbp {
>  #define VXLAN_GBP_POLICY_APPLIED       (BIT(3) << 16)
>  #define VXLAN_GBP_ID_MASK              (0xFFFF)
>
> +/*
> + * VXLAN Generic Protocol Extension (VXLAN_F_GPE):
> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> + * |R|R|Ver|I|P|R|O|       Reserved                |Next Protocol  |
> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> + * |                VXLAN Network Identifier (VNI) |   Reserved    |
> + * +-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+-+
> + *
> + * Ver = Version. Indicates VXLAN GPE protocol version.
> + *
> + * P = Next Protocol Bit. The P bit is set to indicate that the
> + *     Next Protocol field is present.
> + *
> + * O = OAM Flag Bit. The O bit is set to indicate that the packet
> + *     is an OAM packet.
> + *
> + * Next Protocol = This 8 bit field indicates the protocol header
> + * immediately following the VXLAN GPE header.
> + *
> + * https://tools.ietf.org/html/draft-ietf-nvo3-vxlan-gpe-01
> + */
> +
> +struct vxlanhdr_gpe {
> +#if defined(__LITTLE_ENDIAN_BITFIELD)
> +       u8      oam_flag:1,
> +               reserved_flags1:1,
> +               np_applied:1,
> +               instance_applied:1,
> +               version:2,
> +reserved_flags2:2;
> +#elif defined(__BIG_ENDIAN_BITFIELD)
> +       u8      reserved_flags2:2,
> +               version:2,
> +               instance_applied:1,
> +               np_applied:1,
> +               reserved_flags1:1,
> +               oam_flag:1;
> +#endif
> +       u8      reserved_flags3;
> +       u8      reserved_flags4;
> +       u8      next_protocol;
> +       __be32  vx_vni;
> +};
> +
> +/* VXLAN-GPE header flags. */
> +#define VXLAN_HF_VER   cpu_to_be32(BIT(29) | BIT(28))
> +#define VXLAN_HF_NP    cpu_to_be32(BIT(26))
> +#define VXLAN_HF_OAM   cpu_to_be32(BIT(24))
> +
> +#define VXLAN_GPE_USED_BITS (VXLAN_HF_VER | VXLAN_HF_NP | VXLAN_HF_OAM | \
> +                            cpu_to_be32(0xff))
> +
> +/* VXLAN-GPE header Next Protocol. */
> +#define VXLAN_GPE_NP_IPV4      0x01
> +#define VXLAN_GPE_NP_IPV6      0x02
> +#define VXLAN_GPE_NP_ETHERNET  0x03
> +#define VXLAN_GPE_NP_NSH       0x04
> +
>  struct vxlan_metadata {
>         u32             gbp;
>  };
> @@ -206,16 +264,26 @@ struct vxlan_dev {
>  #define VXLAN_F_GBP                    0x800
>  #define VXLAN_F_REMCSUM_NOPARTIAL      0x1000
>  #define VXLAN_F_COLLECT_METADATA       0x2000
> +#define VXLAN_F_GPE                    0x4000
>
>  /* Flags that are used in the receive path. These flags must match in
>   * order for a socket to be shareable
>   */
>  #define VXLAN_F_RCV_FLAGS              (VXLAN_F_GBP |                  \
> +                                        VXLAN_F_GPE |                  \
>                                          VXLAN_F_UDP_ZERO_CSUM6_RX |    \
>                                          VXLAN_F_REMCSUM_RX |           \
>                                          VXLAN_F_REMCSUM_NOPARTIAL |    \
>                                          VXLAN_F_COLLECT_METADATA)
>
> +/* Flags that can be set together with VXLAN_F_GPE. */
> +#define VXLAN_F_ALLOWED_GPE            (VXLAN_F_GPE |                  \
> +                                        VXLAN_F_IPV6 |                 \
> +                                        VXLAN_F_UDP_ZERO_CSUM_TX |     \
> +                                        VXLAN_F_UDP_ZERO_CSUM6_TX |    \
> +                                        VXLAN_F_UDP_ZERO_CSUM6_RX |    \
> +                                        VXLAN_F_COLLECT_METADATA)
> +
>  struct net_device *vxlan_dev_create(struct net *net, const char *name,
>                                     u8 name_assign_type, struct vxlan_config *conf);
>
> diff --git a/include/uapi/linux/if_link.h b/include/uapi/linux/if_link.h
> index c488066fb53a..9427f17d06d6 100644
> --- a/include/uapi/linux/if_link.h
> +++ b/include/uapi/linux/if_link.h
> @@ -488,6 +488,7 @@ enum {
>         IFLA_VXLAN_REMCSUM_NOPARTIAL,
>         IFLA_VXLAN_COLLECT_METADATA,
>         IFLA_VXLAN_LABEL,
> +       IFLA_VXLAN_GPE,
>         __IFLA_VXLAN_MAX
>  };
>  #define IFLA_VXLAN_MAX (__IFLA_VXLAN_MAX - 1)
> --
> 1.8.3.1
>

On 04/06/2016 03:52 PM, Sjoerd Simons wrote:

> clk_get on a disabled clock node will return EPROBE_DEFER, which can
> cause drivers to be deferred forever if such clocks are referenced in
> their clocks property.
>
> Update the various disabled external clock nodes to default to a
> frequency of 0, but don't disable them to prevent this.
>
> Signed-off-by: Sjoerd Simons <sjoerd.simons@collabora.co.uk>
>
> ---
>
>   arch/arm/boot/dts/r8a7791-koelsch.dts | 1 +
>   arch/arm/boot/dts/r8a7791-porter.dts  | 1 +
>   arch/arm/boot/dts/r8a7791.dtsi        | 5 +----
>   3 files changed, 3 insertions(+), 4 deletions(-)
>
> diff --git a/arch/arm/boot/dts/r8a7791-koelsch.dts b/arch/arm/boot/dts/r8a7791-koelsch.dts
> index 1adf877..da59c28 100644
> --- a/arch/arm/boot/dts/r8a7791-koelsch.dts
> +++ b/arch/arm/boot/dts/r8a7791-koelsch.dts
> @@ -660,6 +660,7 @@
>   };
>
>   &pcie_bus_clk {
> +	clock-frequency = <100000000>;

    Hmmm, looking at the Koelsch schematics, I don't see this clock. :-/

>   	status = "okay";
>   };
>
> diff --git a/arch/arm/boot/dts/r8a7791-porter.dts b/arch/arm/boot/dts/r8a7791-porter.dts
> index 9554d13..19b257e 100644
> --- a/arch/arm/boot/dts/r8a7791-porter.dts
> +++ b/arch/arm/boot/dts/r8a7791-porter.dts
> @@ -413,6 +413,7 @@
>   };
>
>   &pcie_bus_clk {
> +	clock-frequency = <100000000>;
>   	status = "okay";
>   };
>

    Again, looking at the Porter schematics, I don't see this clock either. :-/

> diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
> index 8693888..676df63 100644
> --- a/arch/arm/boot/dts/r8a7791.dtsi
> +++ b/arch/arm/boot/dts/r8a7791.dtsi
> @@ -1104,8 +1104,7 @@
>   		pcie_bus_clk: pcie_bus {
>   			compatible = "fixed-clock";
>   			#clock-cells = <0>;
> -			clock-frequency = <100000000>;
> -			status = "disabled";
> +			clock-frequency = <0>;

    If the clock has a good default frequency, I don't think you need to 
remove it. Otherwise you missed USB_EXTAL which is 48 MHz (and can be overridden).

[...]

MBR, Sergei

Hey,

I've got a Porter board (Revision B) which stopped showing serial
output since the patch mentioned in the subject. The terrible clearly
wrong hack below gets serial back (reverting to just the  fck clock for
scif0) on both linux-next and linux master.

Unfortunately I don't have enough documentation on the board/hardware
to diagnose this further, but hopefully someone else does ;)

-- 
Sjoerd Simons
Collabora Ltd.

---
diff --git a/arch/arm/boot/dts/r8a7791.dtsi b/arch/arm/boot/dts/r8a7791.dtsi
index 8693888..b2c1f1c 100644
--- a/arch/arm/boot/dts/r8a7791.dtsi
+++ b/arch/arm/boot/dts/r8a7791.dtsi
@@ -731,9 +731,8 @@
 			     "renesas,scif";
 		reg = <0 0xe6e60000 0 64>;
 		interrupts = <GIC_SPI 152 IRQ_TYPE_LEVEL_HIGH>;
-		clocks = <&mstp7_clks R8A7791_CLK_SCIF0>, <&zs_clk>,
-			 <&scif_clk>;
-		clock-names = "fck", "brg_int", "scif_clk";
+		clocks = <&mstp7_clks R8A7791_CLK_SCIF0>;
+		clock-names = "fck";
 		dmas = <&dmac0 0x29>, <&dmac0 0x2a>,
 		       <&dmac1 0x29>, <&dmac1 0x2a>;
 		dma-names = "tx", "rx", "tx", "rx";

In ipgre mode (i.e. not gretap) with collect metadata flag set, the tunnel
is incorrectly assumed to be mGRE in NBMA mode (see commit 6a5f44d7a048c).
This is not the case, we're controlling the encapsulation addresses by
lwtunnel metadata. And anyway, assigning dev->header_ops in collect metadata
mode does not make sense.

Similarly, when a multicast remote IP address is set together with the
collect metadata flag, the processing described above would happen, too. As
there's not much sense in specifying remote/local IP address for lwtunnels,
reject such configuration.

v2: Reject configuration specifying both remote/local address and collect
    metadata flag.

Fixes: 2e15ea390e6f4 ("ip_gre: Add support to collect tunnel metadata.")
Signed-off-by: Jiri Benc <jbenc@redhat.com>
---
 net/ipv4/ip_gre.c | 12 +++++++++++-
 1 file changed, 11 insertions(+), 1 deletion(-)

diff --git a/net/ipv4/ip_gre.c b/net/ipv4/ip_gre.c
index af5d1f38217f..c035b43b1d4b 100644
--- a/net/ipv4/ip_gre.c
+++ b/net/ipv4/ip_gre.c
@@ -902,8 +902,9 @@ static int ipgre_tunnel_init(struct net_device *dev)
 			dev->header_ops = &ipgre_header_ops;
 		}
 #endif
-	} else
+	} else if (!tunnel->collect_md) {
 		dev->header_ops = &ipgre_header_ops;
+	}
 
 	return ip_tunnel_init(dev);
 }
@@ -946,6 +947,15 @@ static int ipgre_tunnel_validate(struct nlattr *tb[], struct nlattr *data[])
 	if (flags & (GRE_VERSION|GRE_ROUTING))
 		return -EINVAL;
 
+	if (data[IFLA_GRE_COLLECT_METADATA]) {
+		if (data[IFLA_GRE_REMOTE] &&
+		    nla_get_in_addr(data[IFLA_GRE_REMOTE]))
+			return -EINVAL;
+		if (data[IFLA_GRE_LOCAL] &&
+		    nla_get_in_addr(data[IFLA_GRE_LOCAL]))
+			return -EINVAL;
+	}
+
 	return 0;
 }
 
-- 
1.8.3.1

Fix two bugs with handling of the 'external' keyword for GRE.

Jiri Benc (2):
  ip link gre: create interfaces in external mode correctly
  ip link gre: print only relevant info in external mode

 ip/link_gre.c | 43 +++++++++++++++++++++++++------------------
 1 file changed, 25 insertions(+), 18 deletions(-)

-- 
1.8.3.1

From: Geert Uytterhoeven <geert+renesas@glider.be>

Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
---
 include/dt-bindings/power/r8a7790-sysc.h | 34 ++++++++++++++++++++++++++++++++
 1 file changed, 34 insertions(+)
 create mode 100644 include/dt-bindings/power/r8a7790-sysc.h

diff --git a/include/dt-bindings/power/r8a7790-sysc.h b/include/dt-bindings/power/r8a7790-sysc.h
new file mode 100644
index 000000000000..6af4e9929bd0
--- /dev/null
+++ b/include/dt-bindings/power/r8a7790-sysc.h
@@ -0,0 +1,34 @@
+/*
+ * Copyright (C) 2016 Glider bvba
+ *
+ * This program is free software; you can redistribute it and/or modify
+ * it under the terms of the GNU General Public License as published by
+ * the Free Software Foundation; version 2 of the License.
+ */
+#ifndef __DT_BINDINGS_POWER_R8A7790_SYSC_H__
+#define __DT_BINDINGS_POWER_R8A7790_SYSC_H__
+
+/*
+ * These power domain indices match the numbers of the interrupt bits
+ * representing the power areas in the various Interrupt Registers
+ * (e.g. SYSCISR, Interrupt Status Register)
+ */
+
+#define R8A7790_PD_CA15_CPU0		 0
+#define R8A7790_PD_CA15_CPU1		 1
+#define R8A7790_PD_CA15_CPU2		 2
+#define R8A7790_PD_CA15_CPU3		 3
+#define R8A7790_PD_CA7_CPU0		 5
+#define R8A7790_PD_CA7_CPU1		 6
+#define R8A7790_PD_CA7_CPU2		 7
+#define R8A7790_PD_CA7_CPU3		 8
+#define R8A7790_PD_CA15_SCU		12
+#define R8A7790_PD_SH_4A		16
+#define R8A7790_PD_RGX			20
+#define R8A7790_PD_CA7_SCU		21
+#define R8A7790_PD_IMP			24
+
+/* Always-on power area */
+#define R8A7790_PD_ALWAYS_ON		32
+
+#endif /* __DT_BINDINGS_POWER_R8A7790_SYSC_H__ */
-- 
2.7.0.rc3.207.g0ac5344
