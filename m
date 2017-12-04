Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:42635 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752554AbdLDRaj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 12:30:39 -0500
Received: by mail-lf0-f67.google.com with SMTP id i2so20050888lfe.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2017 09:30:38 -0800 (PST)
Subject: Re: [PATCH 2/2] net: sh_eth: don't use NULL as "struct device" for
 the DMA mapping API
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204133327.3505-1-thomas.petazzoni@free-electrons.com>
 <20171204133327.3505-3-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <9beb8a38-847f-8d32-0c08-2ca6797d8fb6@cogentembedded.com>
Date: Mon, 4 Dec 2017 20:30:34 +0300
MIME-Version: 1.0
In-Reply-To: <20171204133327.3505-3-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 12/04/2017 04:33 PM, Thomas Petazzoni wrote:

> Using NULL as argument for the DMA mapping API is bogus, as the DMA
> mapping API may use information from the "struct device" to perform
> the DMA mapping operation. Therefore, pass the appropriate "struct
> device".
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

[...]

MBR, Sergei
