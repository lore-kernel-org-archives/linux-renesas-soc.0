Return-Path: <SRS0=7Xuf=PR=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9F52C43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 16:58:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 6F9A8206B7
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  9 Jan 2019 16:58:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="qtnHsmtn"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726778AbfAIQ62 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 9 Jan 2019 11:58:28 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53580 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726639AbfAIQ61 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 9 Jan 2019 11:58:27 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id C379C25B780;
        Thu, 10 Jan 2019 03:58:25 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547053106; bh=dznEJDjOOjNrhlXP3RBUxBg40PRs5r4ApPNfVC0oEhQ=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=qtnHsmtnqtahyTCQCsZR8Juo+oCkkPTBhwEMdIKiLt/JU/YohU2mZKwm1T51lKD8j
         TS1XP5BbDk393ZsXW6nsoAOWwPFTlzla/ByoUM1mV4B8YulxyjXN7nvjXe9+LApYYz
         pK4u8Ypd1oVWsl3fifV69eqlzC89JpkpVmhdNWwM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 9B886940420; Wed,  9 Jan 2019 17:58:23 +0100 (CET)
Date:   Wed, 9 Jan 2019 17:58:23 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Marek Vasut <marek.vasut@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: ebisu: Fix backlight
 regulator numbering
Message-ID: <20190109165822.tmj7qbho46f7clvg@verge.net.au>
References: <20190109140045.17449-1-marek.vasut@gmail.com>
 <CAMuHMdX3bP_WCYNRRMmVRPwV52e72NOZMtW8cf29Fo+E9_CvcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX3bP_WCYNRRMmVRPwV52e72NOZMtW8cf29Fo+E9_CvcQ@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Jan 09, 2019 at 04:26:25PM +0100, Geert Uytterhoeven wrote:
> On Wed, Jan 9, 2019 at 3:01 PM <marek.vasut@gmail.com> wrote:
> > From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >
> > There are two regulator1 nodes in the Ebisu DTS right now, one 3.3V for
> > the eMMC and one 12V for the backlight. This causes one to be overwritten
> > by the other, ultimatelly resulting in inoperable eMMC, which depends on
> > the former. Fix this by renumbering the backlight regulator to regulator2.
> >
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> > Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> > Cc: Simon Horman <horms+renesas@verge.net.au>
> > Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Cc: linux-renesas-soc@vger.kernel.org
> > Reported-by: Simon Horman <horms+renesas@verge.net.au>
> > Fixes: 9d16c4a10e07 ("arm64: dts: renesas: r8a77990: ebisu: Add backlight")
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -191,7 +191,7 @@
> >                 clock-frequency = <24576000>;
> >         };
> >
> > -       reg_12p0v: regulator1 {
> > +       reg_12p0v: regulator2 {
> >                 compatible = "regulator-fixed";
> >                 regulator-name = "D12.0V";
> >                 regulator-min-microvolt = <12000000>;
> 
> Perhaps the node name should get a more descriptive suffix
> (e.g. "regulator-12p0v"), like is already done for some of the other
> regulators?

I think I would prefer that addressed in a follow-up patch.
