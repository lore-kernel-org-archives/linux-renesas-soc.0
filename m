Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EE9F7C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 19:59:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B66E320874
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 19:59:02 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="K9vk2FlZ"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387830AbeLQT7C (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 14:59:02 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:45812 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732626AbeLQT7C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 14:59:02 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id F202F25B812;
        Tue, 18 Dec 2018 06:58:59 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545076740; bh=u34vi8HE/aCFm1U4lYmQq/lJ8c6czky58bG50OFvp9c=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=K9vk2FlZT8ME+haeQe+LzNdPbqrcNSotXFG3iQhsgd5qx/hAqCcXmoHAo7Q5HjUUY
         edc985FimJ74cB2a/R7e88YY5cZpMJB5IK0qXm4U7coQwQwrGr3jITCJY517SnZOMn
         Ye9Kik46ufzkyBsJp3hXpW7AuXf+Rn275vDhJnT8=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 095B194048A; Mon, 17 Dec 2018 20:58:57 +0100 (CET)
Date:   Mon, 17 Dec 2018 20:58:57 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Subject: Re: [PATCH 06/15] pinctrl: sh-pfc: r8a77995: Remove bogus
 SEL_PWM[0-3]_3 configurations
Message-ID: <20181217195857.vaxxsfm4uwyfs6zi@verge.net.au>
References: <20181213182714.26094-1-geert+renesas@glider.be>
 <20181213182714.26094-7-geert+renesas@glider.be>
 <20181217140723.l76nsznmu7exzqha@verge.net.au>
 <CAMuHMdUjvVUd52hco_kmNVs2hscfr4vXhd1rZvSegGz7kTYCTg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUjvVUd52hco_kmNVs2hscfr4vXhd1rZvSegGz7kTYCTg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 03:12:27PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Dec 17, 2018 at 3:07 PM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Dec 13, 2018 at 07:27:05PM +0100, Geert Uytterhoeven wrote:
> > > While the SEL_PWM[0-3] fields in the Module Select Register 0 support 4
> >
> > s/support/supports
> 
> "fields" is plural, hence "support".

Yes, I see that now. Sorry for the noise.

> > > possible configurations per PWM pin, only the first 3 are valid.
> > >
> > > Replace the invalid and unused configurations for SEL_PWM[0-3]_3 by
> > > dummies.
> > >
> > > Fixes: 794a6711764658a1 ("pinctrl: sh-pfc: Initial R8A77995 PFC support")
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
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
