Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-it1-f194.google.com ([209.85.166.194]:39078 "EHLO
        mail-it1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727422AbeLJSJv (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 13:09:51 -0500
Received: by mail-it1-f194.google.com with SMTP id a6so19671244itl.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 10:09:50 -0800 (PST)
Subject: Re: [PATCH] sata_rcar: fix deferred probing
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-ide@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <b28a6c60-1f20-e054-7f2a-c5a6cafde8a1@cogentembedded.com>
 <0c36c87a-fc2c-1534-97e8-618101b71263@cogentembedded.com>
From: Jens Axboe <axboe@kernel.dk>
Message-ID: <d5fb2b03-9163-1159-1791-f7cbf6a5b9d4@kernel.dk>
Date: Mon, 10 Dec 2018 11:09:47 -0700
MIME-Version: 1.0
In-Reply-To: <0c36c87a-fc2c-1534-97e8-618101b71263@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/10/18 9:41 AM, Sergei Shtylyov wrote:
> On 11/24/2018 09:14 PM, Sergei Shtylyov wrote:
> 
>> The driver overrides the error codes returned by platform_get_irq() to
>> -EINVAL, so if it returns -EPROBE_DEFER, the driver would fail the probe
>> permanently instead of the deferred probing. Switch to propagating the
>> error code upstream, still checking/overriding IRQ0 as libata regards it
>> as "no IRQ" (thus polling) anyway...
>>
>> Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
>> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
>>
>> ---
>> This patch is against the 'master' branch of Jens Axboe's 'linux-block.git'
>> repo.
> 
>    Jens, what about this patch? 2 weeks passed, there were 2 R-b tags, and
> that's all...

I'll queue it up, thanks.

-- 
Jens Axboe
