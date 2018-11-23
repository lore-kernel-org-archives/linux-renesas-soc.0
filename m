Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-vs1-f68.google.com ([209.85.217.68]:40356 "EHLO
        mail-vs1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2408874AbeKWUFv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 23 Nov 2018 15:05:51 -0500
MIME-Version: 1.0
References: <20181121120928.25179-1-horms+renesas@verge.net.au> <20181121120928.25179-3-horms+renesas@verge.net.au>
In-Reply-To: <20181121120928.25179-3-horms+renesas@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 23 Nov 2018 10:22:14 +0100
Message-ID: <CAMuHMdVS518Kt=-_TBuwAmokhOcJBzYD7VmNTd1tbEW4MvNeqw@mail.gmail.com>
Subject: Re: [PATCH 2/2] i2c: sh_mobile: add support for r8a77990 (R-Car E3)
To: Simon Horman <horms+renesas@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux I2C <linux-i2c@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Nov 21, 2018 at 1:11 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> Add support for the IIC code for the r8a77990 (R-Car E3).
>
> It is not considered compatible with existing fallback bindings
> due to the documented absence of automatic transmission registers.
>
> These registers are currently not used by the driver and
> thus the provides the same behaviour for "renesas,iic-r8a77990" and
> "renesas,rcar-gen3-iic". The point of declaring incompatibility is
> to allow for automatic transmission register support to be added to
> "renesas,iic-r8a77990" and "renesas,rcar-gen3-iic" in future.
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
