Return-Path: <SRS0=VPlw=OZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 824D7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:59:21 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4775A206BA
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 16 Dec 2018 20:59:21 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="mmdWCCJZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730791AbeLPU7U (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 16 Dec 2018 15:59:20 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:59288 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730758AbeLPU7U (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 16 Dec 2018 15:59:20 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4352825B764;
        Mon, 17 Dec 2018 07:59:17 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1544993957; bh=P81ZrtUEk0Qh614+Me9I797uGZQ8efwXZWDBKozLH34=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=mmdWCCJZ8oy9oGKktE6evYtotwJD3TozAy8oOgiQb+jN68ZV2TMAbuLlnCx3UJuNb
         5lkKLr7CDZR4ELVOJqEN4Eltcd5zgoowFdIKfTF1BNVXOO1q4lw4rQA5Kb5E9qBo07
         kAndpVlFvWW3HuFPamxYYI9kswhGrNOd16A6p+2U=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 45F6BE2120F; Sun, 16 Dec 2018 12:59:15 -0800 (PST)
Date:   Sun, 16 Dec 2018 21:59:15 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH/RFT net] ravb: expand rx descriptor data to accommodate
 hw checksum
Message-ID: <20181216205914.de7djny5nijc5rzb@verge.net.au>
References: <20181210085917.23056-1-horms+renesas@verge.net.au>
 <67e81db3-03d7-6b7f-1b72-132de5236e5c@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <67e81db3-03d7-6b7f-1b72-132de5236e5c@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 10, 2018 at 07:56:14PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 12/10/2018 11:59 AM, Simon Horman wrote:
> 
> > From: Simon Horman <horms@verge.net.au>
> > 
> > EtherAVB may provide a checksum of packet data appended to packet data. In
> > order to allow this checksum to be received by the host descriptor data
> > needs to be enlarged by 2 bytes to accommodate the checksum.
> > 
> > In the case of MTU-sized packets without a VLAN tag the
> > checksum were already accommodated by virtue of the space reserved for the
> > VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
> > packet data space provided by a descriptor leaving no space for the
> > trailing checksum.
> > 
> > This was not detected by the driver which incorrectly used the last two
> > bytes of packet data as the checksum and truncate the packet by two bytes.
> > This resulted all such packets being dropped.
> > 
> > A work around is to disable rx checksum offload
> >  # ethtool -K eth0 rx off
> > 
> > This patch resolves this problem by increasing the size available for
> > packet data in rx descriptors by two bytes. It also introduces
> > RAVB_CSUM_LEN to make things a little clearer than "2" sprinkled lightly
> > over the driver.
> 
>    I think a comment would work better in this case.
> 
> > Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board
> 
>    You need more testing (RFT specified in the subject)?

I was hoping that others would test the patch on the same or other boards.
That is all.

> 
> > Fixes: 4d86d3818627 ("ravb: RX checksum offload")
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  drivers/net/ethernet/renesas/ravb_main.c | 14 +++++++++-----
> >  1 file changed, 9 insertions(+), 5 deletions(-)
> > 
> >  I have marked this patch as RTF as I would like it to see further testing
> >  before being applied.
> > 
> > diff --git a/drivers/net/ethernet/renesas/ravb_main.c b/drivers/net/ethernet/renesas/ravb_main.c
> > index defed0d0c51d..f7f130cf61e4 100644
> > --- a/drivers/net/ethernet/renesas/ravb_main.c
> > +++ b/drivers/net/ethernet/renesas/ravb_main.c
> > @@ -40,6 +40,8 @@
> >  		 NETIF_MSG_RX_ERR | \
> >  		 NETIF_MSG_TX_ERR)
> >  
> > +#define RAVB_CSUM_LEN 2
> 
>    What's EtherAVB specific there, why RAVB prefix?
> 
> [...]
> > @@ -350,7 +352,7 @@ static int ravb_ring_init(struct net_device *ndev, int q)
> >  	int i;
> >  
> >  	priv->rx_buf_sz = (ndev->mtu <= 1492 ? PKT_BUF_SZ : ndev->mtu) +
> > -		ETH_HLEN + VLAN_HLEN;
> > +		ETH_HLEN + VLAN_HLEN + RAVB_CSUM_LEN;
> 
>    This is a fix per se. Let's add the #define (if we really need it) in
> another patch.

It seems that David likes the #define, lets keep it.
