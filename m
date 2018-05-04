Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:39985 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751592AbeEDJk2 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 4 May 2018 05:40:28 -0400
MIME-Version: 1.0
In-Reply-To: <1524567788-51738-1-git-send-email-biju.das@bp.renesas.com>
References: <1524567788-51738-1-git-send-email-biju.das@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 4 May 2018 11:40:26 +0200
Message-ID: <CAMuHMdWsndFNTVgmzru9Mg0iB5QDGeKS-63=+kZXN0xbbfw7=A@mail.gmail.com>
Subject: Re: [PATCH v2] pinctrl: sh-pfc: Add r8a77470 PFC support
To: Biju Das <biju.das@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <chris.paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Biju,

On Tue, Apr 24, 2018 at 1:03 PM, Biju Das <biju.das@bp.renesas.com> wrote:
> Add PFC support for the R8A77470 SoC including pin groups for
> some on-chip devices such as SCIF, AVB and MMC.
>
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Thanks for your patch!

> ---
> V1-->V2
> * Incoroporated the following review comments
> * Fixed MOD_SEL to MOD_SEL0
> * Created seperate pin group for AVB_COL and AVB_CRS
> * Added the pin group AVB_CAPTURE and AVB_MATCH
> * Added missing SCIF pin groups

I believe this is v3, not v2?

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Given the (unfinished) discussion about the AVB pins, I'll apply and queue
your patch in sh-pfc-for-v4.18 with the AVB pin groups removed.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
