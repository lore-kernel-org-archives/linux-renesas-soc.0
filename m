Return-Path: <SRS0=JlVY=P4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,USER_AGENT_NEOMUTT
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 94AEDC61CE4
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 20 Jan 2019 08:30:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5CEAB2084C
	for <linux-renesas-soc@archiver.kernel.org>; Sun, 20 Jan 2019 08:30:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="TnNUVr6m"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729513AbfATIa5 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sun, 20 Jan 2019 03:30:57 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:53675 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727294AbfATIa5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 Jan 2019 03:30:57 -0500
Received: from penelope.horms.nl (ip4dab7138.direct-adsl.nl [77.171.113.56])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 842FD25B7C3;
        Sun, 20 Jan 2019 19:30:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547973055; bh=GRxwK98/cBK/yjS5msvBXwC/+7la10SHvuNvicy1lZM=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=TnNUVr6mvboMU9flzFwOPv9ZHkvdb9VLWJmy3R/7tE4NH/V5LsTDwQT52woJhTn93
         YrUhbMo/5O5KM+o6zys0WzQMSntJF0n/Alu3VLJ5kO0ymCsA2PB74DY/Cmj0VoGwUQ
         8jX6rMRjGKizZyCtKQNJ2ZX04V54fQx13rLJEoS8=
Received: by penelope.horms.nl (Postfix, from userid 7100)
        id 8C588E21E4A; Sun, 20 Jan 2019 09:30:53 +0100 (CET)
Date:   Sun, 20 Jan 2019 09:30:53 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7779: Add HSCIF0/1 device nodes
Message-ID: <20190120083053.vgsvhmpa52zsmdv3@verge.net.au>
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
 <1547808495-19509-3-git-send-email-uli+renesas@fpond.eu>
 <CAMuHMdUw0HHFhqYikL_YBHWhbC-FUOfA-EGFvY29b5SPOLLWwg@mail.gmail.com>
 <20190118121853.fv6ozq52rfahuxfm@verge.net.au>
 <CAMuHMdX016xkHqseCk9rNJCONLSufKKMvMnfFmmjkiheo0VzRA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdX016xkHqseCk9rNJCONLSufKKMvMnfFmmjkiheo0VzRA@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 01:48:41PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Fri, Jan 18, 2019 at 1:18 PM Simon Horman <horms@verge.net.au> wrote:
> > On Fri, Jan 18, 2019 at 12:58:55PM +0100, Geert Uytterhoeven wrote:
> > > On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > > > --- a/arch/arm/boot/dts/r8a7779.dtsi
> > > > +++ b/arch/arm/boot/dts/r8a7779.dtsi
> > >
> > > > +       hscif1: serial@ffe49000 {
> > > > +               compatible = "renesas,hscif-r8a7779",
> > > > +                            "renesas,rcar-gen1-hscif", "renesas,hscif";
> > > > +               reg = <0xffe49000 96>;
> > > > +               interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > > > +               clocks = <&mstp0_clks R8A7779_CLK_HSCIF1,
> > >
> > > Missing closing ">".
> > >
> > > With the above fixed:
> > > Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >
> > Thanks, applied with that fixed.
> 
> Thanks!
> 
> > Ulrich, do we need a patch to add the renesas,hscif-r8a7779 binding?
> 
> I believe you were CCed by Greg's bot for
> 
>     patch "dt-bindings: serial: sh-sci: Document r8a7778/9 HSCIF
> bindings" added to tty-testing

Thanks, indeed I was.
