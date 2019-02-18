Return-Path: <SRS0=S9WZ=QZ=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29432C43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 09:01:57 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 009C62175B
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 18 Feb 2019 09:01:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727570AbfBRJB4 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 18 Feb 2019 04:01:56 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:40645 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727423AbfBRJB4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 18 Feb 2019 04:01:56 -0500
Received: by mail-vs1-f66.google.com with SMTP id z18so9201833vso.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 18 Feb 2019 01:01:55 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=QQdaZAHhLdCdq4IjiHayTI4rQ43YV1OpB0oRJ0lquFU=;
        b=lparqqLQiNBuLrcOYIcrZb9WgKtqahINfzqsVAyj7x7GJPeOsENn+WtUXUeljTo1NH
         zq8eijwhHpe/4ehWBQyRVKX/vacP+MB+dNdyMqERbCwVlXWQNmyriHdVftMtANzqafol
         sfVL4KEohiWRWuJwjqRSIejpYa7dOsdAbSSUifCZV0W+KZjdWHYHP047gsPDpjNZMUHi
         UM/IP51dI7Oj5FaheYXOwgoIeUVqtisCmSMlxvRVauiMubzNAEu8c/YrvsHGuo8/gaqP
         i3auLGkz4r+WT6X+OCnP2vOZ7hRZvOkLzFLOOn84X0kPJP5TaD+lMASVyoWFU25/87kf
         FUjA==
X-Gm-Message-State: AHQUAuYai/d/4PgJAzhSG/k+n5kO5ejJGUtCAhLn/aJrZRiuIrw79x7u
        71uEoRq5ct5sI9/YKgpeejOlxhjGOEqFKOQ6WHE=
X-Google-Smtp-Source: AHgI3IYNzzn8zknYAi5KdVLVQ2JaDVRbdgy7OyPn4P5BWkVF74B/kCbpjOuIJlaZgAv9iDJmFLFSuZD/DP1kq8B3Yzo=
X-Received: by 2002:a67:fc9a:: with SMTP id x26mr4085351vsp.166.1550480515159;
 Mon, 18 Feb 2019 01:01:55 -0800 (PST)
MIME-Version: 1.0
References: <20190216235854.15244-1-niklas.soderlund+renesas@ragnatech.se>
 <20190216235854.15244-2-niklas.soderlund+renesas@ragnatech.se> <959b482d-09a1-2ffc-1144-101348bb27d9@ideasonboard.com>
In-Reply-To: <959b482d-09a1-2ffc-1144-101348bb27d9@ideasonboard.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 18 Feb 2019 10:01:43 +0100
Message-ID: <CAMuHMdXgPYkCi+pK9FsfsCuWtAL1Ly7d=Ty88+qGH7m7L67aOA@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a77990-ebisu: Fix adv7482 hexadecimal
 register address
To:     Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= 
        <niklas.soderlund+renesas@ragnatech.se>,
        Simon Horman <horms@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Kieran,

On Sun, Feb 17, 2019 at 11:13 PM Kieran Bingham
<kieran.bingham@ideasonboard.com> wrote:
> On 16/02/2019 23:58, Niklas Söderlund wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > The register address used for the reg property of the adv7482 node in
> > other Renesas device trees are decimal not hex, change this for Ebisu to
> > align it with the others.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [Niklas: rewrite commit message]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts | 2 +-
> >  1 file changed, 1 insertion(+), 1 deletion(-)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > index 62bdddcbbae7d9e9..23914c2b83965621 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > +++ b/arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts
> > @@ -383,7 +383,7 @@
> >               };
> >
> >               port@a {
> > -                     reg = <0xa>;
> > +                     reg = <10>;
>
> From the discussions on this before, we converted the port number to be hex.
>
> I really dislike that we have port@a, but reg=<10>;
>
> However as long as the value is written by the DTC as 'ten' and
> correctly interpreted as decimal this is still correct.
>
> I guess it doesn't hurt to have a decimal representation as that will
> then match the bindings port descriptions. It's a shame this can't be
> the 'port@10' for comprehension though.
>
> My only hesitation on providing either an RB/or AB tag here is whether
> perhaps we should instead convert the salvator-common to use hex so that
> they match that way instead?

(More rationale, which may be considered bikeshedding ;-)

I believe we tend to use decimal for small numbers, and hex for large numbers.
Exceptions are values where the meaning of the individual bits is important,
and hex is thus more suitable (e.g. rohm,ddr-backup-power = <0xf>).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
