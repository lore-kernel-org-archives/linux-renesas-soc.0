Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:54062 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751230AbcEIEPx (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Mon, 9 May 2016 00:15:53 -0400
Date: Mon, 09 May 2016 00:15:51 -0400 (EDT)
Message-Id: <20160509.001551.992827306777802470.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] sh_eth: couple of software reset bit cleanups
From: David Miller <davem@davemloft.net>
In-Reply-To: <1808900.MGlUzc8O9C@wasted.cogentembedded.com>
References: <1808900.MGlUzc8O9C@wasted.cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 08 May 2016 00:06:53 +0300

>    Here's a set of 2 patches against DaveM's 'net-next.git' repo. We can save
> on the repetitive chip reset code...
> 
> [1/2] sh_eth: call sh_eth_tsu_write() from sh_eth_chip_reset_giga()
> [2/2] sh_eth: reuse sh_eth_chip_reset()

Series applied, thanks.
