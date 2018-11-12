Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:42845 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728416AbeKMBaZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Nov 2018 20:30:25 -0500
MIME-Version: 1.0
References: <20180911083536.16482-1-vkoul@kernel.org> <20181007133911.GU2372@vkoul-mobl>
In-Reply-To: <20181007133911.GU2372@vkoul-mobl>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Nov 2018 16:36:27 +0100
Message-ID: <CAMuHMdU5Z6v7ySZS=D5zA2w8hQ6F0d2famfgcOMGOP_8WhtAxg@mail.gmail.com>
Subject: Re: [PATCH 00/12] dmaengine: remove usage of dma_slave_config direction
To: Vinod <vkoul@kernel.org>
Cc: dmaengine@vger.kernel.org,
        Ludovic Desroches <ludovic.desroches@microchip.com>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Eric Anholt <eric@anholt.net>,
        Linus Walleij <linus.walleij@linaro.org>,
        Viresh Kumar <vireshk@kernel.org>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Zhangfei Gao <zhangfei.gao@linaro.org>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Rich Felker <dalias@libc.org>,
        Yoshinori Sato <ysato@users.sourceforge.jp>,
        Linux-sh list <linux-sh@vger.kernel.org>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Vinod,

CC SuperH

On Sun, Oct 7, 2018 at 3:39 PM Vinod <vkoul@kernel.org> wrote:
> On 11-09-18, 14:05, Vinod Koul wrote:
> > dma_slave_config direction field was marked as deprecated sometime back,
> > though no new users are being added, some old ones still persist.
> >
> > So, here is first set of removal batch, please test and ack.
> >
> > Some drivers and users are next to be done.
> >
> > One note on renasas drivers, I found it bit difficult to remove it due
> > to usage of a layer between drivers, so if some Renasas folks can patch
> > these drivers, it would be great

Upon closer look, none of this is used anymore on Renesas ARM SoCs, only
on legacy SuperH SoCs.

So I'd like to defer this to the SuperH maintainers, and people who do have
old SH hardware.

Thanks!

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
