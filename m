Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:40370 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752610AbdAFUfN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jan 2017 15:35:13 -0500
Date: Fri, 06 Jan 2017 15:35:11 -0500 (EST)
Message-Id: <20170106.153511.1906051409328575667.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] sh_eth: R8A7740 supports packet shecksumming
From: David Miller <davem@davemloft.net>
In-Reply-To: <1871204.P0zXJRoIfd@wasted.cogentembedded.com>
References: <1871204.P0zXJRoIfd@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Thu, 05 Jan 2017 00:29:32 +0300

> The R8A7740 GEther controller supports the packet checksum offloading
> but the 'hw_crc' (bad name, I'll fix it) flag isn't set in the R8A7740
> data,  thus CSMR isn't cleared...
> 
> Fixes: 73a0d907301e ("net: sh_eth: add support R8A7740")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied.
