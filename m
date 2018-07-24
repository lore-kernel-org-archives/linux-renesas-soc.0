Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f193.google.com ([209.85.217.193]:42646 "EHLO
        mail-ua0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388329AbeGXIMR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 04:12:17 -0400
MIME-Version: 1.0
References: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
In-Reply-To: <20180721111449.10103-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Jul 2018 09:07:04 +0200
Message-ID: <CAMuHMdXCysjhXin0+cWijnJo2+G5kDCNJ+MgpWqCxV5UvwEfbA@mail.gmail.com>
Subject: Re: [PATCH] mmc: renesas_sdhi: Add r8a77990 support
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Linux MMC List <linux-mmc@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        =?UTF-8?Q?Niklas_S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Sat, Jul 21, 2018 at 1:14 PM Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> This patch adds SDHI support for the R8A77990 SoC (R-Car E3). No driver changes
> needed for anything except HS400 which we will enable separately later.
>
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

This matches Table 70.1 ("Pin Configuration") of Section 70 ("SD Card/MMC
Interfaces"), so

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

However, the figures at the top of Sections 70 and 70.2 indicate SDHI is not
available on R-Car E3 (and H3, M3-W, and M3-N)?!?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
