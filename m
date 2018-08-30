Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39187 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728702AbeH3R1S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 13:27:18 -0400
Received: by mail-ua1-f66.google.com with SMTP id g18-v6so5516622uam.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 06:25:10 -0700 (PDT)
MIME-Version: 1.0
References: <20180828141059.6280-1-geert+renesas@glider.be> <20180830130747.6qdj27szbfj2kltt@verge.net.au>
In-Reply-To: <20180830130747.6qdj27szbfj2kltt@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Aug 2018 15:24:57 +0200
Message-ID: <CAMuHMdWXksg8DO-mPfkhpUifpqDqQvyMeTtpCYWJ4yoU9DE_gw@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a7796: Fix whitespace around assignments
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Aug 30, 2018 at 3:08 PM Simon Horman <horms@verge.net.au> wrote:
> On Tue, Aug 28, 2018 at 04:10:59PM +0200, Geert Uytterhoeven wrote:
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> >  arch/arm64/boot/dts/renesas/r8a774a1.dtsi    |  4 +-
> >  arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi | 16 +++----
> >  arch/arm64/boot/dts/renesas/r8a7795.dtsi     | 48 ++++++++++----------
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi     | 48 ++++++++++----------
> >  arch/arm64/boot/dts/renesas/r8a77965.dtsi    | 36 +++++++--------
> >  arch/arm64/boot/dts/renesas/r8a77970.dtsi    |  8 ++--
> >  arch/arm64/boot/dts/renesas/r8a77980.dtsi    | 16 +++----
> >  arch/arm64/boot/dts/renesas/ulcb-kf.dtsi     |  2 +-
> >  8 files changed, 89 insertions(+), 89 deletions(-)
>
> Thanks Geert,
>
> I took the liberty of updating the subject with s/r8a7796/renesas/

Sorry, I thought I had fixed that. Probably on the wrong branch.

> and fixing a few more cases, likely ones that slipped in after you prepared
> this patch (and are currently only local to my tree).
>
> The incremental diff is:
>
> diff --git a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> index 2798c4c9cf94..010a9958693d 100644
> --- a/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a774a1.dtsi
> @@ -1455,7 +1455,7 @@
>                         clocks = <&cpg CPG_MOD 703>;
>                         phys = <&usb2_phy0>;
>                         phy-names = "usb";
> -                       companion= <&ohci0>;
> +                       companion = <&ohci0>;
>                         power-domains = <&sysc 32>;
>                         resets = <&cpg 703>;
>                         status = "disabled";
> @@ -1468,7 +1468,7 @@
>                         clocks = <&cpg CPG_MOD 702>;
>                         phys = <&usb2_phy1>;
>                         phy-names = "usb";
> -                       companion= <&ohci1>;
> +                       companion = <&ohci1>;
>                         power-domains = <&sysc 32>;
>                         resets = <&cpg 702>;
>                         status = "disabled";
> diff --git a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> index 8bf3091a899c..1b316d79df88 100644
> --- a/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> +++ b/arch/arm64/boot/dts/renesas/ulcb-kf.dtsi
> @@ -127,7 +127,7 @@
>                 #address-cells = <1>;
>                 #size-cells = <0>;
>                 reg = <0x71>;
> -               reset-gpios= <&gpio3 15 GPIO_ACTIVE_LOW>;
> +               reset-gpios = <&gpio3 15 GPIO_ACTIVE_LOW>;
>         };
>  };

Thanks, looks good to me!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
