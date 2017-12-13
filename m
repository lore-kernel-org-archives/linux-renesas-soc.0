Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:40262 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753039AbdLMQTG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 11:19:06 -0500
Date: Wed, 13 Dec 2017 11:19:04 -0500 (EST)
Message-Id: <20171213.111904.72105455444938275.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: sergei.shtylyov@cogentembedded.com,
        niklas.soderlund+renesas@ragnatech.se, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] Revert "ravb: add workaround for clock when resuming
 with WoL enabled"
From: David Miller <davem@davemloft.net>
In-Reply-To: <1512982449-11051-1-git-send-email-geert+renesas@glider.be>
References: <1512982449-11051-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Mon, 11 Dec 2017 09:54:09 +0100

> This reverts commit fbf3d034f2ff6264183cfa6845770e8cc2a986c8.
> 
> As of commit 560869100b99a3da ("clk: renesas: cpg-mssr: Restore module
> clocks during resume"), the workaround is no longer needed.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied, thanks.
