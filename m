Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35235 "EHLO
	mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752899AbcHQUes (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 17 Aug 2016 16:34:48 -0400
MIME-Version: 1.0
In-Reply-To: <20160817190804.GA11930@tetsubishi>
References: <1459525479-20842-1-git-send-email-wsa@the-dreams.de>
 <1459525479-20842-4-git-send-email-wsa@the-dreams.de> <CAMuHMdVyNsm+hpoJfjxLkKt_5zydx9csgPB0zqCdtPMipqmFFQ@mail.gmail.com>
 <20160817190804.GA11930@tetsubishi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Wed, 17 Aug 2016 22:17:58 +0200
Message-ID: <CAMuHMdV31WewDgV8c6gGdssSvXO4sX2hCcV3w6SMxD-eyUc9Cw@mail.gmail.com>
Subject: Re: [PATCH v2 3/9] mmc: tmio: Add UHS-I mode support
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Ulf Hansson <ulf.hansson@linaro.org>,
	Ben Hutchings <ben.hutchings@codethink.co.uk>,
	Simon Horman <horms@verge.net.au>,
	Linux MMC List <linux-mmc@vger.kernel.org>,
	Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On Wed, Aug 17, 2016 at 9:08 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>>     [<c02f9d04>] (__mmc_start_request) from [<c02f9fa0>]
>> (mmc_start_request+0x104/0x118)
>
> This function calls card_busy only for SDIO cards. I assume you don't
> have one inserted? Maybe the "broken-cd" property doesn't work correctly

No, nothing is inserted.

> and causes side-effects? This would explain why it only affects SDHI1
> and not SDHI0.

I'll try to remove it. Note that sh73a0-kzm9g.dts also uses broken-cd,
without ill effects.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
