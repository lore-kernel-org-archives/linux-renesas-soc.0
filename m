Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wj0-f181.google.com ([209.85.210.181]:36106 "EHLO
        mail-wj0-f181.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753492AbcKYJw4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 25 Nov 2016 04:52:56 -0500
MIME-Version: 1.0
In-Reply-To: <20161125075614.GB14431@verge.net.au>
References: <20161125075614.GB14431@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 25 Nov 2016 09:58:00 +0100
Message-ID: <CAMuHMdU=AeEmLVWjj_=rUMt8WX-ZJebDGJ7gGDBFa6UbJRqc1A@mail.gmail.com>
Subject: Re: [PATCH mmc/next] mmc: sh_mmcif: Document r8a73a4, r8a7778 and
 sh73a0 DT bindings
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
        Linux MMC List <linux-mmc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 25, 2016 at 8:56 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Simply document new compatibility strings as the driver is already
> activated using a fallback compatibility string.
>
> These compat strings are in keeping with those for all other
> Renesas ARM based SoCs with sh_mmcif enabled in mainline.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
