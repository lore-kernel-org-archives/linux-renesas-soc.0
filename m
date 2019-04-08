Return-Path: <SRS0=yOlw=SK=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8FC0DC282CE
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 09:45:55 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 50E9F20870
	for <linux-renesas-soc@archiver.kernel.org>; Mon,  8 Apr 2019 09:45:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="BTyTZGNC"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726383AbfDHJpz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 8 Apr 2019 05:45:55 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:49681 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726253AbfDHJpy (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 8 Apr 2019 05:45:54 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 19FC125B766;
        Mon,  8 Apr 2019 19:45:53 +1000 (AEST)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554716753; bh=a8yFJvtnHQTRDeEePGs91FDOCdeojOy+6G5WbiDfaVQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=BTyTZGNCTkU+XQ0ZSjsNnp9IXqxqB2Bur5a6p6He11Ib5DMUeXGwFBSjnZLlp8qF6
         imErFRZQla5bb6+4hli6Y8puMg+A6TgBoPfDLOTpwWlO19EOu5uV4a/8jkIAPgn2/A
         Nvdbp+KbcxzU1LsehmnPk+nOvBB7ZstPl1+oYigM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 275E594069B; Mon,  8 Apr 2019 11:45:51 +0200 (CEST)
Date:   Mon, 8 Apr 2019 11:45:51 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Wolfram Sang <wsa@the-dreams.de>
Cc:     linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: Re: [PATCH/RFC] arm64: dts: renesas: ebisu, draak: Limit EtherAVB to
 100Mbps
Message-ID: <20190408094550.omzfxgsxalux7pxv@verge.net.au>
References: <20190408083148.23134-1-horms+renesas@verge.net.au>
 <20190408084143.GA1615@kunai>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190408084143.GA1615@kunai>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 08, 2019 at 10:41:43AM +0200, Wolfram Sang wrote:
> Hi Simon,
> 
> On Mon, Apr 08, 2019 at 10:31:48AM +0200, Simon Horman wrote:
> > * According to the R-Car Gen3 Hardware Manual Errata for Rev 1.00 of
> >   August 24, 2018, the TX clock internal delay mode isn't supported
> >   on R-Car E3 (r8a77990) and D3 (r8a77995).
> > 
> > * TX clock internal delay mode is required for reliable 1Gbps communication
> >   using the KSZ9031RNX phy present on the Ebisu and Draak boards.
> > 
> > Thus, the E3 based Ebisu and D3 based Draak boards reliably use 1Gbps and
> > the speed should be limited to 100Mbps.
> 
> "cannot" missing?

Yes indeed, thanks for noticing.

> > Based on work by Kazuya Mizuguchi.
> > 
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 1 +
> >  arch/arm64/boot/dts/renesas/r8a77995-draak.dts | 1 +
> >  2 files changed, 2 insertions(+)
> > 
> >  Based on renesas-devel-20190404-v5.1-rc3
> > 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > index c72772589953..05214b8dd2c5 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -272,6 +272,7 @@
> >  		interrupt-parent = <&gpio2>;
> >  		interrupts = <21 IRQ_TYPE_LEVEL_LOW>;
> >  		reset-gpios = <&gpio1 20 GPIO_ACTIVE_LOW>;
> > +		max-speed = <100>;
> 
> What about adding a comment explaining this speed limit?

Sure, if you think its worth highlighting in the dts as
well as the changelog.


