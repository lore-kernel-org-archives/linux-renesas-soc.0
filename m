Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:34175 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932274AbcIWIfI (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Sep 2016 04:35:08 -0400
MIME-Version: 1.0
In-Reply-To: <1474618805-22731-1-git-send-email-horms+renesas@verge.net.au>
References: <1474618805-22731-1-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Sep 2016 10:35:06 +0200
Message-ID: <CAMuHMdVGVFD2BrAGMOu1m=Ec=S-1JO=RfAuBGCB74L-astjnLw@mail.gmail.com>
Subject: Re: [PATCH] clocksource: sh_cmt: Document r8a779[34] SoC specific bindings
To: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon, Magnus,

On Fri, Sep 23, 2016 at 10:20 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> This documents the SoC specific binding for the r8a779[34] SoCs.
> This is in keeping with the documentation of other R-Car Gen2 SoCs.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> ---
>  Documentation/devicetree/bindings/timer/renesas,cmt.txt | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/Documentation/devicetree/bindings/timer/renesas,cmt.txt b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> index 1a05c1b243c1..566fb599ea39 100644
> --- a/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> +++ b/Documentation/devicetree/bindings/timer/renesas,cmt.txt
> @@ -48,10 +48,15 @@ Required Properties:
>                 (CMT[01])
>      - "renesas,cmt-48-r8a7791" for the r8a7791 48-bit CMT
>                 (CMT[01])
> +    - "renesas,cmt-48-r8a7793" for the r8a7793 48-bit CMT
> +               (CMT[01])
> +    - "renesas,cmt-48-r8a7794" for the r8a7793 48-bit CMT
> +               (CMT[01])
>      - "renesas,cmt-48-gen2" for all second generation 48-bit CMT
> -               (CMT[01] on r8a73a4, r8a7790 and r8a7791)
> +               (CMT[01] on r8a73a4, r8a7790, r8a7791, r8a7793, r8a7794)
>                 This is a fallback for the renesas,cmt-48-r8a73a4,
> -               renesas,cmt-48-r8a7790 and renesas,cmt-48-r8a7791 entries.
> +               renesas,cmt-48-r8a7790, renesas,cmt-48-r8a7791,
> +               renesas,cmt-48-r8a7793 and renesas,cmt-48-r8a7794 entries.
>
>    - reg: base address and length of the registers block for the timer module.
>    - interrupts: interrupt-specifier for the timer, one per channel.

And these are planned to be removed again with Magnus'
"devicetree: bindings: r8a73a4 and R-Car Gen2 CMT bindings"
(https://patchwork.kernel.org/patch/8579481/)?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
