Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f195.google.com ([209.85.217.195]:45516 "EHLO
        mail-ua0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727015AbeGMJaF (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Jul 2018 05:30:05 -0400
MIME-Version: 1.0
References: <1531275016-9809-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <1531275016-9809-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
In-Reply-To: <1531275016-9809-2-git-send-email-yoshihiro.shimoda.uh@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 13 Jul 2018 11:16:07 +0200
Message-ID: <CAMuHMdXpuOkszzVtX0=iWCi=r884b-Kq4GbF4aM1EJzY74vvLQ@mail.gmail.com>
Subject: Re: [PATCH v2 1/2] dmaengine: sh: rcar-dmac: add a new function to
 clear CHCR.DE with barrier
To: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Cc: Vinod Koul <vinod.koul@intel.com>, dmaengine@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jul 11, 2018 at 4:11 AM Yoshihiro Shimoda
<yoshihiro.shimoda.uh@renesas.com> wrote:
> This patch adds a new function rcar_dmac_clear_chcr_de() to simplify
> adding pause function later.
>
> Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
