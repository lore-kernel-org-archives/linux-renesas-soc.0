Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:39374 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750812AbdLEToG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Dec 2017 14:44:06 -0500
Date: Tue, 05 Dec 2017 14:44:05 -0500 (EST)
Message-Id: <20171205.144405.531451693140949867.davem@davemloft.net>
To: thomas.petazzoni@free-electrons.com
Cc: sergei.shtylyov@cogentembedded.com,
        niklas.soderlund+renesas@ragnatech.se, geert+renesas@glider.be,
        horms+renesas@verge.net.au, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] net: sh_eth: add support for SH7786 and big-endian
From: David Miller <davem@davemloft.net>
In-Reply-To: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
References: <20171204141744.18599-1-thomas.petazzoni@free-electrons.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Thomas Petazzoni <thomas.petazzoni@free-electrons.com>
Date: Mon,  4 Dec 2017 15:17:42 +0100

> I've recently been working on an SH7786 based platform, which uses the
> sh_eth network controller. One peculiarity of my setup is that the CPU
> is configured big-endian (even though little-endian is more
> traditional in the Linux SuperH world), and the sh_eth driver was not
> ready for this.
> 
> The first patch simply adds the sh_eth_cpu_data structure that
> describes the SH7786 controller.
> 
> The second patch fixes the driver for big-endian operation. However,
> I'd like this patch to be carefully reviewed by Sergei Shtylyov who
> already did some endianness related changes in this driver. Indeed, my
> change is based on the assumption that the DMA descriptors are in the
> native endianness of the CPU.

Sergei, please let me know when you've re-reviewed this series now
that you have documentation in hand...

Thanks.
