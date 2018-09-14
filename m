Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f196.google.com ([209.85.216.196]:46096 "EHLO
        mail-qt0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727640AbeINTsG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 15:48:06 -0400
Received: by mail-qt0-f196.google.com with SMTP id l42-v6so8863802qtf.13
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Sep 2018 07:33:19 -0700 (PDT)
Subject: Re: [PATCH v3] clocksource: sh_cmt: fixup for 64-bit machines
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        linux-sh@vger.kernel.org
References: <46a8a01b-e849-6d62-3c61-fbae48f34e58@cogentembedded.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <7340b1af-933d-cc4f-5973-e2ab7e068698@linaro.org>
Date: Fri, 14 Sep 2018 16:33:16 +0200
MIME-Version: 1.0
In-Reply-To: <46a8a01b-e849-6d62-3c61-fbae48f34e58@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/09/2018 22:54, Sergei Shtylyov wrote:
> When trying to use CMT for clockevents on R-Car gen3 SoCs, I noticed
> that 'max_delta_ns' for the broadcast timer (CMT) was shown as 1000 in
> /proc/timer_list. It turned out that when calculating it, the driver did
> 1 << 32 (causing what I think was undefined behavior) resulting in a zero
> delta, later clamped to 1000 by cev_delta2ns(). The root cause turned out
> to be that the driver abused *unsigned long* for the CMT register values
> (which are 16/32-bit), so that the calculation of 'ch->max_match_value'
> in sh_cmt_setup_channel() used the wrong branch. Using more proper 'u32'
> instead fixed 'max_delta_ns' and even fixed the switching an active
> clocksource to CMT (which caused the system to turn non-interactive
> before).
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'tip.git' repo's 'timers/core' branch.
> The CMT driver wasn't ever used on SH64; on R-Car gen3 (ARM64) I'm only
> enabling building of this driver now, so not sure how urgent is this...
> 
> Changes in version 3:
> - made the 'overflow_bit' and 'clear_bits' members of 'struct sh_cmt_info'
>   'u32';
> - made the 2nd parameter of sh_cmt_write_cmstr() 'u32';
> - made the result, the 2nd parameter, and 'o{1|2}' local variables of
>   sh_cmt_get_counter() 'u32';
> - made the 'has_wrapped' local variables 'u32' in sh_cmt_clocksource_read()
>   and sh_cmt_clock_event_program_verify();
> - fixed a typo in the patch description.
> 
> Changes in version 2:
> - completely redid the patch, fixing abuse of *unsigned long* for the CMT
>   register values.
> 
>  drivers/clocksource/sh_cmt.c |   72 +++++++++++++++++++------------------------
>  1 file changed, 33 insertions(+), 39 deletions(-)
> 

Applied for 4.20, thanks.

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
