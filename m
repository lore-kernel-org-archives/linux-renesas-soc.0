Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f194.google.com ([209.85.223.194]:35447 "EHLO
	mail-io0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751339AbcFJHyY (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 10 Jun 2016 03:54:24 -0400
MIME-Version: 1.0
In-Reply-To: <6849015.bJCuAeaMgZ@avalon>
References: <1464808880-343-1-git-send-email-geert+renesas@glider.be>
 <1464808880-343-3-git-send-email-geert+renesas@glider.be> <6849015.bJCuAeaMgZ@avalon>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Fri, 10 Jun 2016 09:54:22 +0200
Message-ID: <CAMuHMdUX+DqPyo4cTJnNyinc2zgB-0CtUBmyjQjFEKWmV_Y-Fg@mail.gmail.com>
Subject: Re: [PATCH/RFC v3 02/22] soc: renesas: Add R-Car RST driver
To: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@codeaurora.org>,
	Dirk Behme <dirk.behme@de.bosch.com>,
	linux-renesas-soc@vger.kernel.org,
	"linux-arm-kernel@lists.infradead.org"
	<linux-arm-kernel@lists.infradead.org>,
	"devicetree@vger.kernel.org" <devicetree@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Laurent,

On Thu, Jun 2, 2016 at 11:58 PM, Laurent Pinchart
<laurent.pinchart@ideasonboard.com> wrote:
>> --- /dev/null
>> +++ b/drivers/soc/renesas/rcar-rst.c

>> +static int __init rcar_rst_init(void)
>> +{

[...]

>> +}
>> +arch_initcall(rcar_rst_init);
>
> Given that rcar_rst_init() is only used as a support function for
> rcar_rst_read_mode_pins(), how about removing the initcall ?

Thanks, good idea!

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
