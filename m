Return-Path: <SRS0=jJK9=SF=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DF7F4C4360F
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:37:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AEB8A206B7
	for <linux-renesas-soc@archiver.kernel.org>; Wed,  3 Apr 2019 08:37:48 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="YHj9r/s4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726862AbfDCIhs (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 3 Apr 2019 04:37:48 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:34989 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726048AbfDCIhs (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Apr 2019 04:37:48 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id ECF2825BDFF;
        Wed,  3 Apr 2019 19:37:45 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1554280666; bh=Y4ApBQzpPsbvZ6uAYQMeVyZB+td0r1wLd8zcHdrIAIg=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=YHj9r/s4QUvz+63J6HAzxEALqyGlA6SHZE2T/ddb+rjpv7bCEJlvdpi0tAAQ+dauw
         HYOx3qnAzc6fKyFNEnEbx3Zf/egwrwIbS6t/y+m7j7yXv13T5SexKhnmE8CDAEnRTk
         xI0nY6yX/tC/p+Um/miLV6lPz34KFXGPXwwknOfM=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id B4435940361; Wed,  3 Apr 2019 10:37:43 +0200 (CEST)
Date:   Wed, 3 Apr 2019 10:37:43 +0200
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 4/8] pinctrl: sh-pfc: rcar-gen3: Remove HDMI CEC pins,
 groups, and functions
Message-ID: <20190403083743.pveg243luo7irdd2@verge.net.au>
References: <20190329152942.13995-1-geert+renesas@glider.be>
 <20190329152942.13995-5-geert+renesas@glider.be>
 <20190401101425.5w7ueezlsat3fncz@verge.net.au>
 <20190401102551.wwznt2qnnccsx2u6@verge.net.au>
 <CAMuHMdV8h4pO7kLKnKnkGAZc_1GD1PVOEZk+bBqNA54GQGkwcA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdV8h4pO7kLKnKnkGAZc_1GD1PVOEZk+bBqNA54GQGkwcA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Apr 01, 2019 at 12:58:13PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Apr 1, 2019 at 12:25 PM Simon Horman <horms@verge.net.au> wrote:
> > On Mon, Apr 01, 2019 at 12:14:26PM +0200, Simon Horman wrote:
> > > On Fri, Mar 29, 2019 at 04:29:38PM +0100, Geert Uytterhoeven wrote:
> > > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > >
> > > > This reverts commit 7793ac664c5ebebdb021c4ec66ff9d174d58e98e.
> > > >
> > > > The HDMI CEC function is not supported by the R-Car Gen3 Hardware Manual
> > > > Rev 1.00. Therefore, delete the corresponding pin groups and functions,
> > > > and rename the HDMI[01]_CEC definitions to match their GPIO
> > > > functionality.
> > > >
> > > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > > [geert: Squashed several commits]
> > >
> > > Ok, but it now does a lot more than revert
> > > 7793ac664c5ebebdb021c4ec66ff9d174d58e98e.
> > > That confused me a bit.
> 
> Sorry, I forgot to remove that line when squashing the commits.
> Will fix when queuing.

Great, thanks!

> > That notwithstanding,
> >
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Thanks!
> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds
> 
