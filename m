Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:41827 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754207AbeE1Jcv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 28 May 2018 05:32:51 -0400
Received: by mail-ua0-f195.google.com with SMTP id a3-v6so7467410uad.8
        for <linux-renesas-soc@vger.kernel.org>; Mon, 28 May 2018 02:32:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1527078995-4259-1-git-send-email-ykaneko0929@gmail.com>
References: <1527078995-4259-1-git-send-email-ykaneko0929@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 28 May 2018 11:32:50 +0200
Message-ID: <CAMuHMdUuuMJZRzCcA86fWghFuWODUHFEbmvG0gqFxmvJzNxRzQ@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: r8a77965: Add Watchdog Timer controller node
 using RCLK Watchdog Timer
To: Yoshihiro Kaneko <ykaneko0929@gmail.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, May 23, 2018 at 2:36 PM, Yoshihiro Kaneko <ykaneko0929@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> Add a device node for the Watchdog Timer (WDT) controller on the Renesas
> R-Car M3N (R8A77965) SoC.
>
> Based on a similar patch of the R8A7796 device tree
> by Geert Uytterhoeven <geert+renesas@glider.be>.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
Tested-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
