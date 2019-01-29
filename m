Return-Path: <SRS0=a0xC=QF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA7E4C4151A
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 08:00:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7283B214DA
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 29 Jan 2019 08:00:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="kMGCPTXg"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726877AbfA2IAJ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 29 Jan 2019 03:00:09 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:49923 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725294AbfA2IAJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 29 Jan 2019 03:00:09 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id E040B25B74E;
        Tue, 29 Jan 2019 19:00:06 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548748807; bh=V4ezZm7TpNQNky4PeFAQcHr1ftZsDLV1FljS6Luc2HA=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=kMGCPTXgjf4Px5AD7673EXe6t07aLuv7egbuhQkweMeABexeBTq9+rkZt8BTugpuh
         bgPOI2cqJVVaxdyHsagosFzWTWjlVkLgCoIecaqPuyeH7XY7/tIx66dCwa5kKBbs+m
         8Yxd+rQ1Fre7eu7+yhI/oOuRGgxPaUPzYwobelW4=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id EC19A940472; Tue, 29 Jan 2019 09:00:04 +0100 (CET)
Date:   Tue, 29 Jan 2019 09:00:04 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc:     netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Subject: Re: [PATCH 3/7] sh_eth: offload RX checksum on R7S72100
Message-ID: <20190129080004.blc3jrt5y2j7dauo@verge.net.au>
References: <fc43bfa2-4312-b52b-a749-e3e43e242a95@cogentembedded.com>
 <0476beba-ea1f-7675-aa08-573b74e84f4e@cogentembedded.com>
 <20190128122053.vb5ifhf34zbnuclp@verge.net.au>
 <916ed105-d499-4ca1-8418-4743b5a7a60d@cogentembedded.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <916ed105-d499-4ca1-8418-4743b5a7a60d@cogentembedded.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 06:21:11PM +0300, Sergei Shtylyov wrote:
> On 01/28/2019 03:20 PM, Simon Horman wrote:
> 
> >> The RZ/A1H (R7S721000) SoC manual describes the Ether MAC's RX checksum
> >> offload the same way as it's implemented in the EtherAVB MACs...
> >>
> >> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> > 
> > Regarding this and the remaining patches in this series,
> > which add rx-csum offload support in the sh_eth driver for
> > various SoCs: has this been tested?
> 
>    As I said, I've only tested it on R8A77980.

Thanks, I missed that.

As you may have guessed the implication of my question is that
IMHO it would be best only to add this feature to SoCs where
it has been tested.
