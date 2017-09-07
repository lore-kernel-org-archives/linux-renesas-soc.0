Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f65.google.com ([74.125.83.65]:35128 "EHLO
        mail-pg0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752778AbdIGIdk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 7 Sep 2017 04:33:40 -0400
MIME-Version: 1.0
In-Reply-To: <20170906070507.26223-5-dirk.behme@de.bosch.com>
References: <20170906070507.26223-1-dirk.behme@de.bosch.com> <20170906070507.26223-5-dirk.behme@de.bosch.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 7 Sep 2017 10:33:39 +0200
Message-ID: <CAMuHMdW=AA03BLMXO8EpBBx3gdd13VPrjhL1gsEgZR2msYBkcQ@mail.gmail.com>
Subject: Re: [PATCH 4/8] spi: sh-msiof: Fix DMA completion
To: Dirk Behme <dirk.behme@de.bosch.com>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-spi <linux-spi@vger.kernel.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Ryo Kataoka <ryo.kataoka.wt@renesas.com>,
        Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Dirk,

On Wed, Sep 6, 2017 at 9:05 AM, Dirk Behme <dirk.behme@de.bosch.com> wrote:
> From: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
>
> When reception DMA completes before transmission DMA, next transmission
> DMA may not be able to start. This patch adds wait_for_completion_timeout()
> to both of reception DMA and transmission DMA.
>
> If the driver waits only for the Rx DMA completion, the Tx DMA completion
> thread of DMA Engine may be still processing.
>
> Signed-off-by: Ryo Kataoka <ryo.kataoka.wt@renesas.com>
> [reword commit message]
> Signed-off-by: Hiromitsu Yamasaki <hiromitsu.yamasaki.ym@renesas.com>
> [adjust context]
> Signed-off-by: Dirk Behme <dirk.behme@de.bosch.com>

Is this still needed after "[PATCH 5/8] spi: sh-msiof: Wait for Tx
FIFO empty after DMA"?

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
