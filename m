Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f193.google.com ([209.85.223.193]:35639 "EHLO
        mail-io0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750998AbcLEIp3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 5 Dec 2016 03:45:29 -0500
Received: by mail-io0-f193.google.com with SMTP id h133so12974895ioe.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 05 Dec 2016 00:45:29 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <8760mzvvgm.wl%kuninori.morimoto.gx@renesas.com>
References: <878trvvvii.wl%kuninori.morimoto.gx@renesas.com> <8760mzvvgm.wl%kuninori.morimoto.gx@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 5 Dec 2016 09:45:28 +0100
Message-ID: <CAMuHMdXSMabcuiGj5yzsgC=WnXb09UdxeVEQgarQtdwDeE09yQ@mail.gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: r8a7795: add sound MIX support
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
> @@ -1184,6 +1186,11 @@
>                                 };
>                         };
>
> +                       rcar_sound,mix {
> +                               mix0: mix@0 { };
> +                               mix1: mix@1 { };

With W=1:

    Warning (unit_address_vs_reg): Node
/sound@ec500000/rcar_sound,mix/mix@0 has a unit name, but no reg
property

"mix0: mix-0 { };" etc.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
