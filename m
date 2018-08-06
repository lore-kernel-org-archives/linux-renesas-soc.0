Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:44027 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728198AbeHFWdr (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 18:33:47 -0400
Date: Mon, 6 Aug 2018 22:22:45 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
CC: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 12/14] arm64: dts: renesas: r8a77965: add CAN support
Message-ID: <20180806202245.GD5999@vmlxhi-102.adit-jv.com>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-13-erosca@de.adit-jv.com>
 <CAMuHMdV4g0uUKWSt-+iFfaPY-JywrOrRPK6MkEQe2B5AGMykOQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAMuHMdV4g0uUKWSt-+iFfaPY-JywrOrRPK6MkEQe2B5AGMykOQ@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Geert,

On Mon, Aug 06, 2018 at 05:15:37PM +0200, Geert Uytterhoeven wrote:
> Hi Eugeniu,
> 
> On Sun, Aug 5, 2018 at 1:14 AM Eugeniu Rosca <roscaeugeniu@gmail.com> wrote:
> > According to R-Car Gen3 HW manual rev0.55E, R-Car M3-N has two CAN
> > interfaces, similar to H3, M3-W and other SoCs from the same family.
> >
> > Add CAN nodes to avoid below r8a77965-ulcb-kf.dtb build failure:
> > Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:19.1-6 Label or path can0 not found
> > Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:25.1-6 Label or path can1 not found
> >
> > CAN support is inspired from below commits:
> >  - v4.7 commit 308b7e4ba62e ("arm64: dts: r8a7795: Add CAN support")
> >  - v4.11 commit 909c16252415 ("arm64: dts: r8a7796: Add CAN support")
> >  - v4.12 commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")
> >
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> 
> Thanks for your patch!
> 
> Have you actually tested CAN operation, or were you just fixing the
> build failure?
> In case of the latter, please just add minimal placeholders, like were present
> for other device nodes in early versions of r8a77965.dtsi.

Same as replied to Kieran, I will add some skeleton nodes for can0 and
can1, just to avoid DTC errors. It was not my goal to do CAN bring-up.

> 
> Gr{oetje,eeting}s,
> 
>                         Geert
> 
> -- 
> Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org
> 
> In personal conversations with technical people, I call myself a hacker. But
> when I'm talking to journalists I just say "programmer" or something like that.
>                                 -- Linus Torvalds

Best regards,
Eugeniu.
