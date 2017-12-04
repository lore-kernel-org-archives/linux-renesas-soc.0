Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:33584 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753972AbdLDQGU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Dec 2017 11:06:20 -0500
Received: by mail-lf0-f68.google.com with SMTP id 74so19788151lfs.0
        for <linux-renesas-soc@vger.kernel.org>; Mon, 04 Dec 2017 08:06:19 -0800 (PST)
Subject: Re: [PATCH] net: sh_eth: do not advertise Gigabit capabilities when
 not available
To: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>,
        "David S. Miller" <davem@davemloft.net>,
        =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20171204141346.17410-1-thomas.petazzoni@free-electrons.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <64f4a5a9-4988-eff9-db4e-043436c801f4@cogentembedded.com>
Date: Mon, 4 Dec 2017 19:06:16 +0300
MIME-Version: 1.0
In-Reply-To: <20171204141346.17410-1-thomas.petazzoni@free-electrons.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

On 12/04/2017 05:13 PM, Thomas Petazzoni wrote:

> Not all variants of the sh_eth hardware have Gigabit
> support. Unfortunately, the current driver doesn't update
> phydev->supported depending on the MAC capabilities. Due to this, if
> you have a Gigabit capable PHY, the PHY will advertise its Gigabit
> capability and establish a link at 1Gbit/s, even though the MAC
> doesn't support it.
> 
> In order to avoid this, we mark phydev->supported if we're running a
> non-Gigabit capable hardware.

    I guess this (being a fix) was targeted to net.git?

> Tested on a SH7786 platform, with a Gigabit PHY.
> 
> Signed-off-by: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
[...]

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
