Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f172.google.com ([209.85.128.172]:55018 "EHLO
        mail-wr0-f172.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750967AbdJFLYK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Oct 2017 07:24:10 -0400
MIME-Version: 1.0
In-Reply-To: <20171006103704.13708-1-wsa+renesas@sang-engineering.com>
References: <20171006103704.13708-1-wsa+renesas@sang-engineering.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 6 Oct 2017 13:24:08 +0200
Message-ID: <CAMuHMdV2x00e275zFNM-H-gGrK1u4fzZpO6=cwDQKpGZZi=8Xw@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7795: Add HSCIF pins, groups, and functions
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Fri, Oct 6, 2017 at 12:37 PM, Wolfram Sang
<wsa+renesas@sang-engineering.com> wrote:
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
>
> Tested on a Salvator-XS with HSCIF1 mapped to debug1 connector with this
> snipplet in salvator-common.dtsi:

Thanks for your patch (and for testing ;-)!

> I verified to the best of my knowledge that all the other settings are equal to
> r8a7795-es1.

Unfortunately you missed that ES2.0 has a third set of pins for HSCIF2.
Can you please add these, too?
The rest looks fine to me.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
