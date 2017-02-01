Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:41664 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753176AbdBARyu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 1 Feb 2017 12:54:50 -0500
Date: Wed, 01 Feb 2017 12:54:41 -0500 (EST)
Message-Id: <20170201.125441.297548008793869251.davem@davemloft.net>
To: niklas.soderlund+renesas@ragnatech.se
Cc: sergei.shtylyov@cogentembedded.com, horms+renesas@verge.net.au,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        geert@linux-m68k.org
Subject: Re: [PATCH 0/2] sh_eth: fixes for MagicPacket handling
From: David Miller <davem@davemloft.net>
In-Reply-To: <20170201144155.17123-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170201144155.17123-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
Date: Wed,  1 Feb 2017 15:41:53 +0100

> This series contain two fixes for MagicPacket handling. It's based on 
> top of net-next and is tested on Koelsch.

Series applied, thanks.

I fixed the "register" --> "registered" thing in the commit message
for patch #2 when I applied this.

Thanks again.
