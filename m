Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6AE8AC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:33:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 318592087C
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:33:11 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="FJVQYySv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726478AbfBYJdL (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:33:11 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:40658 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726395AbfBYJdK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:33:10 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 4044C25B784;
        Mon, 25 Feb 2019 20:33:09 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551087189; bh=lHBE+tPjJqRGNvpmushXjqhieqsuUdO3jqcKYXjXJM0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=FJVQYySvBU0/iTc5Qvv3hVfnWMBBhyS/NiNJvLHhlyF2KCyBGraFWNMkSAc2dJQ/0
         7BWkyp3Mao09/MR+ANlJQbqQ93Evl1lPAA4gOAbt8Wj2badl38PSdCmkJ/cWeJVOMe
         Rioz3xwRw2KraZCrdA1knJxWuHneH3XfdM+6bTYg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6561494056F; Mon, 25 Feb 2019 10:33:07 +0100 (CET)
Date:   Mon, 25 Feb 2019 10:33:07 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        "linux-renesas-soc@vger.kernel.org" 
        <linux-renesas-soc@vger.kernel.org>,
        TAKESHI KIHARA <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
Message-ID: <20190225093307.6sjb42jzhe3jjlvn@verge.net.au>
References: <20190221125938.12279-1-geert+renesas@glider.be>
 <TY1PR01MB177015CEE83F9802C50FC6F7C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <TY1PR01MB177015CEE83F9802C50FC6F7C07E0@TY1PR01MB1770.jpnprd01.prod.outlook.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Thu, Feb 21, 2019 at 01:17:47PM +0000, Fabrizio Castro wrote:
> Hello Geert,
> 
> Thank you for your patch!
> 
> > From: Geert Uytterhoeven <geert+renesas@glider.be>
> > Sent: 21 February 2019 13:00
> > Subject: [PATCH] arm64: dts: renesas: r8a77990: Fix SCIF5 DMA channels
> > 
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > According to the R-Car Gen3 Hardware Manual Errata for Rev 1.50 of Feb
> > 12, 2019, the DMA channels for SCIF5 are corrected from 16..47 to 0..15
> > on R-Car E3.
> > 
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Fixes: a5ebe5e49a862e21 ("arm64: dts: renesas: r8a77990: Add SCIF-{0,1,3,4,5} device nodes")
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks, applied as a fix for v5.1.

I did not queue this up as a fix for v5.0, although the problem appears to
exist since v5.0-rc1, as it is now very late in the development
cycle for v5.0 and this problem does not seem sufficiently severe
to warrant that kind of escalation.
