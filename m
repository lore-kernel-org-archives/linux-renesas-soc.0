Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:41536 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727034AbeLJQ4S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 11:56:18 -0500
Received: by mail-lj1-f194.google.com with SMTP id k15-v6so10270164ljc.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 08:56:17 -0800 (PST)
Subject: Re: [PATCH/RFT net] ravb: expand rx descriptor data to accommodate hw
 checksum
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20181210085917.23056-1-horms+renesas@verge.net.au>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <67e81db3-03d7-6b7f-1b72-132de5236e5c@cogentembedded.com>
Date: Mon, 10 Dec 2018 19:56:14 +0300
MIME-Version: 1.0
In-Reply-To: <20181210085917.23056-1-horms+renesas@verge.net.au>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/10/2018 11:59 AM, Simon Horman wrote:

> From: Simon Horman <horms@verge.net.au>
> 
> EtherAVB may provide a checksum of packet data appended to packet data. In
> order to allow this checksum to be received by the host descriptor data
> needs to be enlarged by 2 bytes to accommodate the checksum.
> 
> In the case of MTU-sized packets without a VLAN tag the
> checksum were already accommodated by virtue of the space reserved for the
> VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
> packet data space provided by a descriptor leaving no space for the
> trailing checksum.
> 
> This was not detected by the driver which incorrectly used the last two
> bytes of packet data as the checksum and truncate the packet by two bytes.
> This resulted all such packets being dropped.
> 
> A work around is to disable rx checksum offload
>  # ethtool -K eth0 rx off
> 
> This patch resolves this problem by increasing the size available for
> packet data in rx descriptors by two bytes. It also introduces
> RAVB_CSUM_LEN to make things a little clearer than "2" sprinkled lightly
> over the driver.

   I think a comment would work better in this case.

> Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board

   You need more testing (RFT specified in the subject)?

> Fixes: 4d86d3818627 ("ravb: RX checksum offload")
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++-----
>  1 file changed, 9 insertions(+), 5 deletions(-)
> 
>  I have marked this patch as RTF as I would like it to see further testing
>  before being applied.
> 
> diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> index defed0d0c51d..f7f130cf61e4 100644
> --- a/drivers/net/ethernet/renesas/ravb_main.c
> +++ b/drivers/net/ethernet/renesas/ravb_main.c
> @@ -40,6 +40,8 @@
>  		 NETIF_MSG_RX_ERR | \
>  		 NETIF_MSG_TX_ERR)
>  
> +#define RAVB_CSUM_LEN 2

   What's EtherAVB specific there, why RAVB prefix?

[...]
> @@ -350,7 +352,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
>  	int i;
>  
>  	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
> -		ETH_HLEN + VLAN_HLEN;
> +		ETH_HLEN + VLAN_HLEN + RAVB_CSUM_LEN;

   This is a fix per se. Let's add the #define (if we really need it) in
another patch.

[...]

MBR, Sergei
