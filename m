Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f66.google.com ([209.85.215.66]:33581 "EHLO
        mail-lf0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752761AbdLDQjO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 11:39:14 -0500
Received: by mail-lf0-f66.google.com with SMTP id 74so19916187lfs.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2017 08:39:14 -0800 (PST)
Subject: Re: [PATCH 2/2] net: sh_eth: make work on big endian systems
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
 <20171204141744.18599-3-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <44b81296-8cf8-840a-3c13-a0bccfa1a836@cogentembedded.com>
Date: Mon, 4 Dec 2017 19:39:10 +0300
MIME-Version: 1.0
In-Reply-To: <20171204141744.18599-3-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/04/2017 05:17 PM, Thomas Petazzoni wrote:

> The sh_eth driver uses cpu_to_le32() and le32_to_cpu() to manipulate the
> fields of the DMA descriptors, making the assumption that the DMA 
> descriptors are little-endian.
> 
> However, testing on the Renesas SH7786 running in big-endian mode reveals
> that the DMA descriptors are also big-endian when running big-endian.
> Therefore, all the endianness conversion needs to be removed for the sh_eth
> driver to work.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com> --- 
> Note: I see that Sergei Shtylyov has done some work around endianness on
> this driver back in 2015. I am not sure if it's used on other non-SuperH
> platforms in platforms where the CPU might run big-endian but the IP still
> be little-endian.

   The original Renesas' code assumed that... but the big-endian descriptors
(marked as such) were never used by the arch/sh/ code (and the code wouldn't
work right even if they did!). Therefore I did remove EDMAC_BIG_ENDIAN (and
now EDMAC_LITTLE_ENDIAN can be removed as well).

> If this is the case, then we would need a different approach and more
> discussion.

    No, the ARM platforms sh_eth is used on (mostly R-Car) seem to be
little-endian only.

> Therefore, it would be useful to wait for an ACK from Sergei before 
> applying this patch.
    You have it (-:

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
