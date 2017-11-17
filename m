Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:46004 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933916AbdKQJGY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Nov 2017 04:06:24 -0500
MIME-Version: 1.0
In-Reply-To: <20171116201842.006310882@cogentembedded.com>
References: <20171116201842.006310882@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 17 Nov 2017 10:06:23 +0100
Message-ID: <CAMuHMdVAD5saFjnkMViTeCm2vDYfEraq9DdHqNLet3YHjo0UeQ@mail.gmail.com>
Subject: Re: [PATCH] gpio: pca953x: fix vendor prefix for PCA9654
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thu, Nov 16, 2017 at 9:18 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> Despite commit 55020c8056a8 ("of: Add vendor prefix for ON Semiconductor
> Corp.") was made long ago, the latter commit 9f49f6dd0473 ("gpio: pca953x:
> add onsemi,pca9654 id") made use of another, undocumented vendor prefix.

Ouch...

> Since such prefix doesn't seem to be used in any device trees, I think we
> can just fix the "compatible" string in the driver and the bindings and be
> done with that...
>
> Fixes: 9f49f6dd0473 ("gpio: pca953x: add onsemi,pca9654 id")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>
> ---
> The patch is against the 'fixes' branch of LinusW's 'linux-gpio.git' repo.
>
>  Documentation/devicetree/bindings/gpio/gpio-pca953x.txt |    2 +-
>  drivers/gpio/gpio-pca953x.c                             |    2 +-

There's another (different) one in
Documentation/devicetree/bindings/misc/idt_89hpesx.txt

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
