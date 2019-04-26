Return-Path: <SRS0=L5iE=S4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-6.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A7D08C43219
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:53:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7DC0120679
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 26 Apr 2019 09:53:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726199AbfDZJxQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 26 Apr 2019 05:53:16 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:45822 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725944AbfDZJxP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 26 Apr 2019 05:53:15 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B6CE725AD60;
        Fri, 26 Apr 2019 19:53:13 +1000 (AEST)
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id CAAB99403ED; Fri, 26 Apr 2019 11:53:11 +0200 (CEST)
Date:   Fri, 26 Apr 2019 11:53:11 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 3/4] pinctrl: sh-pfc: Add check for empty pinmux
 groups/functions
Message-ID: <20190426095311.xu7yo7cksqiwznek@verge.net.au>
References: <20190425095542.726-1-geert+renesas@glider.be>
 <20190425095542.726-4-geert+renesas@glider.be>
 <20190426093454.pvmc426w5wca2jj3@verge.net.au>
 <CAMuHMdW1T-LCRN0R=3bh1gq1Ai3g1jgy8jcxQP6Xd0uVDeHHwA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW1T-LCRN0R=3bh1gq1Ai3g1jgy8jcxQP6Xd0uVDeHHwA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Apr 26, 2019 at 11:42:11AM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Apr 26, 2019 at 11:35 AM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Apr 25, 2019 at 11:55:41AM +0200, Geert Uytterhoeven wrote:
> > > The pinmux groups and functions arrays may contain two parts, to ease
> > > supporting SoCs that expose pin subsets of other related SoCs.  Both
> > > parts need to be declared with explicit sizes, which thus need to be
> > > updated when adding support for more groups and functions.
> > >
> > > If a size is too small, the compiler will detect this at build time
> > > ("excess elements in array initializer").
> > > If a size is too large, this may go undetected (for pin groups), lead to
> > > pin controller registration failures (for pin functions: "pinmux ops has
> > > no name for functionN"), or crash the optional run-time debug code (for
> > > pin groups).
> > >
> > > Extend the run-time debug code with checks to detect this, to help
> > > catching bugs early.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thank you!
> 
> > > --- a/drivers/pinctrl/sh-pfc/core.c
> > > +++ b/drivers/pinctrl/sh-pfc/core.c
> > > @@ -780,9 +780,15 @@ static void __init sh_pfc_check_info(const struct sh_pfc_soc_info *info)
> > >
> > >       for (i = 0; i < info->nr_functions; i++) {
> > >               func = &info->functions[i];
> > > +             if (!func->name) {
> > > +                     pr_err("%s: empty function %u\n", drvname, i);
> > > +                     sh_pfc_errors++;
> >
> > Not strictly related to this patch but did
> > you consider not having sh_pfc_errors global to this file?
> 
> Do you have an alternative?
> I could hide it, and combine it with the pr_err() in a sh_pfc_report_error()
> function, but it would still be global.

I didn't look carefully for an alternative.
If its not practical to pass around a local variable then
I'm happy with the current setup.
