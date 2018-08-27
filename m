Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua1-f66.google.com ([209.85.222.66]:39827 "EHLO
        mail-ua1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726942AbeH0TDL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 27 Aug 2018 15:03:11 -0400
Received: by mail-ua1-f66.google.com with SMTP id g18-v6so9742286uam.6
        for <linux-renesas-soc@vger.kernel.org>; Mon, 27 Aug 2018 08:16:09 -0700 (PDT)
MIME-Version: 1.0
References: <1534511921-19470-1-git-send-email-uli+renesas@fpond.eu>
In-Reply-To: <1534511921-19470-1-git-send-email-uli+renesas@fpond.eu>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 27 Aug 2018 17:15:55 +0200
Message-ID: <CAMuHMdX4etTkVn=wt8CKES_=3E2f-hQ6WK1EaUTK3CUETLtuFw@mail.gmail.com>
Subject: Re: [PATCH 0/3] I2C0/3/5 pin control for H3 and M3-W
To: uli+renesas@fpond.eu
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Wolfram Sang <wsa@the-dreams.de>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Uli,

On Fri, Aug 17, 2018 at 3:19 PM Ulrich Hecht <uli+renesas@fpond.eu> wrote:
> This is an up-port from the BSP. Unfortunately I could not test these
> because none of those pins seem to be accessible on Salvator boards (not on
> ULCB either, AFAICT), so the best thing I can say is that they don't seem to
> break anything.

For Salvator-X(S):
  1. If you set SW5 and SW6 to their center positions, you can access I2C3 on
     EXIO Connector D.
  2. I2C5 is available on test points CP45/46.

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
