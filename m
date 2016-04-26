Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:41390 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752375AbcDZTWh (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 26 Apr 2016 15:22:37 -0400
Date: Tue, 26 Apr 2016 15:22:35 -0400 (EDT)
Message-Id: <20160426.152235.1961438040028461276.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] sh_eth: get rid of the 2nd parameter to
 sh_eth_dev_init()
From: David Miller <davem@davemloft.net>
In-Reply-To: <1615196.r6Bb3HFTJZ@wasted.cogentembedded.com>
References: <1615196.r6Bb3HFTJZ@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 24 Apr 2016 19:11:07 +0300

> sh_eth_dev_init()  is now always called with  'true' as the  2nd argument,
> so that there's no more sense in having 2 parameters to this function...
> 
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied.
