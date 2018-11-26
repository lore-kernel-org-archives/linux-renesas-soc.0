Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vk1-f196.google.com ([209.85.221.196]:38933 "EHLO
        mail-vk1-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726203AbeKZVKg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 26 Nov 2018 16:10:36 -0500
MIME-Version: 1.0
References: <b28a6c60-1f20-e054-7f2a-c5a6cafde8a1@cogentembedded.com>
In-Reply-To: <b28a6c60-1f20-e054-7f2a-c5a6cafde8a1@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 26 Nov 2018 11:16:44 +0100
Message-ID: <CAMuHMdWAnbPU5x4Gx+fKdjmUcGJe41q8-J_j24MzjHoqreoc6w@mail.gmail.com>
Subject: Re: [PATCH] sata_rcar: fix deferred probing
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Nov 24, 2018 at 7:14 PM Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> The driver overrides the error codes returned by platform_get_irq() to
> -EINVAL, so if it returns -EPROBE_DEFER, the driver would fail the probe
> permanently instead of the deferred probing. Switch to propagating the
> error code upstream, still checking/overriding IRQ0 as libata regards it
> as "no IRQ" (thus polling) anyway...
>
> Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

-- 
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
