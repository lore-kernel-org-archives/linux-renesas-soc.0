Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f194.google.com ([209.85.208.194]:35059 "EHLO
        mail-lj1-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726324AbeLJQmC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 10 Dec 2018 11:42:02 -0500
Received: by mail-lj1-f194.google.com with SMTP id x85-v6so10259992ljb.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 10 Dec 2018 08:42:00 -0800 (PST)
Subject: Re: [PATCH] sata_rcar: fix deferred probing
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Jens Axboe <axboe@kernel.dk>, linux-ide@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <b28a6c60-1f20-e054-7f2a-c5a6cafde8a1@cogentembedded.com>
Message-ID: <0c36c87a-fc2c-1534-97e8-618101b71263@cogentembedded.com>
Date: Mon, 10 Dec 2018 19:41:58 +0300
MIME-Version: 1.0
In-Reply-To: <b28a6c60-1f20-e054-7f2a-c5a6cafde8a1@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 11/24/2018 09:14 PM, Sergei Shtylyov wrote:

> The driver overrides the error codes returned by platform_get_irq() to
> -EINVAL, so if it returns -EPROBE_DEFER, the driver would fail the probe
> permanently instead of the deferred probing. Switch to propagating the
> error code upstream, still checking/overriding IRQ0 as libata regards it
> as "no IRQ" (thus polling) anyway...
> 
> Fixes: 9ec36cafe43b ("of/irq: do irq resolution in platform_get_irq")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---
> This patch is against the 'master' branch of Jens Axboe's 'linux-block.git'
> repo.

   Jens, what about this patch? 2 weeks passed, there were 2 R-b tags, and
that's all...

MBR, Sergei
