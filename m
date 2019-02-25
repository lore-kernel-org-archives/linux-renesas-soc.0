Return-Path: <SRS0=0nld=RA=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-7.0 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DDEBC43381
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:51:18 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 2626A2084D
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 25 Feb 2019 09:51:18 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726590AbfBYJvR (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 25 Feb 2019 04:51:17 -0500
Received: from mail-ua1-f68.google.com ([209.85.222.68]:39871 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726508AbfBYJvR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Feb 2019 04:51:17 -0500
Received: by mail-ua1-f68.google.com with SMTP id s15so7743645uap.6;
        Mon, 25 Feb 2019 01:51:16 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:mime-version:references:in-reply-to:from:date
         :message-id:subject:to:cc;
        bh=Eh2CDbnaj99sV25EnYVssSUfplApDG/vTmBWD+P3RLw=;
        b=HL6svmQ00fjFFXdv9ksuMepsaFdAAfvjjO7mYcmuHGFXz4e05BfejQr7w6777J4WwP
         E7yiVYw0+7yqzy2Lu+wgNbDXs0wlWCstOGdoERDE1eSkX74tY10srGhwvpxgyTviqD/2
         fAwCVBfbNSxzJIPa5JEtmuTcvlb/P5XrT9Dfx08bh9SaAkVEcDmYh/sOMMYgYgzBvOxE
         alUdaG5CxHAhXNOtqN/5T+0OZsJ7EJsZKjPeLgTs9LjYkHBx93VwkxV/mNEx91itQFO4
         KeZcvS9L4LxT4kRyYxaJHfpoNOvKkyZ8qntvoC+jpZ7jJpsXfb3QGc1QBfJX9Od6WZG1
         fRPw==
X-Gm-Message-State: AHQUAuarsFt0F5hhfuctghr7tjsyIYhcz1X8aJ2ejStyeU0YuJOPDDdq
        nhjX4RGf2UxUEU6MG7EEiuSz269ytQye/zr3qN0=
X-Google-Smtp-Source: AHgI3IYYo2d0Jl+T1lTPrIaRogYDlxuS85qYDSJnfWutRkcvcdf/5t9Ok2LtP5aNR70wDCRZltvocY9D/V7BFx++LRI=
X-Received: by 2002:a67:ead0:: with SMTP id s16mr8266077vso.63.1551088276192;
 Mon, 25 Feb 2019 01:51:16 -0800 (PST)
MIME-Version: 1.0
References: <20190225093604.25753-1-horms+renesas@verge.net.au> <CAMuHMdX-U_y7axw9AHYt7Omj5LzE69FTNy6PNUy4TBbxs3CtRA@mail.gmail.com>
In-Reply-To: <CAMuHMdX-U_y7axw9AHYt7Omj5LzE69FTNy6PNUy4TBbxs3CtRA@mail.gmail.com>
From:   Geert Uytterhoeven <geert@linux-m68k.org>
Date:   Mon, 25 Feb 2019 10:51:04 +0100
Message-ID: <CAMuHMdUpWu9HFxgxA6C=Y+OMOfe-cm+fibUgr8r9fVrjW5=p1Q@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator: add dummy 2nd port to rcar_sound
To:     Simon Horman <horms+renesas@verge.net.au>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>
Cc:     Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" 
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Woops, this time using the Real Rob.

On Mon, Feb 25, 2019 at 10:49 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> CC DT
>
> On Mon, Feb 25, 2019 at 10:37 AM Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Add dummy 2nd port node to rcar_sound ports node to satisfy dtc
> > recommendation that #address-cells / #size-cells is only needed.
> >
> > This addresses the following warning:
> >
> > arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> > arch/arm64/boot/dts/renesas/salvator-common.dtsi:703.8-719.4: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> >
> > This change should not have any run-time effect.
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> >
> > ---
> > Build tested against renesas-devel-20190214-v5.0-rc6
> > ---
> >  arch/arm64/boot/dts/renesas/salvator-common.dtsi | 9 +++++++++
> >  1 file changed, 9 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/salvator-common.dtsi b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > index a225c2457274..20b35991bc17 100644
> > --- a/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/salvator-common.dtsi
> > @@ -716,6 +716,15 @@
> >                                 capture  = <&ssi1 &src1 &dvc1>;
> >                         };
> >                 };
> > +
> > +               /* Dummy node to be overriden by board DT
> > +                * Satisfies dtc recommendation that
> > +                * #address-cells / #size-cells is only needed
> > +                * for graph nodes with multiple child nodes.
> > +                */
> > +               rsnd_port1: port@1 {
> > +                       reg = <1>;
> > +               };
> >         };
> >  };

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
