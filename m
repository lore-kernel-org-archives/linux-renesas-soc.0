Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from muru.com ([72.249.23.125]:43556 "EHLO muru.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S934079AbdJJUda (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 10 Oct 2017 16:33:30 -0400
Date: Tue, 10 Oct 2017 13:33:25 -0700
From: Tony Lindgren <tony@atomide.com>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Nicolas Pitre <nicolas.pitre@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Arnd Bergmann <arnd@arndb.de>,
        Ard Biesheuvel <ard.biesheuvel@linaro.org>,
        Russell King <linux@armlinux.org.uk>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Chris Brandt <Chris.Brandt@renesas.com>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>, linux-omap@vger.kernel.org
Subject: Re: [PATCH] ARM: head-common.S: Clear lr before jumping to
 start_kernel()
Message-ID: <20171010203324.GX4394@atomide.com>
References: <1507044184-27152-1-git-send-email-geert+renesas@glider.be>
 <nycvar.YSQ.7.76.1710031134140.5407@knanqh.ubzr>
 <CAMuHMdWJKQb5JY+diH=7dqNuypkPUqBeOEPSLOrfrnbfh2siRQ@mail.gmail.com>
 <CAMuHMdXpPfipmEdW0Dap6Pjwhz3QxLcrcbtU0RhCu721k-sBpA@mail.gmail.com>
 <CAMuHMdWH_pebSYAp04gmVceu3qqPczGaXS36R8CtzAYHo-CNog@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWH_pebSYAp04gmVceu3qqPczGaXS36R8CtzAYHo-CNog@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

* Geert Uytterhoeven <geert@linux-m68k.org> [171003 11:32]:
> On Tue, Oct 3, 2017 at 8:15 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> > On Tue, Oct 3, 2017 at 8:11 PM, Geert Uytterhoeven <geert@linux-m68k.org> wrote:
> >> On Tue, Oct 3, 2017 at 5:37 PM, Nicolas Pitre <nicolas.pitre@linaro.org> wrote:
> >>> On Tue, 3 Oct 2017, Geert Uytterhoeven wrote:
> >>> Please send it to RMK's patch system.
> >>
> >> Done (I hope so ;-)
> >
> > Failed. Retrying.
> 
> Yiha ;-)
> 
> http://www.armlinux.org.uk/developer/patches/viewpatch.php?id=8702/1

This also fixes the spamming I started seeing with next-20171009:

Tested-by: Tony Lindgren <tony@atomide.com>
