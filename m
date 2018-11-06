Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:36626 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729021AbeKFRqb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 6 Nov 2018 12:46:31 -0500
MIME-Version: 1.0
References: <1539686023-7487-1-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1539686023-7487-1-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 6 Nov 2018 09:22:15 +0100
Message-ID: <CAMuHMdX+4NPO5Y6iShkmh7OxAfAgbr_x+_6iMkn6Xbsb4tasNQ@mail.gmail.com>
Subject: Re: [PATCH v4 2/6] pinctrl: sh-pfc: r8a77470: Add SDHI support
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 16, 2018 at 12:33 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add SH_PFC_PIN_CFG_IO_VOLTAGE definition for the SDHI pins
> capable of switching voltage, also add pin groups and functions
> for SDHI0 and SDHI1. Please note that with the RZ/G1C only 1
> bit of the POC Control Register is used to control each interface.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> ---
> v3->v4:
> * Fixed voltage control of GP0_11 and GP0_12

Thanks, queuing in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
