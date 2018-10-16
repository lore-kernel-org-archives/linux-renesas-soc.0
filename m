Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:41343 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726760AbeJPTiq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 16 Oct 2018 15:38:46 -0400
MIME-Version: 1.0
References: <20181016103339.4942-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20181016103339.4942-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Oct 2018 13:48:27 +0200
Message-ID: <CAMuHMdVRw94E3U-dh6i4PsnuxzZd+Qav-EGFz4o0XkRw7e7VJw@mail.gmail.com>
Subject: Re: [PATCH] MAINTAINERS: Remove Laurent Pinchart as Renesas pinctrl maintainer
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

CC pinctrl

On Tue, Oct 16, 2018 at 12:33 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> Geert Uytterhoeven has long taken over and I'm not involved anymore with
> the Renesas pinctrl driver. Remove myself from the maintainers list.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Thank you, will queue in sh-pfc-for-v4.21.

> ---
>  MAINTAINERS | 1 -
>  1 file changed, 1 deletion(-)
>
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 69373eb328d4..f9d00cc05202 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -11515,7 +11515,6 @@ F:      Documentation/devicetree/bindings/pinctrl/qcom,*.txt
>  F:     drivers/pinctrl/qcom/
>
>  PIN CONTROLLER - RENESAS
> -M:     Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  M:     Geert Uytterhoeven <geert+renesas@glider.be>
>  L:     linux-renesas-soc@vger.kernel.org
>  T:     git git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-drivers.git sh-pfc

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
