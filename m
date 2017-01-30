Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:36176 "EHLO
        mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932130AbdA3QIO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Jan 2017 11:08:14 -0500
MIME-Version: 1.0
In-Reply-To: <CACRpkdYzbquN_5eFepT6BhNgfM2FxwrjvYsMRD4o2NN4-O4kfw@mail.gmail.com>
References: <1485367787-8109-1-git-send-email-jacopo+renesas@jmondi.org> <CACRpkdYzbquN_5eFepT6BhNgfM2FxwrjvYsMRD4o2NN4-O4kfw@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 30 Jan 2017 17:08:11 +0100
Message-ID: <CAMuHMdV=MAy5m99za=31k+81kGYmNyXuTPdYu0APcpj0SfCY_A@mail.gmail.com>
Subject: Re: [RFC 0/5] Renesas RZ series pinctrl driver
To: Linus Walleij <linus.walleij@linaro.org>
Cc: Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        ext Tony Lindgren <tony@atomide.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-gpio@vger.kernel.org" <linux-gpio@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Linus,

On Mon, Jan 30, 2017 at 2:51 PM, Linus Walleij <linus.walleij@linaro.org> wrote:
> On Wed, Jan 25, 2017 at 7:09 PM, Jacopo Mondi <jacopo+renesas@jmondi.org> wrote:
>>    after having discussed in great detail the RZ series per-pin PFC hardware
>> peculiarities, this is a proposal for a possible pin-based pin controller
>> driver for SoC devices of Renesas RZ family.
>>
>> This RFC series adds a minimal driver infrastructure which supports pin
>> multiplexing via explicit per-pin settings performed in device tree sources.
>
> I think this is what Laurent had in mind when he said something about
> that he should have taken the per-pin approach from day 1.
>
> I would especially like to see Laurent's review and ACK on this series
> for that reason so we don't create something less than what he is
> expecting for the future of Renesas pin control.

It depends on the actual hardware: while per-pin settings are suitable for
SoCs that have per-pin hardware configuration (e.g. RZ/A1), it's not
suitable for SoCs where that's not the case, and where the hardware has
group-wise configuration (e.g. on R-Car).

Hence IMHO "the future of Renesas pin control" will remain a split
personality for a while ;-)

Laurent: please kick me if you disagree...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
