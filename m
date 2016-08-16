Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f195.google.com ([209.85.223.195]:33680 "EHLO
	mail-io0-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S932518AbcHPUVM (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 16 Aug 2016 16:21:12 -0400
MIME-Version: 1.0
In-Reply-To: <20160816195514.GA3998@tetsubishi>
References: <1459525479-20842-1-git-send-email-wsa@the-dreams.de>
 <1459525479-20842-4-git-send-email-wsa@the-dreams.de> <CAMuHMdVyNsm+hpoJfjxLkKt_5zydx9csgPB0zqCdtPMipqmFFQ@mail.gmail.com>
 <20160816195514.GA3998@tetsubishi>
From: Geert Uytterhoeven <geert@linux-m68k.org>
Date: Tue, 16 Aug 2016 22:21:10 +0200
Message-ID: <CAMuHMdXCH+2a1rttULc_=_DXM6GTHOk70owAuQpRAwoWVjX80A@mail.gmail.com>
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

On Tue, Aug 16, 2016 at 9:55 PM, Wolfram Sang <wsa@the-dreams.de> wrote:
>> The first SDHI channel (ee100000.sd) doesn't seem to be affected
>> by the problem.
>
> Hmm, I sadly don't have any docs about 73a4 and/or its SDHI variants.
> I'll ask around.

Forgot to add: I don't see the issue on sh73a0/kzm9g nor r8a7740/armadillo.

Gr{oetje,eeting}s,

                        Geert

--
Geert Uytterhoeven -- There's lots of Linux beyond ia32 -- geert@linux-m68k.org

In personal conversations with technical people, I call myself a hacker. But
when I'm talking to journalists I just say "programmer" or something like that.
                                -- Linus Torvalds
