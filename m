Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:43585 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932197AbeDXKW1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 06:22:27 -0400
MIME-Version: 1.0
In-Reply-To: <e912cd6b-9f2e-510f-0611-e05a6fe3f3d3@cogentembedded.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <e912cd6b-9f2e-510f-0611-e05a6fe3f3d3@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 12:22:24 +0200
Message-ID: <CAMuHMdX_ObnbrSzvWpuv1Gt64tpseCYFquaKBFvZWgSPAUJ0tg@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: r8a77980: add pin I/O voltage control support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 19, 2018 at 8:27 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Add the pin I/O voltage level control support to the R8A77980 PFC driver.
>
> Loosely based on the original (and large) patch by Vladimir Barinov.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> The patch is against the 'sh-pfc' branch of Geert's 'renesas-drivers.git' repo.
>
> Changes in version 2:
> - added IOCTRL33 to *enum* ioctrl_regs and its address to pinmux_ioctrl_regs[];
> - fixed the subject;
> - added Geert's tag.

Thanks, queued in sh-pfc-for-v4.18 (with the first character capitalized,
as usual).

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
