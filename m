Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E93A6C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 13:35:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id BBA1F20874
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 13:35:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="RRsZF/gu"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730460AbfAKNfH (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 08:35:07 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:33659 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725789AbfAKNfH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 08:35:07 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 20F6D25B82E;
        Sat, 12 Jan 2019 00:35:05 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547213705; bh=+61tSiWvbg1W6Er0qu2X0Rv/Fn0YzWp/mt7JnYsZX2M=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=RRsZF/guo+rIZqsbDLkObWGuhGGazU2IvYnKLozdJRnnJG78XDq7kr+IOCMir+chX
         o0hevA5BK/vjAv1IHOuAnu6ob3btTi6o/UkR8viZ61t7iGUEYf7YKgLy87ENFLIIUN
         6tzRdnLpa2LaEZw27xOmRG9Z8hfbd2YrZbDFY/ns=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 15B28E2182A; Fri, 11 Jan 2019 05:35:03 -0800 (PST)
Date:   Fri, 11 Jan 2019 14:35:03 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net] ravb: expand rx descriptor data to accommodate hw
 checksum
Message-ID: <20190111133502.dma5hft5wgowdg6l@verge.net.au>
References: <20190110140222.32740-1-horms+renesas@verge.net.au>
 <3a5c3a17-a410-fba7-32eb-a3495c5378de@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3a5c3a17-a410-fba7-32eb-a3495c5378de@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Jan 10, 2019 at 06:52:51PM +0300, Sergei Shtylyov wrote:
> Hello!
> 
> On 01/10/2019 05:02 PM, Simon Horman wrote:
> 
> > EtherAVB may provide a checksum of packet data appended to packet data. In
> > order to allow this checksum to be received by the host descriptor data
> > needs to be enlarged by 2 bytes to accommodate the checksum.
> > 
> > In the case of MTU-sized packets without a VLAN tag the
> > checksum were already accommodated by virtue of the space reserved for the
> > VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
> > packet data space provided by a descriptor leaving no space for the
> > trailing checksum.
> 
>    Wait! The gen3 manual is rather clear about the auto-checksumming not working
> right in the presence of the VLAN tag. Where do you check for that case?

In my testing on E3 this works correctly. Which portion of
the manual are you referring to?

> 
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
>    What about using sizeof(__sum16) instead? That type is declared in
> <linux/types.h> and used in 'struct iphdr'...

As in the following?

#define RAVB_CSUM_LEN sizeof(__sum16)

> 
> > 
> > Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board
> > 
> > Fixes: 4d86d3818627 ("ravb: RX checksum offload")
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> [...]
> 
> MBR, Sergei
> 
