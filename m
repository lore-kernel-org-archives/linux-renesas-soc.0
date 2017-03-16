Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:32887 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751384AbdCPMt3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Mar 2017 08:49:29 -0400
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWNYqNxcBHTNiTyDe3ZED0L07z4AhRiOcfNBj4QiMJ9Ag@mail.gmail.com>
References: <1489423302-21296-1-git-send-email-geert+renesas@glider.be>
 <1489423302-21296-2-git-send-email-geert+renesas@glider.be>
 <e5214bac-7bf9-1897-cf9f-f4735e6985e9@cogentembedded.com> <CAMuHMdWNYqNxcBHTNiTyDe3ZED0L07z4AhRiOcfNBj4QiMJ9Ag@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 16 Mar 2017 13:49:26 +0100
Message-ID: <CAMuHMdX2XQDog5GtM+QrJ-zKf82Tmtj1JNfiDT5mg7MgLR0m=g@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: r8a7795: Fix hscif2_clk_b and hscif4_ctrl
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Mar 16, 2017 at 1:49 PM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hei Sergey,

"Hi Sergei", of course.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
