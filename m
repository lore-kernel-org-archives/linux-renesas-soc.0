Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:41150 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726651AbeG3RAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 13:00:38 -0400
MIME-Version: 1.0
References: <1532951278-28676-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1532951278-28676-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 17:24:58 +0200
Message-ID: <CAMuHMdVBW0Ty1BO=bt2QN=qk=NRph-VkpEhwbp7-gAH5E2n2MA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77990: Add PWM pins, groups and functions
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 30, 2018 at 1:49 PM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds PWM{0,1,2,3,4,5,6} pins, groups and functions to
> the R8A77990 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.20.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
