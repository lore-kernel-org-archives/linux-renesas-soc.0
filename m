Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-10.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D0EDC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:53:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id DD894206A2
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 14:53:55 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="bZqp5nv6"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1732267AbeLQOxz (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 09:53:55 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:42325 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1732252AbeLQOxz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 09:53:55 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 3E4F425B781;
        Tue, 18 Dec 2018 01:53:53 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1545058433; bh=MMtSLILbamHCzSvh0JcFNWqbPnWcIrsgTH7ITHRdDzY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=bZqp5nv6kF61JkMLqQqdycsqwILJJcEI1sHRH+3a0pfqQl5/a7WjxmcE3/NUa6ZK8
         b112nAS1wLyyP10PwtUyr7iHh0NIuCJE6r2j/oYeypNGvP5WNUa1mN6fcuXbsiAB/K
         HWF+6fekEQRQsqPHn71E6l824NLf4+Es3LH9fwAA=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 6062E94048A; Mon, 17 Dec 2018 15:53:51 +0100 (CET)
Date:   Mon, 17 Dec 2018 15:53:51 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Biju Das <biju.das@bp.renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Subject: Re: [PATCH] ARM: shmobile: Add missing dts files to MAINTAINERS
Message-ID: <20181217145350.a6fp2quy2gylbflf@verge.net.au>
References: <20181212105435.28310-1-horms+renesas@verge.net.au>
 <CAMuHMdVoJSxOJ4X1_nF8qG-g9EgCYLKUhuqHyJ65J3rjhiqq7w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVoJSxOJ4X1_nF8qG-g9EgCYLKUhuqHyJ65J3rjhiqq7w@mail.gmail.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Dec 17, 2018 at 03:23:27PM +0100, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Dec 12, 2018 at 11:55 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Add some more patterns to the ARM/SHMOBILE ARM ARCHITECTURE
> > section of MAINTAINERS to complete the list of maintained dts files.
> >
> > As of writing dts files covered are:
> > * arch/arm/boot/dts/gr-peach-audiocamerashield.dtsi
> > * arch/arm/boot/dts/iwg20d-q7-common.dtsi
> > * arch/arm/boot/dts/iwg20d-q7-dbcm-ca.dtsi
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> 
> > --- a/MAINTAINERS
> > +++ b/MAINTAINERS
> > @@ -2075,6 +2075,8 @@ Q:        http://patchwork.kernel.org/project/linux-renesas-soc/list/
> >  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas.git next
> >  S:     Supported
> >  F:     arch/arm/boot/dts/emev2*
> > +F:     arch/arm/boot/dts/gr-peach*
> > +F:     arch/arm/boot/dts/iwg20d-q7*
> 
> I had hoped to make this more future-proof by shortening the string, but
> apparently there are non-Renesas iwg2* boards.

Thanks, applied for v4.22.
