Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk0-f65.google.com ([209.85.213.65]:39505 "EHLO
        mail-vk0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726970AbeHWN2C (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 23 Aug 2018 09:28:02 -0400
Received: by mail-vk0-f65.google.com with SMTP id e139-v6so2301790vkf.6
        for <linux-renesas-soc@vger.kernel.org>; Thu, 23 Aug 2018 02:59:06 -0700 (PDT)
MIME-Version: 1.0
References: <20180819194455.25096-1-laurent.pinchart+renesas@ideasonboard.com>
In-Reply-To: <20180819194455.25096-1-laurent.pinchart+renesas@ideasonboard.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 23 Aug 2018 11:58:54 +0200
Message-ID: <CAMuHMdW4ium4s97+1iOHkhBGw3LdfPyfxXq4_7ic+VtXzRpE2g@mail.gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: Add GPIO keys support
To: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Sun, Aug 19, 2018 at 9:44 PM Laurent Pinchart
<laurent.pinchart+renesas@ideasonboard.com> wrote:
> The Salvator-X and XS boards have a 4 lines DIP switch and 3 push
> buttons connected to SoC GPIOs, meant to be used as general-purpose test
> keys. Add a corresponding node in DT, mapping (semi-randomly) the DIP
> switch to keys 1-4 and the push buttons to keys A-C.
>
> Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>

Given GP6_1[123] are not just wired to the 3 push buttons, but also to 3
LEDs, I wonder if we shouldn't postpone that part until Linux can handle
GPIOs connected to both?

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
