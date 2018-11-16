Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f68.google.com ([209.85.222.68]:34570 "EHLO
        mail-ua1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2389350AbeKPSmS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 13:42:18 -0500
Received: by mail-ua1-f68.google.com with SMTP id z23so7768005uam.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 16 Nov 2018 00:30:59 -0800 (PST)
MIME-Version: 1.0
References: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1542352851-25393-1-git-send-email-uli+renesas@fpond.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 16 Nov 2018 09:30:46 +0100
Message-ID: <CAMuHMdVTowMnS5YFgMOe+sC__zhhWp_MPtctDtCGAiYdoea7+w@mail.gmail.com>
Subject: Re: [PATCH v2 0/4] I2C0/3/5 pin control for H3 and M3-W
To: uli+renesas@fpond.eu
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Nov 16, 2018 at 8:21 AM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This is an up-port from the BSP. Unfortunately I could not test these
> because none of those pins seem to be accessible on Salvator boards (not on
> ULCB either, AFAICT), so the best thing I can say is that they don't seem to
> break anything.

I think I replied before...

For Salvator-X(S):
  1. If you set SW5 and SW6 to their center positions, you can access I2C3 on
     EXIO Connector D.
  2. I2C5 is available on test points CP45/46.

> This revision incorporates the suggestions made by Geert; see below for
> details.

Thanks for the update!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
