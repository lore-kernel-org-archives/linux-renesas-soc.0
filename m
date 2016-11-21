Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:35178 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752149AbcKUIgX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 03:36:23 -0500
Received: by mail-it0-f66.google.com with SMTP id b123so14274875itb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2016 00:36:23 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1479526093-7014-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
References: <1479526093-7014-1-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
 <1479526093-7014-10-git-send-email-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2016 09:36:22 +0100
Message-ID: <CAMuHMdW6VE4ohO=nMgtzkWbfFc+VC33OMFzaxSBGy17UcaL9cQ@mail.gmail.com>
Subject: Re: [PATCH v2 09/13] arm64: dts: r8a7795: salvator-x: Add panel
 backlight support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: DRI Development <dri-devel@lists.freedesktop.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Tomi Valkeinen <tomi.valkeinen@ti.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Sat, Nov 19, 2016 at 4:28 AM, Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The panel backlight is controlled through a GPIO and a PWM channel.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

> --- a/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> +++ b/arch/arm64/boot/dts/renesas/r8a7795-salvator-x.dts
> @@ -178,6 +178,16 @@
>                         };
>                 };
>         };
> +
> +       backlight: backlight {
> +               compatible = "pwm-backlight";
> +               pwms = <&pwm1 0 50000>;
> +
> +               brightness-levels = <256 128 64 16 8 4 0>;

Would it make sense to define more and/or linear levels?

> +               default-brightness-level = <6>;

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
