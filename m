Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:32876 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751164AbcLAKYV (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 1 Dec 2016 05:24:21 -0500
Received: by mail-lf0-f50.google.com with SMTP id c13so167629031lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Thu, 01 Dec 2016 02:24:21 -0800 (PST)
Subject: Re: [PATCH] sh_eth: add missing checks for status bits
To: Chris Brandt <chris.brandt@renesas.com>,
        David Miller <davem@davemloft.net>
References: <20161130200148.9011-1-chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <aad0720f-2515-f1a0-d3ee-310562267594@cogentembedded.com>
Date: Thu, 1 Dec 2016 13:24:18 +0300
MIME-Version: 1.0
In-Reply-To: <20161130200148.9011-1-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

    Please always CC me on the sh_eth/ravb driver patches as directed by 
scripts/get_maintainer.pl.

On 11/30/2016 11:01 PM, Chris Brandt wrote:

> When streaming a lot of data and the RZ can't keep up, some status bits
> will get set that are not being checked or cleared which cause the
> following messages and the Ethernet driver to stop working. This
> patch fixes that issue.

    Perhaps we should just clear the correspoding bits in EESIPR instead? They 
are not set for any other SoC...

> irq 21: nobody cared (try booting with the "irqpoll" option)
> handlers:
> [<c036b71c>] sh_eth_interrupt
> Disabling IRQ #21
>
> Fixes: db893473d313a4ad ("sh_eth: Add support for r7s72100")
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

MBR, Sergei
