Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it0-f47.google.com ([209.85.214.47]:35986 "EHLO
	mail-it0-f47.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750828AbcEZGzg (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 26 May 2016 02:55:36 -0400
MIME-Version: 1.0
In-Reply-To: <20160526023548.GA20224@verge.net.au>
References: <1462372543-31835-1-git-send-email-geert+renesas@glider.be>
	<20160526023548.GA20224@verge.net.au>
Date: Thu, 26 May 2016 08:55:35 +0200
Message-ID: <CAMuHMdW4Q=OO1zX6_wcN85rs8ZtNqFGnQYEMkriSh1q2L4vJSA@mail.gmail.com>
Subject: Re: [PATCH 0/4] clk: renesas: cpg-mssr: Add support for R-Car M3-W
From: Geert Uytterhoeven <geert@linux-m68k.org>
To: Simon Horman <horms@verge.net.au>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Magnus Damm <damm+renesas@opensource.se>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	linux-clk <linux-clk@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On Thu, May 26, 2016 at 4:35 AM, Simon Horman <horms@verge.net.au> wrote:
> On Wed, May 04, 2016 at 04:35:39PM +0200, Geert Uytterhoeven wrote:
>> This patch series adds initial support for the Clock Pulse Generator and
>> Module Standby and Software Reset modules on the Renesas R-Car M3-W
>> SoC:
>>   - Basic core clocks,
>>   - SCIF2 (console) module clock,
>>   - INTC-AP (GIC) module clock (disabled pending CLK_ENABLE_HAND_OFF).
>>
>> Support for more core and module clocks will be added incrementally.
>
> I am wondering about the status of this patchset vis a vis mainline.
>
> I would like to queue up "[PATCH v3 0/3] arm64: Add Renesas R8A7796 SoC
> support" for v4.8 but I'd prefer to do so only if there is a good chance
> that this patch-set, which is provides run-time dependency, will also be in
> v4.8.

I plan to queue it in clk-renesas-for-v4.8 after the closing of the v4.7 merge
window.

BTW, as there were no comments on the code, but people are obviously using it,
and building on top of it, it would be good to receive some
{Acked,Tested,Reviewed}-by tags.

Thanks!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
