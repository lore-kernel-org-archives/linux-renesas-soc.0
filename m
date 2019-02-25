Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24278C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 10:06:01 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DDA7A20842
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 10:06:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="jzYiUY27"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726587AbfBYKGA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 05:06:00 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41119 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfBYKGA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 05:06:00 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 600B725B784;
        Mon, 25 Feb 2019 21:05:58 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551089158; bh=dIlLXuVkPuy3+3Pwz5AcdmHZ7XLJ9paJQzKCp+di1MU=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=jzYiUY27MWrpFJ4cJMMPxi52Xf9wx0Sxs9M5iGhe940WwnqovNyfgI0Uebfk5gsma
         Ozzkchs/PzpGWIbpyH/jUGCzq3EQVkmDWGVb+mPSrZYBqwC1watzKITrXR4HlIQ8Ld
         Ww+jWvMya0Z8kmutaThYQ6Rq+T2bGAFAkC2YTMcI=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 8530B94056F; Mon, 25 Feb 2019 11:05:56 +0100 (CET)
Date:   Mon, 25 Feb 2019 11:05:56 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Arnd Bergmann <arnd@arndb.de>
Cc:     arm-soc <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        stable <stable@vger.kernel.org>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Updates for v5.1
Message-ID: <20190225100556.zlnn3rzgoq5n5a27@verge.net.au>
References: <cover.1549622472.git.horms+renesas@verge.net.au>
 <CAK8P3a0prd-4eyVOVUpp2Bhn1mGOVZwA_we79TNjSa4FF5DP6A@mail.gmail.com>
 <20190218112715.zufzr3knrhs37t6h@verge.net.au>
 <CAK8P3a1BrahyfrRD=1dSLNzc1mujh+rxdLoU8CtGruRSbo3JVg@mail.gmail.com>
 <20190218141417.7n6q5petp5oepd55@verge.net.au>
 <CAK8P3a3ULz5BG=hUmhX0a+AX4yYs9gB9G8QEjYjV9pDO=5BBuw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAK8P3a3ULz5BG=hUmhX0a+AX4yYs9gB9G8QEjYjV9pDO=5BBuw@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 18, 2019 at 03:21:14PM +0100, Arnd Bergmann wrote:
> On Mon, Feb 18, 2019 at 3:15 PM Simon Horman <horms@verge.net.au> wrote:
> >
> > On Mon, Feb 18, 2019 at 02:12:07PM +0100, Arnd Bergmann wrote:
> > > On Mon, Feb 18, 2019 at 12:27 PM Simon Horman <horms@verge.net.au> wrote:
> > > > On Fri, Feb 15, 2019 at 05:49:32PM +0100, Arnd Bergmann wrote:
> > > > > On Fri, Feb 8, 2019 at 12:14 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > > > > > Renesas ARM Based SoC Updates for v5.1
> > > > > >
> > > > > > * Correct shared IRQ handling of R-Car Gen2 Regulator quirk
> > > > > > * Add missing dts files to MAINTAINERS
> > > > >
> > > > > Should the bugfix be marked Cc:stable and and Fixes:... ?
> > > > >
> > > > Sorry for missing that, I think that the bugfix should have had the following.
> > > > Let me know if/how you want to handle updating the patch's changelog.
> > > >
> > > > Fixes: 6d14d4d313d09dab ("ARM: shmobile: Rework the PMIC IRQ line quirk")
> > >
> > > I think the easiest way is to send an email to stable@kernel.org asking for
> > > a backport of commit 5347a0203709 ("ARM: shmobile: Fix R-Car Gen2 regulator
> > > quirk") after that has hit the mainline kernel and asking for a backport.
> > >
> > > I've added it to Cc here, but I don't know if that's sufficient.
> > >
> > > If you'd rather have me pick up the patch for 5.0 as well, I can also do
> > > that and add the Cc/Fixes lines there. We will then have a duplicate
> > > commit in 5.1, but it should not cause any merge issues.
> >
> > Thanks Arnd,
> >
> > I'm happy to handle this via stable and avoid the duplicate.
> > If I don't hear back from them in a few days I'll make a formal
> > submission there.
> 
> Ok, sounds good.
> 
> To clarify: I think you should only write them /after/ the commit
> is in mainline then, i.e. near the end of the 5.1 merge window.

Thanks Arnd, got it.
