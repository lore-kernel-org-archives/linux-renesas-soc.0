Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f66.google.com ([74.125.83.66]:37135 "EHLO
        mail-pg0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752199AbdHNNv1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Aug 2017 09:51:27 -0400
Received: by mail-pg0-f66.google.com with SMTP id 83so10798152pgb.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 14 Aug 2017 06:51:27 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1502181568-12299-6-git-send-email-horms+renesas@verge.net.au>
References: <1502181568-12299-1-git-send-email-horms+renesas@verge.net.au> <1502181568-12299-6-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 14 Aug 2017 15:51:26 +0200
Message-ID: <CAMuHMdVZ3-XKgjRJSaLXSa9e2-TxpGct6u_wDvPuCADCOu4i4g@mail.gmail.com>
Subject: Re: [PATCH 05/10] ARM: dts: r8a7791: Use R-Car GPIO Gen2 fallback
 compat string
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Aug 8, 2017 at 10:39 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use newly added R-Car GPIO Gen2 fallback compat string
> in place of now deprecated non-generation specific
> R-Car GPIO fallback compat string in the DT of the r8a7791 SoC.
>
> This should have no run-time effect as the driver matches against
> the per-SoC compat string before considering the fallback compat string.
>
> Signed-off-by: Simon Horman <horms+renesas@verge.net.au>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
