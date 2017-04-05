Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f67.google.com ([209.85.214.67]:36361 "EHLO
        mail-it0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751220AbdDEHWg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 5 Apr 2017 03:22:36 -0400
MIME-Version: 1.0
In-Reply-To: <d3c8c307-934e-511d-486f-0d5ced2e54c5@cogentembedded.com>
References: <20170404202025.306556752@cogentembedded.com> <d3c8c307-934e-511d-486f-0d5ced2e54c5@cogentembedded.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 5 Apr 2017 09:22:34 +0200
Message-ID: <CAMuHMdX6-CEL6c8say8VkRkvhXCSBPCTDZzpqRJTbTjeBXpP9w@mail.gmail.com>
Subject: Re: [PATCH] pinctrl: sh-pfc: r8a7794: swap ATA signals
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linus Walleij <linus.walleij@linaro.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Sergei,

On Tue, Apr 4, 2017 at 10:22 PM, Sergei Shtylyov
<sergei.shtylyov@cogentembedded.com> wrote:
> On 04/04/2017 11:20 PM, Sergei Shtylyov wrote:
>> All R8A7794 manuals  I have here (0.50 and 1.10) agree that the PFC driver
>> has ATAG0#  and ATAWR# signals in IPSR12 swapped -- fix this.

Thanks!

>    Oops, ATAWR0#. Do I need to resend?

No, I can handle that.

>> Fixes: 43c4436e2f18 ("pinctrl: sh-pfc: add R8A7794 PFC support")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
