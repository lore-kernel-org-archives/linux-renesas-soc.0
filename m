Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f195.google.com ([209.85.220.195]:42747 "EHLO
        mail-qk0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933315AbeBLOUT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 09:20:19 -0500
MIME-Version: 1.0
In-Reply-To: <20171220081238.xcwacfxfxjxoowt6@verge.net.au>
References: <1513699496-27931-1-git-send-email-geert+renesas@glider.be> <20171220081238.xcwacfxfxjxoowt6@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 12 Feb 2018 15:20:17 +0100
Message-ID: <CAMuHMdVe7-xDwEAQU4y66u_Hzm_sY6K5_+LAZQ6bzKzEgt8oLQ@mail.gmail.com>
Subject: Re: [PATCH] dt-bindings: pinctrl: sh-pfc: Correct SoC family name for R8A7778
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        linux-gpio@vger.kernel.org,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Dec 20, 2017 at 9:12 AM, Simon Horman <horms@verge.net.au> wrote:
> On Tue, Dec 19, 2017 at 05:04:56PM +0100, Geert Uytterhoeven wrote:
>> R8A7778 is R-Car (not R-Mobile) M1.
>>
>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
>
> Acked-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, queued in sh-pfc-for-v4.17.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
