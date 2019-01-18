Return-Path: <SRS0=9p1a=P2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E2611C43387
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:18:58 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id AAC1520883
	for <linux-renesas-soc@archiver.kernel.org>; Fri, 18 Jan 2019 12:18:58 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Y1rvmK/v"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727212AbfARMS6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 18 Jan 2019 07:18:58 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:57922 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727190AbfARMS6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 18 Jan 2019 07:18:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 6B7BE25B77D;
        Fri, 18 Jan 2019 23:18:55 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1547813935; bh=y1M19CMJe+Mg4qW2/9i5dXR1rvjfhn5kbq8cFW0nDO0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Y1rvmK/v7fp593FpfuPZGF/6hEzGV6I9GyGaMNb7TX7BIRuNVP31HhEAaGCkUEHsX
         Y9AsYqhm5Xzdg5WH2fXvXuji1JVrZTZAiBLKnlDIMGsb8r7IFZbY8igrzmna+XflvC
         acfNiS+NmuSyUavkiSaeXYhA1mkr8OrDUxP0cvCo=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id D37C1940356; Fri, 18 Jan 2019 13:18:53 +0100 (CET)
Date:   Fri, 18 Jan 2019 13:18:53 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Ulrich Hecht <uli+renesas@fpond.eu>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:SERIAL DRIVERS" <linux-serial@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7779: Add HSCIF0/1 device nodes
Message-ID: <20190118121853.fv6ozq52rfahuxfm@verge.net.au>
References: <1547808495-19509-1-git-send-email-uli+renesas@fpond.eu>
 <1547808495-19509-3-git-send-email-uli+renesas@fpond.eu>
 <CAMuHMdUw0HHFhqYikL_YBHWhbC-FUOfA-EGFvY29b5SPOLLWwg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUw0HHFhqYikL_YBHWhbC-FUOfA-EGFvY29b5SPOLLWwg@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Fri, Jan 18, 2019 at 12:58:55PM +0100, Geert Uytterhoeven wrote:
> Hi Uli,
> 
> On Fri, Jan 18, 2019 at 11:48 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> > Based on Rev. 1.00 of the R-Car H1 datasheet.
> >
> > Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>
> 
> Thanks for the update!
> 
> > --- a/arch/arm/boot/dts/r8a7779.dtsi
> > +++ b/arch/arm/boot/dts/r8a7779.dtsi
> 
> > +       hscif1: serial@ffe49000 {
> > +               compatible = "renesas,hscif-r8a7779",
> > +                            "renesas,rcar-gen1-hscif", "renesas,hscif";
> > +               reg = <0xffe49000 96>;
> > +               interrupts = <GIC_SPI 95 IRQ_TYPE_LEVEL_HIGH>;
> > +               clocks = <&mstp0_clks R8A7779_CLK_HSCIF1,
> 
> Missing closing ">".
> 
> With the above fixed:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied with that fixed.

Ulrich, do we need a patch to add the renesas,hscif-r8a7779 binding?
