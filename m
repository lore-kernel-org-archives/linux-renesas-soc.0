Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f196.google.com ([209.85.128.196]:34910 "EHLO
        mail-wr0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1164693AbdD2EqR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 29 Apr 2017 00:46:17 -0400
Received: by mail-wr0-f196.google.com with SMTP id g12so8806201wrg.2
        for <linux-renesas-soc@vger.kernel.org>; Fri, 28 Apr 2017 21:46:16 -0700 (PDT)
Subject: Re: [RFC 0/2] mmc: sdhi: make use of CBSY
To: Wolfram Sang <wsa@the-dreams.de>, linux-renesas-soc@vger.kernel.org
References: <1453808801-12510-1-git-send-email-wsa@the-dreams.de>
Cc: Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
From: Dirk Behme <dirk.behme@gmail.com>
Message-ID: <ac6f67df-b124-53c3-ee54-9f215120c556@gmail.com>
Date: Sat, 29 Apr 2017 06:46:08 +0200
MIME-Version: 1.0
In-Reply-To: <1453808801-12510-1-git-send-email-wsa@the-dreams.de>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

On 26.01.2016 12:46, Wolfram Sang wrote:
> Honestly, I still think this is a micro-optimization: Assuming SCLKDIVEN is
> basically CBSY plus 8 SD clock cycles, then we'd save in the best case (SD
> clock is slowest, 24 MHz) around 333ns while we are polling with 1 us
> granularity...
>
> However, in case I assumed something wrong and so you guys have something to
> play with, here is an RFC. Let me know what you think.
>
> Wolfram Sang (2):
>   mmc: tmio/sdhi: introduce flag for RCar specific features
>   mmc: sdhi: on RCar, make use of CBSY bit
>
>  drivers/mmc/host/sh_mobile_sdhi.c | 19 +++++++++++++------
>  drivers/mmc/host/tmio_mmc_pio.c   |  6 +++---
>  include/linux/mfd/tmio.h          |  4 ++--
>  include/linux/mmc/tmio.h          |  3 +++
>  4 files changed, 21 insertions(+), 11 deletions(-)


Checking the recent kernel [1] it seems to me that this changes never 
made it into mainline.

Does anybody remember why and/or the history?

Best regards

Dirk

[1] 
https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/drivers/mmc/host/sh_mobile_sdhi.c#n509
