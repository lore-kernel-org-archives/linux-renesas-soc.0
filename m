Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:33361 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751843AbcGODKk (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 14 Jul 2016 23:10:40 -0400
Received: by mail-io0-f194.google.com with SMTP id y195so5584543iod.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 14 Jul 2016 20:10:40 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <8207439.0JmbbpvM5T@wuerfel>
References: <cover.1467900241.git.horms+renesas@verge.net.au> <8207439.0JmbbpvM5T@wuerfel>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 15 Jul 2016 05:10:39 +0200
Message-ID: <CAMuHMdXVEdqMi_J-7ECF58i1n4xF8zQiO99fiOt4OeFGoi_C-Q@mail.gmail.com>
Subject: Re: [GIT PULL v2] Second Round of Renesas ARM64 Based SoC DT Updates
 for v4.8
To: Arnd Bergmann <arnd@arndb.de>
Cc: Simon Horman <horms+renesas@verge.net.au>,
	"arm@kernel.org" <arm@kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	Olof Johansson <olof@lixom.net>,
	Kevin Hilman <khilman@kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	Magnus Damm <magnus.damm@gmail.com>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd,

On Thu, Jul 14, 2016 at 5:54 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> On Thursday, July 7, 2016 4:39:45 PM CEST Simon Horman wrote:
>>       arm64: dts: r8a7796: Add SYSC PM Domains
>
> While doing some sanity checks on our branch contents, I noticed
> that this commit breaks running "make dtbs" on top of our next/dt64
> branch, and I'd like to avoid that.
>
> I found a couple more problems (tegra and meson), and I ended up
> fixing them all up (by merging the dependencies into next/dt64),
> so everything is sorted for 4.8, but it would be good to do a
> 'make dtbs' run on a branch that has dt changes before you send it,
> and I'll try to do the same when pulling it to avoid the problem in
> the future.

Oh right, it can't find <dt-bindings/power/r8a7796-sysc.h>.
I guess this didn't  show up for us, as arm64 defconfig in
renesas-arm64-dt2-for-v4.8 doesn't enable CONFIG_ARCH_R8A7796 yet.

Sorry for that.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
