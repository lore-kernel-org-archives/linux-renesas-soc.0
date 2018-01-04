Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:49898 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753006AbeADTSh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Jan 2018 14:18:37 -0500
Date: Thu, 04 Jan 2018 14:18:35 -0500 (EST)
Message-Id: <20180104.141835.1836351687367008943.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org, nobuhiro.iwamatsu.yj@renesas.com
Subject: Re: [PATCH] sh_eth: fix TSU resource handling
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180103170955.343662722@cogentembedded.com>
References: <20180103170955.343662722@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Wed, 03 Jan 2018 20:09:49 +0300

> When switching  the driver to the managed device API,  I managed to break
> the  case of a  dual Ether devices sharing a single TSU: the 2nd Ether port
> wouldn't probe. Iwamatsu-san has tried to fix this but his patch was buggy
> and he then dropped the ball...
> 
> The solution is to  limit calling devm_request_mem_region() to the first
> of  the two  ports  sharing the same TSU, so devm_ioremap_resource() can't
> be used anymore for the TSU resource...
> 
> Fixes: d5e07e69218f ("sh_eth: use managed device API")
> Reported-by: Nobuhiro Iwamatsu <nobuhiro.iwamatsu.yj@renesas.com>
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied and queued up for -stable, thanks.
