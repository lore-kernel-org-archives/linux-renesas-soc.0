Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qk0-f194.google.com ([209.85.220.194]:35917 "EHLO
        mail-qk0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752859AbcKUQTt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 21 Nov 2016 11:19:49 -0500
Received: by mail-qk0-f194.google.com with SMTP id h201so47930808qke.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 21 Nov 2016 08:19:49 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <CAMuHMdXAuDcbr84phfPRpqZYRzAZf2j4vsv+i_Frz0G8ksd_Vg@mail.gmail.com>
References: <cover.1479387356.git.horms+renesas@verge.net.au>
 <20161119012836.GA2543@localhost> <CAMuHMdXAuDcbr84phfPRpqZYRzAZf2j4vsv+i_Frz0G8ksd_Vg@mail.gmail.com>
From: Olof Johansson <olof@lixom.net>
Date: Mon, 21 Nov 2016 08:19:47 -0800
Message-ID: <CAOesGMjk=KWifGT7sugpWVjNJSKhmgxg8gN9Cgi=emGrg66z0w@mail.gmail.com>
Subject: Re: [GIT PULL] Second Round of Renesas ARM Based SoC Updates for v4.10
To: Geert Uytterhoeven <geert@linux-m68k.org>
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

On Mon, Nov 21, 2016 at 1:31 AM, Geert Uytterhoeven
<geert@linux-m68k.org> wrote:
> Hi Olof,
>
> On Sat, Nov 19, 2016 at 2:28 AM, Olof Johansson <olof@lixom.net> wrote:
>> On Thu, Nov 17, 2016 at 02:34:25PM +0100, Simon Horman wrote:
>>> Please consider these second round of Renesas ARM based SoC updates for v4.10.
>
>>> * Basic support for r8a7745 SoC
>>>
>>> ----------------------------------------------------------------
>>> Sergei Shtylyov (2):
>>>       ARM: shmobile: r8a7745: basic SoC support
>>>       ARM: shmobile: document SK-RZG1E board
>>
>> Hi,
>>
>> Is there a reason you're adding a config option per SoC?
>>
>> I think you'd be better off not adding these config options, and just adding
>> support for the SoCs through compatibles (and adding the drivers to defconfigs,
>> etc).
>
> Yes there is a reason: kernel size.
> The main offenders are the pinctrl tables, which add ca. 20-50 KiB per
> supported SoC.

So don't turn on that pinctrl driver unless you have that SoC?

> Note that RZ/A1 (r7s72100) is used on some boards with its internal RAM
> (10 MiB) only.


-Olof
