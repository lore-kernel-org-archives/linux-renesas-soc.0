Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:36156 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726150AbeIKBam (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Sep 2018 21:30:42 -0400
Received: by mail-lj1-f194.google.com with SMTP id v26-v6so19058441ljj.3
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Sep 2018 13:34:52 -0700 (PDT)
Subject: Re: [PATCH] clocksource: sh_cmt: fix clocksource width for 32-bit
 machines
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Daniel Lezcano <daniel.lezcano@linaro.org>,
        Thomas Gleixner <tglx@linutronix.de>,
        linux-renesas-soc@vger.kernel.org
Cc: Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Andrey Gusakov <andrey.gusakov@cogentembedded.com>,
        Mikhail Ulyanov <mikhail.ulyanov@cogentembedded.com>,
        linux-sh@vger.kernel.org
References: <749e6480-aed6-041c-0209-8dc74c07f344@cogentembedded.com>
Message-ID: <9d4d43f6-f85e-5ddb-a4cb-2b17925e255c@cogentembedded.com>
Date: Mon, 10 Sep 2018 23:34:49 +0300
MIME-Version: 1.0
In-Reply-To: <749e6480-aed6-041c-0209-8dc74c07f344@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 09/10/2018 11:22 PM, Sergei Shtylyov wrote:

> The driver seems to abuse *unsigned long* not only for the (32-bit)
> register values but also for the 'sh_cmt_channel::total_cycles' which
> needs to always be 64-bit -- as a result, the clocksource's mask is
> needlessly clamped down to 32-bits on the 32-bit machines...

   I thought this bug was present from the start but no... 

> Reported-by: Geert Uytterhoeven <geert@linux-m68k.org>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Fixes: 19bdc9d061bc ("clocksource: sh_cmt clocksource support")

[...]

MBR, Sergei
