Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-qt0-f179.google.com ([209.85.216.179]:38626 "EHLO
        mail-qt0-f179.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726902AbeINTs0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 15:48:26 -0400
Received: by mail-qt0-f179.google.com with SMTP id x7-v6so8885687qtk.5
        for <linux-renesas-soc@vger.kernel.org>; Fri, 14 Sep 2018 07:33:39 -0700 (PDT)
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
Message-ID: <35868211-4202-2ca2-425e-ac712e45bf59@linaro.org>
Date: Fri, 14 Sep 2018 16:33:36 +0200
MIME-Version: 1.0
In-Reply-To: <749e6480-aed6-041c-0209-8dc74c07f344@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
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

Applied for 4.20, thanks.
