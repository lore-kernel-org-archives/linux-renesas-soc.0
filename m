Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:39641 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727365AbeISOXx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:23:53 -0400
MIME-Version: 1.0
References: <1536759062-11970-1-git-send-email-fabrizio.castro@bp.renesas.com> <1536759062-11970-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1536759062-11970-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Sep 2018 10:46:48 +0200
Message-ID: <CAMuHMdWq+gxp1u0ezLt7EFvTLykgQjCY+nXxtAmfCETnesfX9A@mail.gmail.com>
Subject: Re: [PATCH 2/2] pinctrl: sh-pfc: r8a77990: Add R8A774C0 PFC support
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

On Wed, Sep 12, 2018 at 3:31 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Renesas RZ/G2E (a.k.a. r8a774c0) is pin compatible with R-Car
> E3 (a.k.a. r8a77990), however it doesn't have several automotive
> specific peripherals. Add a r8a77990 specific pin groups/functions
> along with common pin groups/functions for supporting both r8a77990
> and r8a774c0 SoCs.
>
> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
