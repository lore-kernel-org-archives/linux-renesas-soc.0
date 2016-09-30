Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f53.google.com ([209.85.214.53]:37735 "EHLO
        mail-it0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751827AbcI3HJv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 30 Sep 2016 03:09:51 -0400
Received: by mail-it0-f53.google.com with SMTP id j69so28894900itb.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 30 Sep 2016 00:09:51 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <CANqRtoRf23PQ+HEDEHtkHwoQb325T3ibLztzwAZ81FddoZ=r-Q@mail.gmail.com>
References: <1471877069-4157-1-git-send-email-geert+renesas@glider.be>
 <CAMuHMdUfV46Y_L2yformTPcnGKpbfFawNOrutyeMk5L4rL5BfA@mail.gmail.com> <CANqRtoRf23PQ+HEDEHtkHwoQb325T3ibLztzwAZ81FddoZ=r-Q@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 30 Sep 2016 09:09:49 +0200
Message-ID: <CAMuHMdWBQcvOaFNCpt8DFHbT1uTkr6Li_seTmnVese_HPKsREA@mail.gmail.com>
Subject: Re: [PATCH/RFT 0/4] ARM: shmobile: R-Car Gen2: Allow booting
 secondary CPU cores in debug mode
To: Magnus Damm <magnus.damm@gmail.com>
Cc: Simon Horman <horms@verge.net.au>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Hiep Cao Minh <cm-hiep@jinso.co.jp>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Magnus,

On Fri, Sep 30, 2016 at 9:04 AM, Magnus Damm <magnus.damm@gmail.com> wrote:
> On Tue, Sep 27, 2016 at 9:37 PM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Mon, Aug 22, 2016 at 4:44 PM, Geert Uytterhoeven
>> <geert+renesas@glider.be> wrote:
>>> This patch series is an attempt to allow booting secondary CPU cores on
>>> R-Car Gen2 when hardware debug mode is enabled. In this mode, reset
>>> requests derived from power-shutoff to the AP-system CPU cores must be
>>> enabled before the AP-system cores first resume from power-shutoff. Else
>>> resume may fail, causing the system to hang during boot. Currently we
>>> avoid the hang by prohibiting booting secondary CPU cores when hardware
>>> debug mode is enabled.
>>>
>>> On all R-Car Gen2 SoCs, hardware debug mode is enabled by setting
>>> MD21=1.  On both Koelsch and Lager, this is done by setting mode switch
>>> SW8-4 to OFF.
>>>
>>> Unfortunately the hang is not easy to reproduce: I only saw it (on
>>> Koelsch) during real cold boot (power off during the night), and even
>>> then it's not guaranteed to trigger. Pressing the reset button
>>> afterwards recovers the system, and a subsequent boot will succeed
>>> (incl. secondary CPU core boot).
>>>
>>> This series configures the reset requests as documented in the R-Car
>>> Gen2 datasheet, and removes the check for MD21 during secondary CPU
>>> bringup.  It was inspired by CPU-specific patches in the BSP by
>>> Nakamura-san.
>>>
>>> This series has been boot-tested on r8a7791/koelsch (both debug mode and
>>> normal mode), on r8a7790/lager and r8a7793/gose (normal mode only), and
>>> on r8a7794/alt (normal mode UP only).
>>
>> Any comments?
>> Any objection to applying this series?
>>
>> I've been running my Koelsch with MD21=1 since I posted this series,
>> and it has been included in renesas-drivers since the beginning of September.
>>
>> My main motivation to push this is that it removes two more users of
>> rcar_gen2_read_mode_pins(). After this, the only remaining user is the
>> clock driver, invoked from rcar_gen2_timer_init().
>
> I have no objections, but I'm curious if the series received enough
> testing (with debug mode enabled) on earlier R-Car Gen2 platforms like
> r8a7790/lager?

Let's see what Hiep has to say, who tests Lager with both debug mode
enabled and disabled...

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
