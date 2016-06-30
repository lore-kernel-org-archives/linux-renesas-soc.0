Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33290 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751424AbcF3NJs (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 30 Jun 2016 09:09:48 -0400
MIME-Version: 1.0
In-Reply-To: <20160630122529.4031024-1-arnd@arndb.de>
References: <20160630122529.4031024-1-arnd@arndb.de>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Thu, 30 Jun 2016 15:09:46 +0200
Message-ID: <CAMuHMdWJOVs_pzDHWVHN8=mguUPETbq2m8LAG_N6mUFk+UA_og@mail.gmail.com>
Subject: Re: [PATCH] ARM: shmobile: don't call platform_can_secondary_boot on UP
To: Arnd Bergmann <arnd@arndb.de>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Arnd,

On Thu, Jun 30, 2016 at 2:25 PM, Arnd Bergmann <arnd@arndb.de> wrote:
> For rcar-gen2, we build the SMP files even for UP configurations,
> and that just broke:
>
> arch/arm/mach-shmobile/built-in.o: In function `shmobile_smp_init_fallback_ops':
> pm-rcar-gen2.c:(.init.text+0x40c): undefined reference to `platform_can_secondary_boot'
>
> This adds an compile-time check before the call to platform_can_secondary_boot,
> turning the function into an empty stub for UP configurations.
>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> Fixes: c21af444eace ("ARM: shmobile: smp: Add function to prioritize DT SMP")

Crap, I think I took the shortcut of only compile-testing
arch/arm/mach-shmobile,
not link-testing the whole kernel, with CONFIG_SMP=n...

Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
