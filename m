Return-Path: <SRS0=sjaF=PT=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4B65CC43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 15:48:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0F55420700
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 11 Jan 2019 15:48:53 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Yt4nNebc"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730889AbfAKPsw (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 11 Jan 2019 10:48:52 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41339 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1730850AbfAKPsw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 11 Jan 2019 10:48:52 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 9455925BEB5;
        Sat, 12 Jan 2019 02:48:49 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547221729; bh=yAF4bJDOtXmgycRsDW0Ci74f99uJgvYerFO+rC1QlcA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Yt4nNebcdrp+T3B6hzHZ8/wkJPtG+WUhzkdW/RixOW2cwNRx0c/PBRMZc0b8m+b4D
         +J3KytGuF79TdHkiEUSTOQjqZPm8Ao2wlWqwEZse/ioiqtLnIksipB8XMF2VhpVgOc
         CjsrEcIddN3TGGJDHzYdzE0iv5C4tLDq+NXUaSSM=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id C4E9CE21324; Fri, 11 Jan 2019 07:48:47 -0800 (PST)
Date:   Fri, 11 Jan 2019 16:48:47 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     David Miller <davem@davemloft.net>,
        Magnus Damm <magnus.damm@gmail.com>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH net] ravb: expand rx descriptor data to accommodate hw
 checksum
Message-ID: <20190111154843.k7pejayjrkwvj4pp@verge.net.au>
References: <20190110140222.32740-1-horms+renesas@verge.net.au>
 <3a5c3a17-a410-fba7-32eb-a3495c5378de@cogentembedded.com>
 <20190111133502.dma5hft5wgowdg6l@verge.net.au>
 <c4b650e0-709b-d078-e094-41b652603906@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <c4b650e0-709b-d078-e094-41b652603906@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 11, 2019 at 06:22:12PM +0300, Sergei Shtylyov wrote:
> On 01/11/2019 04:35 PM, Simon Horman wrote:
> 
> >>> EtherAVB may provide a checksum of packet data appended to packet data. In
> >>> order to allow this checksum to be received by the host descriptor data
> >>> needs to be enlarged by 2 bytes to accommodate the checksum.
> >>>
> >>> In the case of MTU-sized packets without a VLAN tag the
> >>> checksum were already accommodated by virtue of the space reserved for the
> >>> VLAN tag. However, a packet of MTU-size with a  VLAN tag consumed all
> >>> packet data space provided by a descriptor leaving no space for the
> >>> trailing checksum.
> >>
> >>    Wait! The gen3 manual is rather clear about the auto-checksumming not working
> >> right in the presence of the VLAN tag. Where do you check for that case?
> > 
> > In my testing on E3 this works correctly. Which portion of
> > the manual are you referring to?
> 
>    Section 50.4.1 in R-Car Series, 3rd Generation User’s Manual: Hardware, Rev 1.00,
> section 45A.3.14.1 in R-Car Series, 2nd Generation User’s Manual: Hardware, Rev 2.00.
>    The problem is that the checksum is always calculated starting at byte
> 14, i.e.  amidst the VLAN header (if present).

Yes, I understand that. What I'm unclear on is why that is a problem.
Empirically I have observed that RX csum offload works in the presence
of a VLAN tag and offers a significant benefit in terms of reduced CPU
utilisation.

> >>> This was not detected by the driver which incorrectly used the last two
> >>> bytes of packet data as the checksum and truncate the packet by two bytes.
> >>> This resulted all such packets being dropped.
> >>>
> >>> A work around is to disable rx checksum offload
> >>>  # ethtool -K eth0 rx off
> >>>
> >>> This patch resolves this problem by increasing the size available for
> >>> packet data in rx descriptors by two bytes. It also introduces
> >>> RAVB_CSUM_LEN to make things a little clearer than "2" sprinkled lightly
> >>> over the driver.
> >>
> >>    What about using sizeof(__sum16) instead? That type is declared in
> >> <linux/types.h> and used in 'struct iphdr'...
> > 
> > As in the following?
> > 
> > #define RAVB_CSUM_LEN sizeof(__sum16)
> 
>    No, as I said, I'd prefer to avoid any driver specific #define's.

If that is your preference I can update the patch accordingly.

> >>> Tested on R-Car E3 (r8a77990) ES1.0 based Ebisu-4D board
> >>>
> >>> Fixes: 4d86d3818627 ("ravb: RX checksum offload")
> >>> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >> [...]
> 
> MBR, Sergei
> 
