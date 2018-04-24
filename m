Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f67.google.com ([209.85.213.67]:44369 "EHLO
        mail-vk0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1755830AbeDXH6e (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 03:58:34 -0400
MIME-Version: 1.0
In-Reply-To: <1524227264-24896-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1524227264-24896-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1524227264-24896-3-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 24 Apr 2018 09:58:32 +0200
Message-ID: <CAMuHMdVKwcZmYZ=gquT-aOzv1TT9UEEun4cZ-jLemVyhGQcMAA@mail.gmail.com>
Subject: Re: [PATCH v2 2/2] clk: renesas: cpg-mssr: Add support for R-Car E3
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        linux-clk <linux-clk@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Apr 20, 2018 at 2:27 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> Initial support for R-Car E3 (r8a77990), including core and module
> clocks.
>
> Based on the Table 8.2g of "R-Car Series, 3rd Generation User's Manual:
> Hardware ((Rev. 0.80, Oct 31, 2017) with Manual Errata on Feb. 28, 2018".
>
> Inspried by patches by Takeshi Kihara in the BSP.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Thanks, will queue in clk-renesas-for-v4.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
