Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:33758 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728059AbeISOoS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Sep 2018 10:44:18 -0400
MIME-Version: 1.0
References: <1537278478-1744-1-git-send-email-fabrizio.castro@bp.renesas.com> <1537278478-1744-3-git-send-email-fabrizio.castro@bp.renesas.com>
In-Reply-To: <1537278478-1744-3-git-send-email-fabrizio.castro@bp.renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 19 Sep 2018 11:07:09 +0200
Message-ID: <CAMuHMdXwG+XRB9L9WPHMvLuOmeqKE3fpqhDkiTxG2nMCqpjEHQ@mail.gmail.com>
Subject: Re: [PATCH 2/5] pinctrl: sh-pfc: r8a77470: Add DU0 pin groups
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

Hi Fabrizio,

On Tue, Sep 18, 2018 at 3:48 PM Fabrizio Castro
<fabrizio.castro@bp.renesas.com> wrote:
> Add DU0 pin groups and function to the R8A77470 SoC.

Thanks for your patch!

Same question: no need for DU1?

> Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> Reviewed-by: Biju Das <biju.das@bp.renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
