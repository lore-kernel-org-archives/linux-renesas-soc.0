Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:41876 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754459AbeGIM6o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 9 Jul 2018 08:58:44 -0400
Date: Mon, 9 Jul 2018 14:58:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH] ARM: shmobile: r8a7779: hide unused
 r8a7779_platform_cpu_kill
Message-ID: <20180709125839.havdrfvk4hs4h76v@verge.net.au>
References: <20180706151528.3759312-1-arnd@arndb.de>
 <CAMuHMdXhN_Mw-Z+71LetjX2mJar-F4m3_-FjqouHgvjqtMq4OA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdXhN_Mw-Z+71LetjX2mJar-F4m3_-FjqouHgvjqtMq4OA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 06, 2018 at 05:26:40PM +0200, Geert Uytterhoeven wrote:
> Hi Arnd,
> 
> On Fri, Jul 6, 2018 at 5:15 PM Arnd Bergmann <arnd@arndb.de> wrote:
> > After the cleanup in r8a7779_smp_prepare_cpus(), the only remaining caller of
> > r8a7779_platform_cpu_kill() is in an ifdef, which leads to a build warning
> > without CONFIG_HOTPLUG_CPU:
> >
> > arch/arm/mach-shmobile/smp-r8a7779.c:26:12: error: 'r8a7779_platform_cpu_kill' defined but not used [-Werror=unused-function]
> >
> > This moves the function inside of that #ifdef to avoid the warning.
> >
> > Fixes: 62f55ce683e3 ("ARM: shmobile: r8a7779: Stop powering down secondary CPUs during early boot")
> > Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> 
> Thanks, seems like I only built the R-Car Gen2 code without
> CONFIG_HOTPLUG_CPU...
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
