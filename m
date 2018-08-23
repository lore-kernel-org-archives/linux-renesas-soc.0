Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f67.google.com ([209.85.222.67]:40811 "EHLO
        mail-ua1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726277AbeHWMam (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 08:30:42 -0400
Received: by mail-ua1-f67.google.com with SMTP id 101-v6so1968336uav.7
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 02:01:59 -0700 (PDT)
MIME-Version: 1.0
References: <20180812133149.7710-1-erosca@de.adit-jv.com> <20180812133149.7710-5-erosca@de.adit-jv.com>
 <d4a8767c-8d98-859d-1dce-210e1f95fcec@ideasonboard.com> <CAMuHMdVz3q8PC+6hkQrn4aapGj3RqcwhOweOYYvs6Cw9ht3pKw@mail.gmail.com>
 <bd410bcb-bba9-a68e-f7bd-e67a94a52bae@cogentembedded.com>
In-Reply-To: <bd410bcb-bba9-a68e-f7bd-e67a94a52bae@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Aug 2018 11:01:46 +0200
Message-ID: <CAMuHMdW41s4WXe0=w9xX98TBjskLkGXm+EA+2=UxNJk6cJwXMQ@mail.gmail.com>
Subject: Re: [PATCH v2 5/7] arm64: dts: renesas: r8a77965: Add CAN{0,1}
 placeholder nodes
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <erosca@de.adit-jv.com>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thu, Aug 23, 2018 at 10:56 AM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 8/23/2018 11:52 AM, Geert Uytterhoeven wrote:
> >>> According to R-Car Gen3 HW manual rev1.00, R-Car M3-N has two CAN
> >>> interfaces, similar to H3, M3-W and other SoCs from the same family.
> >>>
> >>> Add CAN placeholder nodes to avoid below DTC errors:
> >>> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:19.1-6 Label or path can0 not found
> >>> Error: arch/arm64/boot/dts/renesas/ulcb-kf.dtsi:25.1-6 Label or path can1 not found
> >>>
> >>> These errors occur *after* the addition of r8a77965-m3nulcb-kf.dts.
> >>> Fix them beforehand.
> >>>
> >>> CAN support is inspired from below commits:
> >>>   - v4.7 commit 308b7e4ba62e ("arm64: dts: r8a7795: Add CAN support")
> >>>   - v4.11 commit 909c16252415 ("arm64: dts: r8a7796: Add CAN support")
> >>>   - v4.12 commit bec0948e810f ("arm64: dts: r8a7796: Add reset control properties")
> >>>
> >>> Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>

> >>> --- a/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> >>> +++ b/arch/arm64/boot/dts/renesas/r8a77965.dtsi
> >>> @@ -656,6 +656,22 @@
> >>>                        status = "disabled";
> >>>                };
> >>>
> >>> +             can0: can@e6c30000 {
> >>> +                     compatible = "renesas,can-r8a77965",
> >>> +                                  "renesas,rcar-gen3-can";
> >>> +                     reg = <0 0xe6c30000 0 0x1000>;
> >>> +                     /* placeholder */
> >>> +                     status = "disabled";
> >>> +             };
> >>
> >> This is probably more detail than is needed for a placeholder, but it
> >> looks correct so I think this is fine.
> >
> > Indeed. Adding the "compatible" properties means they're no longer
> > placeholders, and will be probed by the driver, possibly leading to
> > undefined behavior.
>
>     I don't think the disabled device nodes are actually probed.

They will be by ulcb-kf.dtsi, after the addition of
r8a77965-m3nulcb-kf.dts, cfr.
the errors and rationale documented in the commit message.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
