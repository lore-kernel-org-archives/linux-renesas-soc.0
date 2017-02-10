Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ot0-f196.google.com ([74.125.82.196]:34534 "EHLO
        mail-ot0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751724AbdBJQzE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 10 Feb 2017 11:55:04 -0500
Received: by mail-ot0-f196.google.com with SMTP id 73so4400927otj.1
        for <linux-renesas-soc@vger.kernel.org>; Fri, 10 Feb 2017 08:54:03 -0800 (PST)
MIME-Version: 1.0
In-Reply-To: <SG2PR06MB11650D666A5942A0060A85368A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
References: <20170209033044.19513-1-chris.brandt@renesas.com>
 <5d90aff5-63b7-83a8-7529-2ac61ef82021@gmail.com> <SG2PR06MB11650C805DD754EE5C9E56C78A450@SG2PR06MB1165.apcprd06.prod.outlook.com>
 <25202835.AdbHsoUg0y@wuerfel> <SG2PR06MB11650D666A5942A0060A85368A440@SG2PR06MB1165.apcprd06.prod.outlook.com>
From: Arnd Bergmann <arnd@arndb.de>
Date: Fri, 10 Feb 2017 16:53:50 +0100
Message-ID: <CAK8P3a1SNdc+P2hZ6iA5tB7YvL9h0=kJ5-mjQs694TZ34rTc0w@mail.gmail.com>
Subject: Re: [PATCH 1/2] ARM: add ARM_SINGLE_ARMV7 as config option
To: Chris Brandt <Chris.Brandt@renesas.com>
Cc: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Florian Fainelli <f.fainelli@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Russell King <linux@armlinux.org.uk>,
        Simon Horman <horms@verge.net.au>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Feb 10, 2017 at 3:17 PM, Chris Brandt <Chris.Brandt@renesas.com> wrote:
> On Friday, February 10, 2017, Arnd Bergmann wrote:
>> I also couldn't come up with something working when I looked at this, and
>> it wouldn't solve the related problem of platforms that we want to be able
>> to use with or without MMU: You can't make the decision of whether allow
>> an MMU based on the number of platforms since most platform options can
>> only be offered depending on the setting of CONFIG_MMU.
>
>
> How about this idea (from a high level only):
>
> 1. At a top level, you would have 2 options:
>    * "Allow multiple platforms to be selected"
>    * "Single platform Only"
>
> 2. If SINGLE is selected, you still get all the choices that you
>    get with MULTI, except as soon as you click a single ARCH_xx, all
>    other ARCH_yy options are automatically 'unselected' and disappear
>    from the menus. To change your mind, you simply uncheck that box
>    and magically everything re-appears.
>
> 3. The current single platform ARCHs that are currently still sitting
>    at the top level get moved to go sit with everyone else, except
>    they will have "depends on SINGLE" so they will not show up
>    when MULTI is selected.
>
> 4. XIP_KERNEL can only be selected if you have SINGLE selected.
>
> The new restriction is that if you want XIP_KERNEL, you are
> only going to get 1 (and only 1) ARCH_xx.
>
> Of course the only way this is going to happen is by modifying kbuild
> system to create a new 'mode' or something (but let's not get concerned
> with the details until a high level agreement can be made).

You can actually have a 'tristate' choice statement with semantics
close to that, but actually using that here would get rather messy,
as we'd have to move all the per-directory 'menuconfig' statements
back into the top-level choice, and also add logic to detect whether
we use =y or =m.

>> - In some platforms, the decision would have to be done on a per-board
>>   level, as each board can have its memory at a different location
>>   base on which chipselect line got connected to the RAM and NOR flash
>>   respectively
>
> This idea only effects ARCH_xx. You can still select multiple MACH_xx if
> you want after you've selected your ARCH_xx.

Yes, that's my point: we'd have to move some or all of the MACH_xx
options into the top-level list as well, or repeat the same logic within
each platform that may have incompatible boards.

>> - CONFIG_DEBUG_UNCOMPRESS has a very similar requirements to
>>   XIP_KERNEL and !MMU, and we currently allow it for any machine,
>>   with a lot of flexibility in configuring that always breaks
>>   running on any machine other than the one you are targetting.
>
> Since the purpose of this is "debugging" a single platform, could you
> put this under the "depends on SINGLE" category?

It would solve the problem of unusable configurations, but break one
very important use case of DEBUG_LL: you have a problem with a
running kernel and just want to turn on DEBUG_LL without changing
anything else.

       Arnd
