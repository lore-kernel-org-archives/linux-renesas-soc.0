Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36330 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751158AbcHHKca (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 8 Aug 2016 06:32:30 -0400
MIME-Version: 1.0
In-Reply-To: <d3951fc0-589d-9128-cd68-371dd526ac38@cogentembedded.com>
References: <1501145.5ro9yfox2Z@wasted.cogentembedded.com> <3787651.qWyGt9oMl5@wasted.cogentembedded.com>
 <CACRpkdbPsu=uhHW7N0GS1evMkbYUrA+465Ou5m0R-kOoDUtQ0w@mail.gmail.com> <d3951fc0-589d-9128-cd68-371dd526ac38@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 8 Aug 2016 12:32:29 +0200
Message-ID: <CAMuHMdXq-rrr+5kx39ZMjaSO9fZXYMZM2Vf+0-zYb5=7BF_NCQ@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7792: add missing pinmux data
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Geert Uytterhoeven <geert+renesas@glider.be>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	"linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Thu, Aug 4, 2016 at 3:39 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 08/04/2016 11:04 AM, Linus Walleij wrote:
>
>>> The patch I've based my R8A7792 PFC work on had some VIN pinmux data
>>> missing
>>> and I  just  noticed that while adding the VIN pin groups...
>>>
>>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Thank you!

>> This looks like a fix that should go in ASAP?
>
>    It would be enough if it gets queued before the patch adding VIN pin
> groups.

As the original "pinctrl: sh-pfc: Add R8A7792 PFC support" isn't in the
pinctrl tree yet, I'll fold your fix into that one.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
