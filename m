Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:53675 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751128AbdKMMX7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 13 Nov 2017 07:23:59 -0500
MIME-Version: 1.0
In-Reply-To: <20171110181547.933934369@cogentembedded.com>
References: <20171110181547.933934369@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 13 Nov 2017 13:23:58 +0100
Message-ID: <CAMuHMdWZ97RiWBmaf-vkOX=qXjhkqak2QpFTP3weF+4yJT4vew@mail.gmail.com>
Subject: Re: [PATCH 1/2] pinctrl: sh-pfc: add PORT_GP_CFG_{6|22}() helper macros
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Fri, Nov 10, 2017 at 6:59 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> They follow the style of the existing PORT_GP_CFG_<n>() macros and
> will be used by a follow-up  patch for the R8A77970 SoC.
>
> Based on the original (and large) patch by Daisuke Matsushita
> <daisuke.matsushita.ns@hitachi.com>.
>
> Signed-off-by: Vladimir Barinov <vladimir.barinov@cogentembedded.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thanks for your patch!

Soon we will have all 32 sets of macros ;-)

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
I.e. will queue in sh-pfc-for-v4.16.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
