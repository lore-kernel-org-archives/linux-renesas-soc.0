Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f193.google.com ([209.85.216.193]:36447 "EHLO
        mail-qt0-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbeIMSfP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 14:35:15 -0400
Received: by mail-qt0-f193.google.com with SMTP id t5-v6so5306057qtn.3
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Sep 2018 06:25:47 -0700 (PDT)
Subject: Re: [PATCH] clocksource: sh_cmt: fix clocksource width for 32-bit
 machines
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        linux-sh@vger.kernel.org
References: <749e6480-aed6-041c-0209-8dc74c07f344@cogentembedded.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <e6f0e5e5-7c57-917b-98ce-80fe9242b292@linaro.org>
Date: Thu, 13 Sep 2018 15:25:45 +0200
MIME-Version: 1.0
In-Reply-To: <749e6480-aed6-041c-0209-8dc74c07f344@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/09/2018 22:22, Sergei Shtylyov wrote:
> The driver seems to abuse *unsigned long* not only for the (32-bit)
> register values but also for the 'sh_cmt_channel::total_cycles' which
> needs to always be 64-bit -- as a result, the clocksource's mask is
> needlessly clamped down to 32-bits on the 32-bit machines...
> 
> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'tip.git' repo's 'timers/core' branch plus the fixup
> for the 64-bit machines reposted last Saturday...

Why not against timers/urgent ?



-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
