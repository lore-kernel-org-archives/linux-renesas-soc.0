Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f66.google.com ([209.85.213.66]:36028 "EHLO
        mail-vk0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726590AbeHUQxC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 21 Aug 2018 12:53:02 -0400
Received: by mail-vk0-f66.google.com with SMTP id y9-v6so8202675vky.3
        for <linux-renesas-soc@vger.kernel.org>; Tue, 21 Aug 2018 06:32:52 -0700 (PDT)
MIME-Version: 1.0
References: <20180730073456.3687-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180730073456.3687-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 21 Aug 2018 15:32:39 +0200
Message-ID: <CAMuHMdXLxhudW_s-FmtADt0a9-qd501s0Ckm=FTY97mxGH5GBw@mail.gmail.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: salvator-xs: enable SATA
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Simon Horman <horms@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram, Simon,

On Mon, Jul 30, 2018 at 9:34 AM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Add the nodes to enable SATA. Note that MD12 (SW12-7) must be switched
> off for that to work.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
>
> Changes since v1:
>         * fixed indentation (Thanks, Geert!)
>         * merged two patches into one (Thanks, Simon!)
>         * Added Geert's tag

> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-xs.dts

> @@ -176,6 +185,11 @@
>         };
>  };
>
> +/* MD12 (SW12-7) must be set 'Off' which is not the default! */

Upon reading this again, I think this comment is confusing: the 'Off' refers
to the switch position, not to the MD12 logic value, while the parentheses
suggest otherwise.

What about the following?

    SW12-7 must be set 'Off' (MD12 set to 1), which is not the default!

> --- a/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dts

> +/* MD12 (SW12-7) must be set 'Off' which is not the default! */

Likewise.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
