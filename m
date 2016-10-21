Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:35350 "EHLO
        mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753374AbcJUQmq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Oct 2016 12:42:46 -0400
Received: by mail-lf0-f46.google.com with SMTP id l131so144717888lfl.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 21 Oct 2016 09:42:45 -0700 (PDT)
Subject: Re: [PATCH] clk: fix link error for rcar-gen2
To: Arnd Bergmann <arnd@arndb.de>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Michael Turquette <mturquette@baylibre.com>,
        Stephen Boyd <sboyd@codeaurora.org>
References: <20161021154737.3803065-1-arnd@arndb.de>
Cc: Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Magnus Damm <damm+renesas@opensource.se>,
        Simon Horman <horms+renesas@verge.net.au>,
        linux-renesas-soc@vger.kernel.org, linux-clk@vger.kernel.org,
        linux-kernel@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9f16dc0d-fe5e-dff8-e461-9e0dfdd23da7@cogentembedded.com>
Date: Fri, 21 Oct 2016 19:42:42 +0300
MIME-Version: 1.0
In-Reply-To: <20161021154737.3803065-1-arnd@arndb.de>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 10/21/2016 06:47 PM, Arnd Bergmann wrote:

> The addition of one more rcar-gen2 based SoC caused a build error (again)
> in my randconfig builds:
>
> arch/arm/mach-shmobile/setup-rcar-gen2.o: In function `rcar_gen2_timer_init':
> setup-rcar-gen2.c:(.init.text+0x200): undefined reference to `rcar_gen2_clocks_init'

    OK, seeing how you got this -- I should have tested the kernel build with 
only R8A7743 enabled... sorry about that. :-<
    I probably shouldn't have used rcar_gen2_timer_init() in the 1st place...

> I think this has happened twice in the past. Instead of adding each SoC
> one at a time, this changes the existing list to always build the
> rcar-gen2 related clk files whenever the generic symbol is selected.

    The problem is we're not going to use this driver on RZ/G SoCs... The 
newer rcar2-cpg-mssr.c will be used instead -- I submitted the patches for 
that before ELC-E...

> Fixes: 1254f607fc3d ("ARM: shmobile: r8a7743: basic SoC support")
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
[...]

MBR, Sergei
