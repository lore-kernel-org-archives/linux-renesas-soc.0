Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f193.google.com ([209.85.221.193]:39992 "EHLO
        mail-vk1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727550AbeKPSwW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 13:52:22 -0500
Received: by mail-vk1-f193.google.com with SMTP id v70so5087008vkv.7
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Nov 2018 00:41:01 -0800 (PST)
MIME-Version: 1.0
References: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu> <1542352851-25393-5-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1542352851-25393-5-git-send-email-uli+renesas@fpond.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Nov 2018 09:40:49 +0100
Message-ID: <CAMuHMdX09pwxHJ=nXz9vgvMZt7pd=0_gqbYmabRpStgweqcGww@mail.gmail.com>
Subject: Re: [PATCH v2 4/4] pinctrl: sh-pfc: r8a7796: Add I2C{0,3,5} pins,
 groups and functions
To: uli+renesas@fpond.eu
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 16, 2018 at 8:21 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds I2C{0,3,5} pins, groups and functions to the R8A7796 SoC.
>
> These pins are physically muxed with other pins. Therefore, setup of
> MOD_SEL is needed for exclusive control with other pins.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Ulrich Hecht <uli+renesas@fpond.eu>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
