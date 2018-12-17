Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 847A3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:50:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4A460206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:50:49 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="fr2xZp17"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1733128AbeLQOut (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:50:49 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:42235 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1731823AbeLQOut (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:50:49 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id D303B25B80B;
        Tue, 18 Dec 2018 01:50:46 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545058247; bh=xiAXYlMxxgHE10ffhNuZmrNhEtQJHRfR7YJaxCK60+E=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=fr2xZp178I2EvrHtcnyF60T/3BaQ3IUV12ZRBmngTxC78tBl++kUkADwAIcMkEZg7
         u3ngWqV4T8yhR4VtlSIqbJM4t9wMYQilhqdR/Z+tunt71M98ypI3YlKJwHAUEc/0Ny
         76j3mbYpwjJt1/aetQVq1oWcJYyWs3i3r50ZZQWg=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 0256B94048A; Mon, 17 Dec 2018 15:50:44 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:50:44 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Geert Uytterhoeven <geert+renesas@glider.be>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jslaby@suse.com>,
        Ulrich Hecht <uli+renesas@fpond.eu>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>
Subject: Re: [PATCH v4 2/4] serial: sh-sci: Fix crash in rx_timer_fn() on PIO
 fallback
Message-ID: <20181217145043.ygw2lwtw2v5i4lpm@verge.net.au>
References: <20181213184444.21904-1-geert+renesas@glider.be>
 <20181213184444.21904-3-geert+renesas@glider.be>
 <20181217132241.4lbaeshn2rnlhjqe@verge.net.au>
 <CAMuHMdUHUUEd0KQ3NP4M_hiYuwcyYRMiET3BamC4Qmrc3oEBBA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUHUUEd0KQ3NP4M_hiYuwcyYRMiET3BamC4Qmrc3oEBBA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 02:27:47PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Mon, Dec 17, 2018 at 2:22 PM Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Dec 13, 2018 at 07:44:42PM +0100, Geert Uytterhoeven wrote:
> > > When falling back to PIO, active_rx must be set to a different value
> > > than cookie_rx[i], else sci_dma_rx_find_active() will incorrectly find a
> > > match, leading to a NULL pointer dereference in rx_timer_fn() later.
> > >
> > > Use zero instead, which is the same value as after driver
> > > initialization.
> > >
> > > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > This looks good so to me long as dmaengine_submit() doesn't return 0.
> > Is that the case?
> 
> include/linux/dmaengine.h:
> 
> /**
>  * typedef dma_cookie_t - an opaque DMA cookie
>  *
>  * if dma_cookie_t is >0 it's a DMA request cookie, <0 it's an error code
>  */
> typedef s32 dma_cookie_t;
> #define DMA_MIN_COOKIE  1

In that case I have no objections.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

