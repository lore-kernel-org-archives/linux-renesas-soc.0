Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:35526 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751373AbdJMGBP (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 13 Oct 2017 02:01:15 -0400
Date: Thu, 12 Oct 2017 23:01:14 -0700 (PDT)
Message-Id: <20171012.230114.1901066128868227139.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: sergei.shtylyov@cogentembedded.com, horms+renesas@verge.net.au,
        niklas.soderlund+renesas@ragnatech.se, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ravb: Consolidate clock handling
From: David Miller <davem@davemloft.net>
In-Reply-To: <1507796693-14268-1-git-send-email-geert+renesas@glider.be>
References: <1507796693-14268-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Thu, 12 Oct 2017 10:24:53 +0200

> The module clock is used for two purposes:
>   - Wake-on-LAN (WoL), which is optional,
>   - gPTP Timer Increment (GTI) configuration, which is mandatory.
> 
> As the clock is needed for GTI configuration anyway, WoL is always
> available.  Hence remove duplication and repeated obtaining of the clock
> by making GTI use the stored clock for WoL use.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Applied.
