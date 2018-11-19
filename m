Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f195.google.com ([209.85.221.195]:33284 "EHLO
        mail-vk1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727084AbeKSUKv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 15:10:51 -0500
MIME-Version: 1.0
References: <20181118172903.4481-1-marek.vasut+renesas@gmail.com>
 <20181118172903.4481-4-marek.vasut+renesas@gmail.com> <CAMuHMdXjFguUO1QJXDrfjbOBY7ZHy2PM41vAKx4oppqoY0RviA@mail.gmail.com>
In-Reply-To: <CAMuHMdXjFguUO1QJXDrfjbOBY7ZHy2PM41vAKx4oppqoY0RviA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 19 Nov 2018 10:47:32 +0100
Message-ID: <CAMuHMdWBgEXHS1tfbysindPyfjm54Qrtf3o+gEzN1N4gOzzydQ@mail.gmail.com>
Subject: Re: [PATCH 4/4] pinctrl: sh-pfc: r8a77990: Add CAN FD pins, groups
 and functions
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

Hi Marek,

On Mon, Nov 19, 2018 at 10:06 AM Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> On Sun, Nov 18, 2018 at 6:29 PM Marek Vasut <marek.vasut@gmail.com> wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> >
> > This patch adds CAN FD{0,1} pins, groups and functions to the R8A77990
> > SoC.
> >
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> i.e. will queue in sh-pfc-for-v4.21.

Upon second look, the canfd groups and functions should be moved from
the common to the automotive section, as RZ/G2E does not have them.
As I have to update the array sizes anyway (my branch already has more
patches applied), I moved them while applying.

Please check the result later today, after I have pushed.
Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
