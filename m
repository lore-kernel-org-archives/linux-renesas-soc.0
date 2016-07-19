Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f66.google.com ([209.85.214.66]:33352 "EHLO
	mail-it0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753319AbcGSMCy (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 19 Jul 2016 08:02:54 -0400
Received: by mail-it0-f66.google.com with SMTP id d65so1263891ith.0
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Jul 2016 05:02:54 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <20160719115703.GJ1041@n2100.armlinux.org.uk>
References: <20160719115703.GJ1041@n2100.armlinux.org.uk>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 19 Jul 2016 14:02:53 +0200
Message-ID: <CAMuHMdWfqbv4MXuThRPL2hsdN4Hq53Ng=1cp8DBB7o7XGzM9Zw@mail.gmail.com>
Subject: Re: [PATCH] Fix shmobile build with CONFIG_SMP=n
To: Russell King - ARM Linux <linux@armlinux.org.uk>
Cc: Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	"arm@kernel.org" <arm@kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Russell,

On Tue, Jul 19, 2016 at 1:57 PM, Russell King - ARM Linux
<linux@armlinux.org.uk> wrote:
> Shmobile currently fails to build when CONFIG_SMP is disabled:
>
> arch/arm/mach-shmobile/built-in.o: In function `shmobile_smp_init_fallback_ops':
> pm-rcar-gen2.c:(.init.text+0x744): undefined reference to `platform_can_secondary_boot'
> make[1]: *** [vmlinux] Error 1
>
> Fix this by providing a stub for this function.
>
> Signed-off-by: Russell King <rmk+kernel@armlinux.org.uk>

Arnd send a smaller one https://patchwork.kernel.org/patch/9207413/,
which seems have fallen through the cracks.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
