Return-Path: <SRS0=xaBA=S2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A2BAAC10F11
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 07:18:03 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7898420835
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 24 Apr 2019 07:18:03 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729381AbfDXHSD convert rfc822-to-8bit (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 24 Apr 2019 03:18:03 -0400
Received: from mail-vs1-f67.google.com ([209.85.217.67]:41407 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729333AbfDXHSC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 24 Apr 2019 03:18:02 -0400
Received: by mail-vs1-f67.google.com with SMTP id g187so9800499vsc.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 24 Apr 2019 00:18:02 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc:content-transfer-encoding;
        bh=/6WcytNNRQWPzYcIXmCn4PylWIvUSfaQnSpeJNUj5dA=;
        b=ew/US8mv/uTtdqjjA7M0SOkn6e5CMPWPTctepyOM3R8xjnxzIYcdeJ/AdYAPtC9vbi
         6BQUnN7AtkM33+M1fsg1FRhJuHYfNNjrzRRRA00RfG3inyNlvPnh4O3PWq+sI4J8cxk6
         5JyX0pbSCHuJ4fROCNZv+q8e9Z1a+Qv1GrG64lNskyHkbaA/6OzItBHHyuVX1CF3rXjw
         AaQgGnPxNXBWsoSudV48E6LzXwgdU8zyFsgNOs3NXhBaZotadxAYY4P9zI8MNkJaigyS
         j7E+CX/po+nrOArUUXTJWocjDGPKPbAwQkGucwZ/IjS0/vDKaXZp89tecKiSPHeLm1Fq
         tBhg==
X-Gm-Message-State: APjAAAVRfaGZViBvI+ksqIFkd/IudRQE/Rzy18KPpgd/1kzW/EMyClrZ
        ldEMfVKI1JwJDXzju9SB67D4hqa+eKgbJzK26DE=
X-Google-Smtp-Source: APXvYqwouLUTUl0b0NvUkH4J5nYFWOND5YIKrzjOjWGqn8yW9ZlosaiWVLeWzxZ5tgPLJXUd3qn3T6G0aR3ltbZwafM=
X-Received: by 2002:a67:8317:: with SMTP id f23mr15339282vsd.63.1556090281777;
 Wed, 24 Apr 2019 00:18:01 -0700 (PDT)
MIME-Version: 1.0
References: <1545338982-19466-1-git-send-email-ykaneko0929@gmail.com>
 <20190110163356.GF24252@bigcity.dyn.berto.se> <20190408122941.wziujh5ibgwy5cdp@verge.net.au>
In-Reply-To: <20190408122941.wziujh5ibgwy5cdp@verge.net.au>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Wed, 24 Apr 2019 09:17:50 +0200
Message-ID: <CAMuHMdUBmeuuZXjvvKyQj1X89B873QiyYYmqBoQQEdcUc1Sgkw@mail.gmail.com>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a7795: Create thermal zone to
 support IPA
To:     Simon Horman <horms@verge.net.au>
Cc:     =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Hi Simon,

On Mon, Apr 8, 2019 at 2:29 PM Simon Horman <horms@verge.net.au> wrote:
> On Thu, Jan 10, 2019 at 05:33:57PM +0100, Niklas Söderlund wrote:
> > On 2018-12-21 05:49:39 +0900, Yoshihiro Kaneko wrote:
> > > From: Dien Pham <dien.pham.ry@renesas.com>
> > >
> > > [dien.pham.ry: arm64: dts: r8a7795: Add support IPA for CA53 core]
> > >
> > > Setup a thermal zone driven by SoC temperature sensor.
> > > Create passive trip points and bind them to CPUFreq cooling
> > > device that supports power extension.
> > >
> > > In R-Car Gen3, IPA is supportted for only one channel
> > >  (on H3/M3/M3N board, it is channel THS3). Reason:
> > >   Currently, IPA controls base on only CPU temperature.
> > >   And only one thermal channel is assembled closest
> > >   CPU cores is selected as target of IPA.
> > >   If other channels are used, IPA controlling is not properly.
> > >
> > > Signed-off-by: Keita Kobayashi <keita.kobayashi.ym@renesas.com>
> > > [gaku.inami.xw: fix the trip temperature for cooling-device]
> > > [gaku.inami.xw: fix the power coefficient]
> > > Signed-off-by: Gaku Inami <gaku.inami.xw@bp.renesas.com>
> > > Signed-off-by: Hien Dang <hien.dang.eb@rvc.renesas.com>
> > > Signed-off-by: An Huynh <an.huynh.uj@rvc.renesas.com>
> > > [takeshi.kihara.df: fix W=1 dtc unit_address_vs_reg warnings]
> > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > > ---
> > >
> > > This patch is based on the devel branch of Simon Horman's renesas tree.
> > >
> > >  arch/arm64/boot/dts/renesas/r8a7795.dtsi | 64 ++++++++++++++------------------
> > >  1 file changed, 27 insertions(+), 37 deletions(-)
> > >
> > > diff --git a/arch/arm64/boot/dts/renesas/r8a7795.dtsi b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > index af9605d..dd52b50 100644
> > > --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> > > @@ -155,6 +155,9 @@
> > >                     power-domains = <&sysc R8A7795_PD_CA57_CPU0>;
> > >                     next-level-cache = <&L2_CA57>;
> > >                     enable-method = "psci";
> > > +                   dynamic-power-coefficient = <854>;
> > > +                   cooling-min-level = <0>;
> > > +                   cooling-max-level = <2>;
> >
> > I can't find any documentation or code which makes use of the
> > cooling-min-level and cooling-max-level properties on v5.0-rc1. What is
> > the intended usage for these properties?
>
> It looks like these properties were removed in v4.17-rc1 by
> bbcf071969b2 ("cpufreq: cpu0: rename driver and internals to 'cpufreq_dt'")
> and should be dropped from this and similar patches.

See commit e04907dbc25930b8 ("dt-bindings: thermal: Remove
"cooling-{min|max}-level" properties").

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
