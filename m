Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf1-f65.google.com ([209.85.167.65]:46553 "EHLO
        mail-lf1-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726452AbeIMVg3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 13 Sep 2018 17:36:29 -0400
Received: by mail-lf1-f65.google.com with SMTP id e23-v6so5320738lfc.13
        for <linux-renesas-soc@vger.kernel.org>; Thu, 13 Sep 2018 09:26:15 -0700 (PDT)
Subject: Re: [PATCH] clocksource: sh_cmt: fix clocksource width for 32-bit
 machines
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        linux-sh@vger.kernel.org
References: <749e6480-aed6-041c-0209-8dc74c07f344@cogentembedded.com>
 <e6f0e5e5-7c57-917b-98ce-80fe9242b292@linaro.org>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <3af7d095-0ac9-2fee-a030-1be796886938@cogentembedded.com>
Date: Thu, 13 Sep 2018 19:26:11 +0300
MIME-Version: 1.0
In-Reply-To: <e6f0e5e5-7c57-917b-98ce-80fe9242b292@linaro.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 09/13/2018 04:25 PM, Daniel Lezcano wrote:

>> The driver seems to abuse *unsigned long* not only for the (32-bit)
>> register values but also for the 'sh_cmt_channel::total_cycles' which
>> needs to always be 64-bit -- as a result, the clocksource's mask is
>> needlessly clamped down to 32-bits on the 32-bit machines...
>>
>> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against the 'tip.git' repo's 'timers/core' branch plus the fixup
>> for the 64-bit machines reposted last Saturday...
> 
> Why not against timers/urgent ?

   Mhm... nothing blows up because of this apparently (the bug is quite old).

MBR, Sergei
