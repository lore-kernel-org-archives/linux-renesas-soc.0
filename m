Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f54.google.com ([74.125.82.54]:35770 "EHLO
	mail-wm0-f54.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752383AbcD0Ibh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Wed, 27 Apr 2016 04:31:37 -0400
Received: by mail-wm0-f54.google.com with SMTP id e201so27843413wme.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 27 Apr 2016 01:31:36 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <1461689625-3693-1-git-send-email-wsa@the-dreams.de>
References: <1461689625-3693-1-git-send-email-wsa@the-dreams.de>
Date: Wed, 27 Apr 2016 10:31:35 +0200
Message-ID: <CAPDyKFoWdzG91o7FtZTc1FBZ3qKnVg2Q8KWo+aQkq-1Ziqbn+Q@mail.gmail.com>
Subject: Re: [PATCH v2 0/5] mmc: tmio: make CTL_STATUS handling consistent
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-mmc <linux-mmc@vger.kernel.org>,
	linux-renesas-soc@vger.kernel.org
Content-Type: text/plain; charset=UTF-8
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 26 April 2016 at 18:53, Wolfram Sang <wsa@the-dreams.de> wrote:
> It took me a little to discover that CTL_STATUS has a different handling than
> the other registers. CTL_STATUS and CTL_STATUS2, both u16, are merged into a
> virtual u32. However, CTL_STATUS2 was also directly accessed.
>
> Clean this up, make this consistent, and document this. Making the driver less
> complex and easier to work with.
>
> Tested on Renesas R-Car Gen2 and Gen3.
>
> Changes since V1:
>
> * rebased
> * added simons review tags
>
>
> Wolfram Sang (5):
>   mmc: tmio: give read32/write32 functions more descriptive names
>   mmc: tmio: use BIT() within defines
>   mmc: tmio: use CTL_STATUS consistently
>   mmc: tmio/sdhi: distinguish between SCLKDIVEN and ILL_FUNC
>   mmc: tmio: document CTL_STATUS handling
>
>  drivers/mmc/host/sh_mobile_sdhi.c |  3 ++-
>  drivers/mmc/host/tmio_mmc.h       | 56 ++++++++++++++++++++-------------------
>  drivers/mmc/host/tmio_mmc_pio.c   | 24 ++++++++---------
>  3 files changed, 43 insertions(+), 40 deletions(-)
>
> --
> 2.7.0
>

They still don't apply, sorry.

Are you re-basing towards my mmc tree's next branch?

Kind regards
Uffe
