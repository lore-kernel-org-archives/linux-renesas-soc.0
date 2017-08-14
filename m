Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:35101 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751141AbdHNNsU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 09:48:20 -0400
Received: by mail-pg0-f67.google.com with SMTP id l64so10794391pge.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2017 06:48:20 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502181568-12299-3-git-send-email-horms+renesas@verge.net.au>
References: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au> <1502181568-12299-3-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2017 15:48:19 +0200
Message-ID: <CAMuHMdXEsN1GzFUYy_Zcs5L2TXm7n-m6e1A9kxpZA=jHNhfaDw@mail.gmail.com>
Subject: Re: [PATCH 02/10] ARM: dts: r8a7779: Use R-Car GPIO Gen1 fallback
 compat string
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 8, 2017 at 10:39 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use newly added R-Car GPIO Gen1 fallback compat string
> in place of now deprecated non-generation specific
> R-Car GPIO fallback compat string in DT of r8a7779 SoC.
>
> This should have no run-time effect as the driver matches against
> the per-SoC compat string before considering the fallback compat string.

That is not correct: the driver does not match against "renesas,gpio-r8a7779".
Hence this breaks using a new DTS and an old kernel (which we may decide not
to care about for R-Car Gen1, though).
But at least the DTS change should be postponed until commit d10bbd156926e65d
("gpio: rcar: add gen[123] fallback compatibility strings") has hit mainline.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
