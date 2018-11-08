Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:34574 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726571AbeKHWe0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 8 Nov 2018 17:34:26 -0500
MIME-Version: 1.0
References: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
In-Reply-To: <20181105214012.11626-1-marek.vasut+renesas@gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 8 Nov 2018 13:58:51 +0100
Message-ID: <CAMuHMdW5S8iZYkpfAixTeEkvF4WiBEELr7aS_Wt+Aued-O1KLg@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a77990: Add SDHI pins, groups and functions
To: Marek Vasut <marek.vasut@gmail.com>
Cc: "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 5, 2018 at 10:40 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
>
> This patch adds SDHI{0,1,3} pins, groups and functions to the R8A77990
> SoC.
>
> Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.21.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
