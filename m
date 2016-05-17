Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([149.20.54.216]:48151 "EHLO
	shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1752573AbcEQQ2u (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Tue, 17 May 2016 12:28:50 -0400
Date: Tue, 17 May 2016 12:28:47 -0400 (EDT)
Message-Id: <20160517.122847.2276488826673799483.davem@davemloft.net>
To: geert+renesas@glider.be
Cc: sergei.shtylyov@cogentembedded.com, horms+renesas@verge.net.au,
	ykaneko0929@gmail.com, netdev@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3 -net-next] ravb: Add missing free_irq() calls to
 ravb_close()
From: David Miller <davem@davemloft.net>
In-Reply-To: <1463475934-3062-1-git-send-email-geert+renesas@glider.be>
References: <1463475934-3062-1-git-send-email-geert+renesas@glider.be>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Geert Uytterhoeven <geert+renesas@glider.be>
Date: Tue, 17 May 2016 11:05:34 +0200

> When reopening the network device on ra7795/salvator-x, e.g. after a
> DHCP timeout:
> 
>     IP-Config: Reopening network devices...
>     genirq: Flags mismatch irq 139. 00000000 (eth0:ch0:rx_be) vs. 00000000 (ravb e6800000.ethernet eth0: cannot request IRQ eth0:ch0:rx_be
>     IP-Config: Failed to open eth0
>     IP-Config: No network devices available
> 
> The "mismatch" is due to requesting an IRQ that is already in use,
> while IRQF_PROBE_SHARED wasn't set.
> 
> However, the real cause is that ravb_close() doesn't release any of the
> R-Car Gen3-specific secondary IRQs.
> 
> Add the missing free_irq() calls to fix this.
> 
> Fixes: f51bdc236b6c5835 ("ravb: Add dma queue interrupt support")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied.
