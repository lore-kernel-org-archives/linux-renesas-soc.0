Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:54748 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751335AbeBLQr7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Feb 2018 11:47:59 -0500
Date: Mon, 12 Feb 2018 11:47:57 -0500 (EST)
Message-Id: <20180212.114757.1364732291823894373.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: sergei.shtylyov@cogentembedded.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ravb: Remove obsolete explicit clock handling for
 WoL
From: David Miller <davem@davemloft.net>
In-Reply-To: <1518442800-31913-1-git-send-email-geert+renesas@glider.be>
References: <1518442800-31913-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Mon, 12 Feb 2018 14:40:00 +0100

> Currently, if Wake-on-LAN is enabled, the EtherAVB device's module clock
> is manually kept running during system suspend, to make sure the device
> stays active.
> 
> Since commit 91c719f5ec6671f7 ("soc: renesas: rcar-sysc: Keep wakeup
> sources active during system suspend") , this workaround is no longer
> needed.  Hence remove all explicit clock handling to keep the device
> active.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Reviewed-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> ---
> v2:
>   - Add Reviewed-by,
>   - Rebased,
>   - Drop RFC state, now the dependency is upstream.

Applied.
