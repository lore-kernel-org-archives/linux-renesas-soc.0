Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:33660 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932197AbeDXKWa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 06:22:30 -0400
MIME-Version: 1.0
In-Reply-To: <cdebe21a-21d8-6313-0120-50b3f68e9a40@cogentembedded.com>
References: <21306a59-8f20-ad08-fdc1-bcc6333c01d4@cogentembedded.com> <cdebe21a-21d8-6313-0120-50b3f68e9a40@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 12:22:29 +0200
Message-ID: <CAMuHMdWspCjQ8NdLoV1j3HQ=axgmCo4ROP7B+sawap_FLnGZzg@mail.gmail.com>
Subject: Re: [PATCH v3] pinctrl: sh-pfc: r8a77970: fix pin I/O voltage control support
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 19, 2018 at 8:52 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> I've included the pin I/O voltage control into the R8A77970 PFC driver but
> it was incomplete because:
> - SH_PFC_PIN_CFG_IO_VOLTAGE pin flags weren't set properly;
> - sh_pfc_soc_info::ioctrl_regs wasn't set at all...
>
> Fixes: b92ac66a1819 ("pinctrl: sh-pfc: Add R8A77970 PFC support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. queued in sh-pfc-for-v4.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
