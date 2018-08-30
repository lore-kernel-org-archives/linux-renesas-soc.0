Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:39278 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725758AbeH3FKO (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 30 Aug 2018 01:10:14 -0400
Date: Wed, 29 Aug 2018 18:10:40 -0700 (PDT)
Message-Id: <20180829.181040.651557151634587416.davem@davemloft.net>
To: chris.brandt@renesas.com
Cc: sergei.shtylyov@cogentembedded.com, robh+dt@kernel.org,
        mark.rutland@arm.com, netdev@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        horms+renesas@verge.net.au
Subject: Re: [PATCH v2] sh_eth: Add R7S9210 support
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180827174202.80750-1-chris.brandt@renesas.com>
References: <20180827174202.80750-1-chris.brandt@renesas.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Chris Brandt <chris.brandt@renesas.com>
Date: Mon, 27 Aug 2018 12:42:02 -0500

> Add support for the R7S9210 which is part of the RZ/A2 series.
> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
> v2:
>  * Use sh_eth_offset_fast_sh4 instead of sh_eth_offset_fast_rza2
>  * Use sh_eth_set_rate_rcar instead of sh_eth_set_rate_r7s9210()
>  * Removed enum SH_ETH_REG_FAST_RZA2

Applied.
