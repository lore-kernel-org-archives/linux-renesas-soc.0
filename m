Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:36679 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727782AbeH3Naj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 09:30:39 -0400
Received: by mail-wm0-f68.google.com with SMTP id j192-v6so1279789wmj.1
        for <linux-renesas-soc@vger.kernel.org>; Thu, 30 Aug 2018 02:29:24 -0700 (PDT)
Subject: Re: [PATCH 0/4] clocksource: convert to SPDX for Renesas
To: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-kernel@vger.kernel.org
References: <87a7pff8jq.wl-kuninori.morimoto.gx@renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <3fd74aa2-9025-7163-a408-cb2c8a76aec2@linaro.org>
Date: Thu, 30 Aug 2018 11:29:22 +0200
MIME-Version: 1.0
In-Reply-To: <87a7pff8jq.wl-kuninori.morimoto.gx@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 22/08/2018 04:25, Kuninori Morimoto wrote:
> 
> Hi Daniel, Thomas
> 
> These convert license to SPDX style on clocksource for Renesas
> 
> Kuninori Morimoto (4):
>   clocksource: renesas-ostm: convert to SPDX identifiers
>   clocksource: sh_cmt: convert to SPDX identifiers
>   clocksource: sh_mtu2: convert to SPDX identifiers
>   clocksource: sh_tmu: convert to SPDX identifiers
> 
>  drivers/clocksource/renesas-ostm.c | 11 +----------
>  drivers/clocksource/sh_cmt.c       | 10 +---------
>  drivers/clocksource/sh_mtu2.c      | 10 +---------
>  drivers/clocksource/sh_tmu.c       | 10 +---------
>  4 files changed, 4 insertions(+), 37 deletions(-)

Series applied for 4.20

nit: in the future can you stick to the format:

clocksource/drivers/<timer>: [A-Z].*

Thanks

  -- Daniel


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
