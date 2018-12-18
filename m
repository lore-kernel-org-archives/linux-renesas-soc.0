Return-Path: <SRS0=VX+A=O3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-1.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 73205C43387
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 09:07:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 4D9B220874
	for <linux-renesas-soc@archiver.kernel.org>; Tue, 18 Dec 2018 09:07:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726364AbeLRJH1 convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 18 Dec 2018 04:07:27 -0500
Received: from mail-vs1-f66.google.com ([209.85.217.66]:37782 "EHLO
        mail-vs1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726346AbeLRJH1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 18 Dec 2018 04:07:27 -0500
Received: by mail-vs1-f66.google.com with SMTP id n13so1612363vsk.4
        for <linux-renesas-soc@vger.kernel.org>; Tue, 18 Dec 2018 01:07:26 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=tslJkLsx6BEwlghitjp4tLKfBFfD6XTT9dAUXKoJQQw=;
        b=hyuZMREdzhGnH9QbIfOHiSpkC6JOf+/XGelM8UCAhSLItrIKRrlILC9QxFsvzi1Tto
         WwYwiFyvfxEsPnFiGkiEMrccd9gQyulFNjdqT/byHHCyC/DaP07GsYbK12dpulpqtgyE
         9W3SzlKw9iTbwqZoQNYLcf6UJQbZHbT5UXQ+JCHJxv88WI3UNtVbC7FjVbE4fljf6wmE
         wkR47ohDbMdy3DoJTQ7B+hgi2pd4wMhnSjA8hFet4Jk1gKPGCf6POuGap53EjCTpe7Js
         jYxsEZoScEa1jN5Ti3VI7/Erkdfw4MzhDmo7QH2hCOjvrSbYZmKIn7qfTu8+ZaSD2Rli
         XRzA==
X-Gm-Message-State: AA+aEWY/XSwphBQnsW/Vtd3Zd0FbNhj+obqETi9aWTjGa1riBBWycVsf
        kQLCHc1pZX0m/dxM7jxPhCf8gSWKF9Do66s2syhKYw8i
X-Google-Smtp-Source: AFSGD/XerJZoo3VG9wM7pUNSwN7/JpkwIEfogtZZVovXz0JjStRipMvQQuUSRZkbse/8gYy9HgRtD+CmmLS0Wd1coBo=
X-Received: by 2002:a67:d119:: with SMTP id u25mr7466066vsi.63.1545124046006;
 Tue, 18 Dec 2018 01:07:26 -0800 (PST)
MIME-Version: 1.0
References: <20181031233125.2800-1-niklas.soderlund@ragnatech.se>
 <20181101194528.GS2433@kunai> <20181102115718.7alk6psbkg4sdqtj@verge.net.au>
 <20181205204628.wvc2d4zfynbrztgq@ninjato> <20181205213613.GA20406@bigcity.dyn.berto.se>
 <20181207205204.GF17972@bigcity.dyn.berto.se>
In-Reply-To: <20181207205204.GF17972@bigcity.dyn.berto.se>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Tue, 18 Dec 2018 10:07:13 +0100
Message-ID: <CAMuHMdWH3G-80Ay=xi+HhRFMTQ=f6idDLFXt94sj5GmppC55Uw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: enable HS400 on R-Car Gen3
To:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc:     Wolfram Sang <wsa@the-dreams.de>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Niklas, Simon,

On Fri, Dec 7, 2018 at 9:52 PM Niklas Söderlund
<niklas.soderlund@ragnatech.se> wrote:
> On 2018-12-05 22:36:13 +0100, Niklas Söderlund wrote:
> > On 2018-12-05 21:46:28 +0100, Wolfram Sang wrote:
> > > On Fri, Nov 02, 2018 at 12:57:19PM +0100, Simon Horman wrote:
> > > > On Thu, Nov 01, 2018 at 08:45:29PM +0100, Wolfram Sang wrote:
> > > > >
> > > > > > This patch have quiet a few dependencies I'm afraid, let me know if you
> > > > > > wish to be notified once they all upstream. I don't think it's a good
> > > > > > idea to pick this up before all dependencies are resolved.
> > > > >
> > > > > Yes, we should do that. Ping Simon once all dependencies are in next. It
> > > > > is still fine to have this patch here in case people want to test. BTW
> > > > > did you mention your branch somewhere where you collected all these
> > > > > patches to make HS400 working/enabled?
> > > > >
> > > > > For this patch already:
> > > > >
> > > > > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > > > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > > >
> > > > Thanks, I am marking this as deferred.
> > > >
> > > > Please repost or ping me once the dependencies are present in
> > > > an rc release.
> > >
> > > Niklas, are we done now, so we can ask Simon to pick up the DTS change?
> > >
> >
> > Almost :-)
> >
> > I'm  waiting for Geert to take the SD quirk patches before pinging Simon
> > to take this one. Spoke to him today about that so I hope it will not be
> > to long.
> >
>
> I just confirmation that the clock patches have been pulled into
> clk-next so this patch is ready to be consumed by you Simon.
>
> Would it be possible to get this in this cycle or is it to late? I know
> you wished to close your tree for v4.21 at the end of this week which it
> technically is now ;-)

This patch seems to depend on both the clock patches, and mmc/next.
Else the kernel hangs with an rcu check :-(

Hence please drop, and requeue in renesas-devel after the release of v4.21-rc1.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
