Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f194.google.com ([209.85.221.194]:40241 "EHLO
        mail-vk1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726656AbeJJPiW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 10 Oct 2018 11:38:22 -0400
MIME-Version: 1.0
References: <1538991019-18577-1-git-send-email-fabrizio.castro@bp.renesas.com> <1538991019-18577-5-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1538991019-18577-5-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 10 Oct 2018 10:17:08 +0200
Message-ID: <CAMuHMdUGwKqwdJsV2c_9=u6siKuwfLnzKECUj9h5r8f=ZmPNuw@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77470: Add QSPI1 pin groups
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Oct 8, 2018 at 11:30 AM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add QSPI1 pin groups and function to the RZ/G1C (a.k.a. R8A77470)
> pinctrl driver.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
