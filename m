Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47650C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 10:09:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 10A0420842
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 10:09:59 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="Hb7OeCAA"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726601AbfBYKJ6 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 05:09:58 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:41169 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726574AbfBYKJ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 05:09:58 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id B8D4125B791;
        Mon, 25 Feb 2019 21:09:56 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1551089397; bh=jRxUacnem6sn+78xxyL94jSTXjOxT7IY8hhcrLCGYKs=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Hb7OeCAA+XQQhB08WlfWNMA6tbZcK824Gy52+iEh+diu/jn9oKiZmMjHKGqP+fNMe
         M0WOZqYmlfRmoXyScSSPMGf5RHqBbQyiAVf1GjXiGTN2V9jpUSqmFVJbzuLaujrxIf
         9Xga+sAMMeqwyT8TWm2Yn8Gbz2GhMknCRExcxkLw=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id E9CF094056F; Mon, 25 Feb 2019 11:09:54 +0100 (CET)
Date:   Mon, 25 Feb 2019 11:09:54 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     Geert Uytterhoeven <geert@linux-m68k.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77990-ebisu: Fix adv7482 hexadecimal
 register address
Message-ID: <20190225100954.jvwbty52lgpcovrx@verge.net.au>
References: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
 <20190216235854.15244-2-niklas.soderlund+renesas@ragnatech.se>
 <959b482d-09a1-2ffc-1144-101348bb27d9@ideasonboard.com>
 <CAMuHMdXgPYkCi+pK9FsfsCuWtAL1Ly7d=Ty88+qGH7m7L67aOA@mail.gmail.com>
 <59664792-ce36-d068-077f-e6cd12dc549b@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <59664792-ce36-d068-077f-e6cd12dc549b@ideasonboard.com>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Feb 18, 2019 at 11:34:13AM +0000, Kieran Bingham wrote:
> Hi Geert,
> 
> On 18/02/2019 09:01, Geert Uytterhoeven wrote:
> > Hi Kieran,
> > 
> > On Sun, Feb 17, 2019 at 11:13 PM Kieran Bingham
> > <kieran.bingham@ideasonboard.com> wrote:
> >> On 16/02/2019 23:58, Niklas Söderlund wrote:
> >>> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >>>
> >>> The register address used for the reg property of the adv7482 node in
> >>> other Renesas device trees are decimal not hex, change this for Ebisu to
> >>> align it with the others.
> >>>
> >>> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >>> [Niklas: rewrite commit message]
> >>> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> >>> ---
> >>>  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
> >>>  1 file changed, 1 insertion(+), 1 deletion(-)
> >>>
> >>> diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> >>> index 62bdddcbbae7d9e9..23914c2b83965621 100644
> >>> --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> >>> +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> >>> @@ -383,7 +383,7 @@
> >>>               };
> >>>
> >>>               port@a {
> >>> -                     reg = <0xa>;
> >>> +                     reg = <10>;
> >>
> >> From the discussions on this before, we converted the port number to be hex.
> >>
> >> I really dislike that we have port@a, but reg=<10>;
> >>
> >> However as long as the value is written by the DTC as 'ten' and
> >> correctly interpreted as decimal this is still correct.
> >>
> >> I guess it doesn't hurt to have a decimal representation as that will
> >> then match the bindings port descriptions. It's a shame this can't be
> >> the 'port@10' for comprehension though.
> >>
> >> My only hesitation on providing either an RB/or AB tag here is whether
> >> perhaps we should instead convert the salvator-common to use hex so that
> >> they match that way instead?
> > 
> > (More rationale, which may be considered bikeshedding ;-)
> 
> All input here is helpful :)
> 
> 
> > I believe we tend to use decimal for small numbers, and hex for large numbers.
> > Exceptions are values where the meaning of the individual bits is important,
> > and hex is thus more suitable (e.g. rohm,ddr-backup-power = <0xf>).
> 
> 
> I believe without the 0x prefix in the reg <> the value is taken as
> decimal, so keeping decimal will still function correctly.
> 
> I think my issue only stems from the fact that the @N value is 'hex'
> without the prefix which causes the difference.
> 
> I'll stop fussing over this. The value is interpreted correctly, and as
> I said above - having a place where the port number is listed in decimal
> helps to match to the bindings table. It's just not in the place I'd
> like it to be - but I have no control over that.
> 
> So, lets get this patch in and at least unify the current users ...
> 
> Acked-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>

Thanks, applied with the subject prefix updated to

"arm64: dts: renesas: ebisu:"
