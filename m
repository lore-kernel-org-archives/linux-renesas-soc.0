Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f68.google.com ([209.85.214.68]:33636 "EHLO
        mail-it0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753324AbcKVJ4N (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 22 Nov 2016 04:56:13 -0500
Received: by mail-it0-f68.google.com with SMTP id c20so1120344itb.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 22 Nov 2016 01:56:13 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAOesGMj47EZ1Zjc41VV2D-cM5XUsK28PDF-jSHKUkkind32ZRA@mail.gmail.com>
References: <cover.1479387356.git.horms+renesas@verge.net.au>
 <20161119012836.GA2543@localhost> <CAMuHMdXAuDcbr84phfPRpqZYRzAZf2j4vsv+i_Frz0G8ksd_Vg@mail.gmail.com>
 <CAOesGMjk=KWifGT7sugpWVjNJSKhmgxg8gN9Cgi=emGrg66z0w@mail.gmail.com>
 <CAMuHMdUhpeiOj6Mjhgt=9R3yuV-HwOAy5AAsDSTDjagRRDtYCw@mail.gmail.com> <CAOesGMj47EZ1Zjc41VV2D-cM5XUsK28PDF-jSHKUkkind32ZRA@mail.gmail.com>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 22 Nov 2016 10:56:11 +0100
Message-ID: <CAMuHMdUtu9N28rOb+813DumtbyAZJB3G+euD0mwwXD_jCiXrRg@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Updates for v4.10
To: Olof Johansson <olof@lixom.net>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        "arm@kernel.org" <arm@kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Arnd Bergmann <arnd@arndb.de>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Olof,

On Mon, Nov 21, 2016 at 5:35 PM, Olof Johansson <olof@lixom.net> wrote:
> On Mon, Nov 21, 2016 at 8:27 AM, Geert Uytterhoeven
> <geert@linux-m68k.org> wrote:
>> On Mon, Nov 21, 2016 at 5:19 PM, Olof Johansson <olof@lixom.net> wrote:
>>> On Mon, Nov 21, 2016 at 1:31 AM, Geert Uytterhoeven
>>> <geert@linux-m68k.org> wrote:
>>>> On Sat, Nov 19, 2016 at 2:28 AM, Olof Johansson <olof@lixom.net> wrote:
>>>>> On Thu, Nov 17, 2016 at 02:34:25PM +0100, Simon Horman wrote:
>>>>>> Please consider these second round of Renesas ARM based SoC updates for v4.10.
>>>>
>>>>>> * Basic support for r8a7745 SoC
>>>>>>
>>>>>> ----------------------------------------------------------------
>>>>>> Sergei Shtylyov (2):
>>>>>>       ARM: shmobile: r8a7745: basic SoC support
>>>>>>       ARM: shmobile: document SK-RZG1E board
>>>>>
>>>>> Is there a reason you're adding a config option per SoC?
>>>>>
>>>>> I think you'd be better off not adding these config options, and just adding
>>>>> support for the SoCs through compatibles (and adding the drivers to defconfigs,
>>>>> etc).
>>>>
>>>> Yes there is a reason: kernel size.
>>>> The main offenders are the pinctrl tables, which add ca. 20-50 KiB per
>>>> supported SoC.
>>>
>>> So don't turn on that pinctrl driver unless you have that SoC?
>>
>> The enablement of the pinctrl driver (and the clock driver, FWIW) is controlled
>> by the SoC Kconfig symbol. If you want support for the SoC, you want the
>> pinctrl driver, too.
>
> Oh, that's trivial to fix! Do as almost all other SoCs do, and don't
> use silent options.

What does that gain us? The ability to enable support for an SoC, without
enabling the accompanying pinctrl driver, leading to a non-booting system?

As soon as you have any pinctrl properties in the DT, you need the pinctrl
driver. Unless you disable CONFIG_PINCTRL (it's selected, and not
user-controlled), and rely on fragile reset state/boot loader.

Pinctrl (and clock and irqchip) on-SoC drivers are special: if you fail to
include them, the system won't boot.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
