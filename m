Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:37881 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751175AbcJZL4a (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 26 Oct 2016 07:56:30 -0400
MIME-Version: 1.0
In-Reply-To: <1477064730.2508.24.camel@pengutronix.de>
References: <1477055857-17936-1-git-send-email-geert+renesas@glider.be> <1477064730.2508.24.camel@pengutronix.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 26 Oct 2016 13:56:29 +0200
Message-ID: <CAMuHMdUsuoLni1FUwCPXM2WrGpwKVR4UA85zujpbcwmdPMXpdg@mail.gmail.com>
Subject: Re: [PATCH v4 00/23] soc: renesas: Add R-Car RST driver for obtaining
 mode pin state
To: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Philip,

On Fri, Oct 21, 2016 at 5:45 PM, Philipp Zabel <p.zabel@pengutronix.de> wrote:
> Am Freitag, den 21.10.2016, 15:17 +0200 schrieb Geert Uytterhoeven:
>>         Hi Philipp, Mike, Stephen, Simon, Magnus,
>>       (see questions *** below!)
>>
>> Currently the R-Car Clock Pulse Generator (CPG) drivers obtains the
>> state of the mode pins either by a call from the platform code, or
>> directly by using a hardcoded register access. This is a bit messy, and
>> creates a dependency between driver and platform code.
>>
>> This patch series converts the various Renesas R-Car clock drivers
>> and support code from reading the mode pin states using a hardcoded
>> register access to using a new minimalistic R-Car RST driver.

[...]

>>   - Philip: While this is a driver for a reset-controller, currently it
>>     doesn't provide any reset-controller functionality. Hence I added it
>>     to drivers/soc/renesas/. Is that OK for you?
>
> Absolutely, as long as the driver isn't even a reset controller
> provider, this is the right place.

Thank you!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
