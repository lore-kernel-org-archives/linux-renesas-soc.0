Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f194.google.com ([209.85.216.194]:45027 "EHLO
        mail-qt0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751115AbeC0IJl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 27 Mar 2018 04:09:41 -0400
MIME-Version: 1.0
In-Reply-To: <1521804706-27666-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1521804706-27666-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 27 Mar 2018 10:09:40 +0200
Message-ID: <CAMuHMdVdn=Og9Q=xXTtzu34HbMH8drjvif7r4F8kMSqER-igQA@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a77965: Add PWM pins, groups and functions
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

On Fri, Mar 23, 2018 at 12:31 PM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds PWM{0,1,2,3,4,5,6} pins, groups and functions to
> R8A77965 SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. will queue for v4.18.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
