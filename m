Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33005 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752423AbcLLNpE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Dec 2016 08:45:04 -0500
Received: by mail-io0-f194.google.com with SMTP id p13so21584269ioi.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 12 Dec 2016 05:45:04 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <1481533902-14789-14-git-send-email-horms+renesas@verge.net.au>
References: <1481533902-14789-1-git-send-email-horms+renesas@verge.net.au> <1481533902-14789-14-git-send-email-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Dec 2016 14:45:03 +0100
Message-ID: <CAMuHMdWbUqdb1nQSq4kMcVU2p1puG7gAwJZ9kJqniiqhJTYHTw@mail.gmail.com>
Subject: Re: [PATCH renesas/devel 13/13] ARM: dts: r8a7794: Use R-Car Gen 2
 fallback binding for i2c nodes
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Dec 12, 2016 at 10:11 AM, Simon Horman
<horms+renesas@verge.net.au> wrote:
> Use recently added R-Car Gen 2 fallback binding for iii nodes in
> DT for r8a7794 SoC.

iic etc...

> This has no run-time effect for the current driver as the initialisation
> sequence is the same for the SoC-specific binding for r8a7794 and the
> fallback binding for R-Car Gen 2.
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
