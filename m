Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f182.google.com ([209.85.220.182]:46599 "EHLO
        mail-qk0-f182.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751220AbdLUJHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 21 Dec 2017 04:07:35 -0500
MIME-Version: 1.0
In-Reply-To: <20171220215922.22473-1-wsa+renesas@sang-engineering.com>
References: <20171220215922.22473-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 21 Dec 2017 10:07:34 +0100
Message-ID: <CAMuHMdWC9B9YtDzHJ21zLrzMx8JJxUC5q9LRz3c-Kv2y6M+Y9A@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add SATA pins, groups, and functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-gpio@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Dec 20, 2017 at 10:59 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Tested with a Salvator-XS and H3 ES2.0.

Thanks for your patch!

> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
i.e. will queue in sh-pfc-for-v4.16.

> Note: To repeat the test you must:
> a) switch pin7 from SW12 to OFF

Funny how the relation of MD12 to SATA is mentioned only in the Salvator-XS
hardware manual, but not in the R-Car Gen3 User's Manual? Or did I miss it?

> b) set an external GPIO to 0 by using these commands:
>         i2cset -y 4 0x20 3 0x7f (set pin to output)
>         i2cset -y 4 0x20 1 0x7f (set pin to 0)

Time to add the PCA9654 to the DTS, so users can use a gpio-hog instead?

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
