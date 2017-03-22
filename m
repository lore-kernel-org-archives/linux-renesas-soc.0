Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:36022 "EHLO
        mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934457AbdCVNZz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 22 Mar 2017 09:25:55 -0400
MIME-Version: 1.0
In-Reply-To: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
References: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 22 Mar 2017 14:25:37 +0100
Message-ID: <CAMuHMdXBsv-oo4gSg-ZReRpCLyb4-wgLY_3dDxHJmnCyzPaTQQ@mail.gmail.com>
Subject: Re: [PATCH 0/2] pinctrl: sh-pfc: r8a7795: Misc fixes and cleanups
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Mar 13, 2017 at 5:41 PM, Geert Uytterhoeven
<geert+renesas@glider.be> wrote:
> This patch series contains miscellaneous fixes and cleanups for the
> Renesas R-Car H3 pinctrl driver:
>
> I plan to queue these up in sh-pfc-for-v4.12.

Queued in sh-pfc-for-v4.12, after adressing Sergei's comment.

> Geert Uytterhoeven (2):
>   pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
>   pinctrl: sh-pfc: r8a7795: Restore sort order

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
