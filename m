Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:59416 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1751348AbeCPWzK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Mar 2018 18:55:10 -0400
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8BIT
To: Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
From: Stephen Boyd <sboyd@kernel.org>
In-Reply-To: <20180216152807.1629038-1-arnd@arndb.de>
Cc: Arnd Bergmann <arnd@arndb.de>, stable@vger.kernel.org,
        Andi Kleen <ak@linux.intel.com>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
References: <20180216152807.1629038-1-arnd@arndb.de>
Message-ID: <152124090910.242365.9614136166072414865@swboyd.mtv.corp.google.com>
Subject: Re: [PATCH] clk: fix false-positive Wmaybe-uninitialized warning
Date: Fri, 16 Mar 2018 15:55:09 -0700
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Quoting Arnd Bergmann (2018-02-16 07:27:47)
> When we build this driver with on x86-32, gcc produces a false-positive warning:
> 
> drivers/clk/renesas/clk-sh73a0.c: In function 'sh73a0_cpg_clocks_init':
> drivers/clk/renesas/clk-sh73a0.c:155:10: error: 'parent_name' may be used uninitialized in this function [-Werror=maybe-uninitialized]
>    return clk_register_fixed_factor(NULL, name, parent_name, 0,
> 
> We can work around that warning by adding a fake initialization, I tried
> and failed to come up with any better workaround. This is currently one
> of few remaining warnings for a 4.14.y randconfig build, so it would be
> good to also have it backported at least to that version. Older versions
> have more randconfig warnings, so we might not care.
> 
> I had not noticed this earlier, because one patch in my randconfig test
> tree removes the '-ffreestanding' option on x86-32, and that avoids
> the warning. The -ffreestanding flag was originally global but moved
> into arch/i386 by Andi Kleen in commit 6edfba1b33c7 ("[PATCH] x86_64:
> Don't define string functions to builtin") as a 'temporary workaround'.
> 
> Like many temporary hacks, this turned out to be rather long-lived, from
> all I can tell we still need a simple fix to asm/string_32.h before it
> can be removed, but I'm not sure about how to best do that.
> 
> Cc: stable@vger.kernel.org
> Cc: Andi Kleen <ak@linux.intel.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---

Applied to clk-next
