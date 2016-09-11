Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:51334 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751425AbcIKEW0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 11 Sep 2016 00:22:26 -0400
Date: Sat, 10 Sep 2016 21:12:05 -0700 (PDT)
Message-Id: <20160910.211205.2263493847383395899.davem@davemloft.net>
To: chris.brandt@renesas.com
Cc: sergei.shtylyov@cogentembedded.com, horms+renesas@verge.net.au,
        geert+renesas@glider.be, daniel@0x0f.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] net: ethernet: renesas: sh_eth: add POST registers
 for rz
From: David Miller <davem@davemloft.net>
In-Reply-To: <20160907185709.24150-1-chris.brandt@renesas.com>
References: <20160907185709.24150-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>
Date: Wed,  7 Sep 2016 14:57:09 -0400

> Due to a mistake in the hardware manual, the FWSLC and POST1-4 registers
> were not documented and left out of the driver for RZ/A making the CAM
> feature non-operational.
> Additionally, when the offset values for POST1-4 are left blank, the driver
> attempts to set them using an offset of 0xFFFF which can cause a memory
> corruption or panic.
> 
> This patch fixes the panic and properly enables CAM.
> 
> Reported-by: Daniel Palmer <daniel@0x0f.com>
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>

Applied, thanks.
