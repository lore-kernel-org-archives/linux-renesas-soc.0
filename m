Return-Path: <SRS0=rp0x=R6=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2A9B3C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 12:02:45 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id EAD992087C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 27 Mar 2019 12:02:44 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Ug4kiel5"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727488AbfC0MCo (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 27 Mar 2019 08:02:44 -0400
Received: from kirsty.vergenet.net ([202.4.237.240]:56208 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726296AbfC0MCo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 27 Mar 2019 08:02:44 -0400
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B246625B7E0;
        Wed, 27 Mar 2019 23:02:42 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1553688163; bh=vqu4vwJ2giiSYHBQ79FMxgWmNlhb5Mh0DrXhS7QI614=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Ug4kiel59KZ+HjLqQaKzRCM39EHaOP8V/JvqMuTuiTbXLktrO4xYwdTS+j7Qanwno
         2dV86ef4/WhtRsxCA0WbF43zgLCaxspyKY7SaxvLeU7dKI1aU6VGv4+HsaKwAgwRGI
         rj2wD9SQc1Cg4ADYjeyfszzTPuFTi6WeT0gdlgxU=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id F0A19940376; Wed, 27 Mar 2019 13:02:40 +0100 (CET)
Date:   Wed, 27 Mar 2019 13:02:40 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Add GPIO keys
 support
Message-ID: <20190327120239.kjmhbw62vm6hxxve@verge.net.au>
References: <20180819194455.25096-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdW4ium4s97+1iOHkhBGw3LdfPyfxXq4_7ic+VtXzRpE2g@mail.gmail.com>
 <20180906094231.eccvg2asl7kgotu2@verge.net.au>
 <2032675.nQfVxexfDx@avalon>
 <20180912102534.vrocfv2mdrjuk2ev@verge.net.au>
 <CAMuHMdU0NqdN7efjDMcabXuWAFJy3eQSFHWxcjYaRMjz=+vKJQ@mail.gmail.com>
 <20180917071041.jobxfznnla3mnuga@verge.net.au>
 <20190325023029.GB12029@pendragon.ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190325023029.GB12029@pendragon.ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Mar 25, 2019 at 04:30:29AM +0200, Laurent Pinchart wrote:
> Hi Simon,
> 
> On Mon, Sep 17, 2018 at 09:10:42AM +0200, Simon Horman wrote:
> > On Wed, Sep 12, 2018 at 01:59:53PM +0200, Geert Uytterhoeven wrote:
> > > On Wed, Sep 12, 2018 at 12:25 PM Simon Horman <horms@verge.net.au> wrote:
> > >> On Thu, Sep 06, 2018 at 12:59:20PM +0300, Laurent Pinchart wrote:
> > >>> On Thursday, 6 September 2018 12:42:32 EEST Simon Horman wrote:
> > >>>> On Thu, Aug 23, 2018 at 11:58:54AM +0200, Geert Uytterhoeven wrote:
> > >>>>> On Sun, Aug 19, 2018 at 9:44 PM Laurent Pinchart wrote:
> > >>>>>> The Salvator-X and XS boards have a 4 lines DIP switch and 3 push
> > >>>>>> buttons connected to SoC GPIOs, meant to be used as general-purpose test
> > >>>>>> keys. Add a corresponding node in DT, mapping (semi-randomly) the DIP
> > >>>>>> switch to keys 1-4 and the push buttons to keys A-C.
> > >>>>>>
> > >>>>>> Signed-off-by: Laurent Pinchart
> > >>>>>> <laurent.pinchart+renesas@ideasonboard.com>
> > >>>>>
> > >>>>> Given GP6_1[123] are not just wired to the 3 push buttons, but also to 3
> > >>>>> LEDs, I wonder if we shouldn't postpone that part until Linux can handle
> > >>>>> GPIOs connected to both?
> > >>>>
> > >>>> Laurent, any thoughts on that?
> > >>>
> > >>> Right now the GPIOs are not wired in DT, and we're thus without a way to
> > >>> interface to both LEDs and push buttons. While I agree that an ideal
> > >>> solution would be to support both, I think that moving from nothing to
> > >>> support for push buttons would be a step forward already.
> > >>
> > >> I tend to agree. Geert, what are your thoughts?
> > > 
> > > Fine for me.
> > > 
> > > Just one more bikeshedding question: what's most useful, buttons or LEDs? ;-)
> > 
> > Lets go with the buttons.
> > 
> > Applied for v4.20.
> 
> Shouldn't it have made it to Linus' tree then ? :-)

Sorry about that, it seems that I didn't apply it after all.
I have done so now.
