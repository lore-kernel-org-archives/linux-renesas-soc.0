Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ig0-f195.google.com ([209.85.213.195]:34201 "EHLO
	mail-ig0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752226AbcDZIck (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 04:32:40 -0400
Received: by mail-ig0-f195.google.com with SMTP id qu10so1286047igc.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 26 Apr 2016 01:32:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <7781705.p6jrBl2RnJ@wuerfel>
References: <cover.1461558315.git.horms+renesas@verge.net.au>
	<4737327.YB9LJZXs32@wuerfel>
	<CAMuHMdV_DN4YEzP1urC9LmKga6rkstGNDv20i96qnb=kS1+skw@mail.gmail.com>
	<7781705.p6jrBl2RnJ@wuerfel>
Date: Tue, 26 Apr 2016 10:32:39 +0200
Message-ID: <CAMuHMdWmGKa16BOoF=MJab5V_Ceb1yAbAf2yjFV7sSHxG6=GOQ@mail.gmail.com>
Subject: Re: [GIT PULL v2] Renesas ARM Based SoC DT Updates for v4.7
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Arnd Bergmann <arnd@arndb.de>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	"arm@kernel.org" <arm@kernel.org>,
	linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@linaro.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd,

On Tue, Apr 26, 2016 at 10:12 AM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Tuesday 26 April 2016 09:30:45 Geert Uytterhoeven wrote:
>> Commit 93fafa81cad3da9c ("Merge branches 'next/dt' and 'next/dt64' into
>> for-next") accidentally re-added the line
>>
>>         clock-output-names = "can_clk";
>>
>> to arch/arm/boot/dts/r8a7791.dtsi, which was removed in commit
>> f617604fe5d74b9c ("ARM: dts: r8a7791: Remove unnecessary
>> clock-output-names properties") before.  It seems the same wrong
>> conflict resolution was made before in commit ef3b08c6c0d85753 ("Merge
>> branch 'fixes' into for-next").
>>
>> While this won't cause failures, can you please remove the offending
>> line?
>
> I've merged renesas-fixes-for-v4.6 into next/dt now to resolve
> the conflict there, otherwise Linus would have to do the same resolution
> during the merge window.
>
> Thanks for letting us know. If you want to verify my new resolution,
> please look at next/dt, which is the more important branch.

Thanks, but unfortunately your new merge resolution is incorrect, as it revived
the line

        status = "disabled";

for the pcie_bus node.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
