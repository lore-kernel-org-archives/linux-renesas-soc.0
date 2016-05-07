Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f46.google.com ([209.85.215.46]:34121 "EHLO
	mail-lf0-f46.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750913AbcEGSjw (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sat, 7 May 2016 14:39:52 -0400
Received: by mail-lf0-f46.google.com with SMTP id m64so162775153lfd.1
        for <linux-renesas-soc@vger.kernel.org>; Sat, 07 May 2016 11:39:51 -0700 (PDT)
Subject: Re: [PATCH v2 1/2 -net] ravb: Add missing free_irq() call to
 ravb_close()
To: Geert Uytterhoeven <geert+renesas@glider.be>,
	"David S. Miller" <davem@davemloft.net>
References: <1462619832-5177-1-git-send-email-geert+renesas@glider.be>
 <1462619832-5177-2-git-send-email-geert+renesas@glider.be>
Cc: Yoshihiro Kaneko <ykaneko0929@gmail.com>,
	Simon Horman <horms+renesas@verge.net.au>,
	netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <572E3673.5020304@cogentembedded.com>
Date: Sat, 7 May 2016 21:39:47 +0300
MIME-Version: 1.0
In-Reply-To: <1462619832-5177-2-git-send-email-geert+renesas@glider.be>
Content-Type: text/plain; charset=windows-1252; format=flowed
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

On 05/07/2016 02:17 PM, Geert Uytterhoeven wrote:

> When reopening the network device on ra7795/salvator-x, e.g. after a
> DHCP timeout:
>
>      IP-Config: Reopening network devices...
>      genirq: Flags mismatch irq 139. 00000000 (eth0:ch24:emac) vs. 00000000 (eth0:ch24:emac)
>      ravb e6800000.ethernet eth0: cannot request IRQ eth0:ch24:emac

    Er, this can't be a message from the kernel built from net.git. That 
driver used 'ndev->name'
to request both IRQs...

>      IP-Config: Failed to open eth0
>      IP-Config: No network devices available
>
> The "mismatch" is due to requesting an IRQ that is already in use,
> while IRQF_PROBE_SHARED wasn't set.
>
> However, the real cause is that ravb_close() doesn't release the R-Car
> Gen3-specific secondary IRQ.
>
> Add the missing free_irq() call to fix this.
>
> Fixes: 22d4df8ff3a3cc72 ("ravb: Add support for r8a7795 SoC")
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
