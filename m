Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg0-f67.google.com ([74.125.83.67]:34012 "EHLO
        mail-pg0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750857AbdHQJre (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 Aug 2017 05:47:34 -0400
MIME-Version: 1.0
In-Reply-To: <20170727151622.GG16143@verge.net.au>
References: <1500555277-22921-1-git-send-email-geert+renesas@glider.be> <20170727151622.GG16143@verge.net.au>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 17 Aug 2017 11:47:33 +0200
Message-ID: <CAMuHMdXLVXaN+X0yKuO+xdZGi3MwM4vSP1uTLuS9SKFKg_UBDA@mail.gmail.com>
Subject: Re: [PATCH 0/4] arm64: dts: renesas: Add Support for R-Car D3 and Draak
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, Jul 27, 2017 at 5:16 PM, Simon Horman <horms@verge.net.au> wrote:
> On Thu, Jul 20, 2017 at 02:54:33PM +0200, Geert Uytterhoeven wrote:
>> This patch series adds minimal support for the R-Car D3 SoC and the
>> Draak development board, allowing to boot from a ramdisk using a serial
>> console.
>>
>>   - The first two patches add DT sources for R-Car D3 and Draak.
>>     Due to the use of hardcoded constants, they have no further (build)
>>     dependencies (obviously there is a runtime dependency).
>>   - The last two patches replace the hardcoded constants by symbols from
>>     DT binding headers, and thus depend on those headers.  Hence it
>>     should be postponed to v4.15.

> So I have applied the first two patches for v4.14.

Thank you!

> Please repost the remaining two after v4.13-rc6 at which time I should
> be able to queue them up for v4.15.

You mean after v4.14-rc1? Else you still won't have them in renesas-devel.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
