Return-Path: <SRS0=lhsG=QE=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4AF5BC282C8
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 16:35:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0460920844
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 28 Jan 2019 16:35:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="i/+IfggS"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2389783AbfA1Qfp (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 28 Jan 2019 11:35:45 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:34411 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389078AbfA1Qfo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 Jan 2019 11:35:44 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D012425B7BA;
        Tue, 29 Jan 2019 03:35:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548693343; bh=2sXz8tKmkSGOFC/Aprio4ztb8ZCYofPqo8MAVncgY4U=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=i/+IfggSB0Vuvxtj4SWL/YkTKkN015Ola1ieSyd2sbaPgbM3xCbuj38UVA+b2OIxL
         ChVCFiTaPUF16KhUYoF6KjL+C+0wKG1MkScxVzNZPQJFIIvj6rQUMoXEMPRBA6sVHE
         5khMlj99WuMOxxmC9qRy1VYlQ9MXQDEXXDajkOws=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 49EC29403E0; Mon, 28 Jan 2019 17:35:40 +0100 (CET)
Date:   Mon, 28 Jan 2019 17:35:40 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH] clk: renesas: r8a77990: Add Z2 clock
Message-ID: <20190128163337.t2ditrru474ybdob@verge.net.au>
References: <20190128140127.17540-1-horms+renesas@verge.net.au>
 <CAMuHMdUw6WjkykiCwK6_SYt+ktF-DkU+jczuoLuRh0-fKpVNwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUw6WjkykiCwK6_SYt+ktF-DkU+jczuoLuRh0-fKpVNwA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 04:12:03PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Jan 28, 2019 at 3:01 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > Adds Z2 clock to CPG driver for the R-Car E3 (r8a77990) SoC.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks for your patch!
> 
> > --- a/drivers/clk/renesas/r8a77990-cpg-mssr.c
> > +++ b/drivers/clk/renesas/r8a77990-cpg-mssr.c
> > @@ -79,6 +79,7 @@ static const struct cpg_core_clk r8a77990_core_clks[] __initconst = {
> >         DEF_RATE(".oco",       CLK_OCO,            8 * 1000 * 1000),
> >
> >         /* Core Clock Outputs */
> > +       DEF_FIXED("z2",        R8A77990_CLK_Z2,    CLK_PLL0D4,     1, 1),
> 
> According to R-Car Gen3 Hardware User's Manual rev. 1.50, the SYS-CPU
> Divider 2 is controlled through the Z2FC bit field in the Frequency
> Control Register C. So it is not a fixed clock, unlike on R-Car D3.

Thanks, I will look into that.
