Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f65.google.com ([209.85.214.65]:33525 "EHLO
        mail-it0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751264AbcKUJbB (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 04:31:01 -0500
Received: by mail-it0-f65.google.com with SMTP id c20so14347278itb.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2016 01:31:01 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <20161119012836.GA2543@localhost>
References: <cover.1479387356.git.horms+renesas@verge.net.au> <20161119012836.GA2543@localhost>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Mon, 21 Nov 2016 10:31:00 +0100
Message-ID: <CAMuHMdXAuDcbr84phfPRpqZYRzAZf2j4vsv+i_Frz0G8ksd_Vg@mail.gmail.com>
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

On Sat, Nov 19, 2016 at 2:28 AM, Olof Johansson <olof@lixom.net> wrote:
> On Thu, Nov 17, 2016 at 02:34:25PM +0100, Simon Horman wrote:
>> Please consider these second round of Renesas ARM based SoC updates for v4.10.

>> * Basic support for r8a7745 SoC
>>
>> ----------------------------------------------------------------
>> Sergei Shtylyov (2):
>>       ARM: shmobile: r8a7745: basic SoC support
>>       ARM: shmobile: document SK-RZG1E board
>
> Hi,
>
> Is there a reason you're adding a config option per SoC?
>
> I think you'd be better off not adding these config options, and just adding
> support for the SoCs through compatibles (and adding the drivers to defconfigs,
> etc).

Yes there is a reason: kernel size.
The main offenders are the pinctrl tables, which add ca. 20-50 KiB per
supported SoC.

Note that RZ/A1 (r7s72100) is used on some boards with its internal RAM
(10 MiB) only.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
