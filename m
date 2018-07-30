Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ua0-f194.google.com ([209.85.217.194]:45244 "EHLO
        mail-ua0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726344AbeG3JmV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jul 2018 05:42:21 -0400
MIME-Version: 1.0
References: <20180727165333.60598-1-chris.brandt@renesas.com> <20180727165333.60598-2-chris.brandt@renesas.com>
In-Reply-To: <20180727165333.60598-2-chris.brandt@renesas.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jul 2018 10:08:21 +0200
Message-ID: <CAMuHMdX4rwD-46u006EVy+3G0EhgJ0MtN=DzeOi0r29bu90F2A@mail.gmail.com>
Subject: Re: [PATCH v3 1/2] soc: renesas: identify RZ/A2
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 27, 2018 at 6:53 PM Chris Brandt <chris.brandt@renesas.com> wrote:
> Add support for identifying the RZ/A2M (R7S9210) SoC.

+ correct the original RZ/A SoC family name to RZ/A1?

> Also add support for reading the BSID register which is a different format
> than the PRR.
>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
> * Remove 'hard coded' section because there will not be andy non-DT
>   legacy support needed
> * Make displaying the chip revision more flexible for the future case
>   when the revision number from the BSID will be displayed

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
