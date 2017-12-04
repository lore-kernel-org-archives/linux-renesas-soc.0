Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:44383 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751421AbdLDRYH (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 12:24:07 -0500
Received: by mail-lf0-f67.google.com with SMTP id x204so20024257lfa.11
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2017 09:24:06 -0800 (PST)
Subject: Re: [PATCH 1/2] net: sh_eth: use correct "struct device" when calling
 DMA mapping functions
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
 <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4c63cec5-6157-c95c-64a6-3afe69fdef6e@cogentembedded.com>
Date: Mon, 4 Dec 2017 20:24:02 +0300
MIME-Version: 1.0
In-Reply-To: <20171204133327.3505-2-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/04/2017 04:33 PM, Thomas Petazzoni wrote:

> There are two types of "struct device": the one representing the
> physical device on its physical bus (platform, SPI, PCI, etc.), and
> the one representing the logical device in its device class (net,
> etc.).
> 
> The DMA mapping API expects to receive as argument a "struct device"
> representing the physical device, as the "struct device" contains
> information about the bus that the DMA API needs.
> 
> However, the sh_eth driver mistakenly uses the "struct device"
> representing the logical device (embedded in "struct net_device")
> rather than the "struct device" representing the physical device on
> its bus.
> 
> This commit fixes that by adjusting all calls to the DMA mapping API.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

   I'm still unsure the ravb driver doesn't have this issue...

[...]

MBR, Sergei
