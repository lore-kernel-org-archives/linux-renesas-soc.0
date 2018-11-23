Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f67.google.com ([209.85.217.67]:38384 "EHLO
        mail-vs1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387711AbeKWUGf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 15:06:35 -0500
MIME-Version: 1.0
References: <20181121120928.25179-1-horms+renesas@verge.net.au> <20181121120928.25179-2-horms+renesas@verge.net.au>
In-Reply-To: <20181121120928.25179-2-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Nov 2018 10:22:57 +0100
Message-ID: <CAMuHMdVzjJH3cmvYT1DtY5Woj4f0-9po97paaZLYrXE2dLBxvw@mail.gmail.com>
Subject: Re: [PATCH 1/2] i2c: sh_mobile: document support for r8a77990 (R-Car E3)
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 21, 2018 at 1:11 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Document support for the IIC code for the r8a77990 (R-Car E3).
>
> It is not considered compatible with existing fallback bindings
> due to the documented absence of automatic transmission registers.
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
