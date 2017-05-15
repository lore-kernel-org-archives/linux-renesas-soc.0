Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:33848 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759476AbdEOJF4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 May 2017 05:05:56 -0400
MIME-Version: 1.0
In-Reply-To: <1494838192-17062-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
References: <1494838192-17062-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 15 May 2017 11:05:55 +0200
Message-ID: <CAMuHMdVCQ8mu047cZ7BiMCsDe20VexdF7GEL9nBmyJrgq+DAHQ@mail.gmail.com>
Subject: Re: [PATCH] dmaengine: usb-dmac: Fix DMAOR AE bit definition
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>,
        stable <stable@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, May 15, 2017 at 10:49 AM, Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> From: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
>
> This patch fixes the register definition of AE (Address Error flag) bit.
>
> Fixes: 0c1c8ff32fa2 ("dmaengine: usb-dmac: Add Renesas USB DMA Controller (USB-DMAC) driver")
> Cc: <stable@vger.kernel.org> # v4.1+
> Signed-off-by: Hiroyuki Yokoyama <hiroyuki.yokoyama.vx@renesas.com>
> [Shimoda: add Fixes and Cc tags in the commit log]
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

This matches my documentation, where the AE bit in the DMAOR register
is indeed different for USB-DMAC, compared to SYS-DMAC and AUDIO-DMAC.

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
