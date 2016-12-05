Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:33352 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751134AbcLEIoV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 03:44:21 -0500
Received: by mail-io0-f193.google.com with SMTP id j92so21068990ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Dec 2016 00:44:21 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <877f7fvvh5.wl%kuninori.morimoto.gx@renesas.com>
References: <878trvvvii.wl%kuninori.morimoto.gx@renesas.com> <877f7fvvh5.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Dec 2016 09:44:20 +0100
Message-ID: <CAMuHMdXEAoXR-aZ6M+dSQ2_GxRfyfM-Hpg2voZMHLp88UJWrVw@mail.gmail.com>
Subject: Re: [PATCH 1/2] arm64: dts: r8a7795: add sound CTU support
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
Cc: Simon <horms@verge.net.au>, Magnus <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Morimoto-san,

On Mon, Dec 5, 2016 at 5:42 AM, Kuninori Morimoto
<kuninori.morimoto.gx@renesas.com> wrote:
> --- a/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> +++ b/arch/arm64/boot/dts/renesas/r8a7795.dtsi
> @@ -1182,6 +1184,17 @@
>                                 };
>                         };
>
> +                       rcar_sound,ctu {
> +                               ctu00: ctu@0 { };
> +                               ctu01: ctu@1 { };
> +                               ctu02: ctu@2 { };
> +                               ctu03: ctu@3 { };
> +                               ctu10: ctu@4 { };
> +                               ctu11: ctu@5 { };
> +                               ctu12: ctu@6 { };
> +                               ctu13: ctu@7 { };

With W=1:

Warning (unit_address_vs_reg): Node
/sound@ec500000/rcar_sound,ctu/ctu@0 has a unit name, but no reg
property

"ctu00: ctu-0 { };" etc...

> +                       };
> +

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
