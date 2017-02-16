Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:41848 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754841AbdBPQGo (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2017 11:06:44 -0500
Date: Thu, 16 Feb 2017 16:06:19 +0000
From: Russell King - ARM Linux <linux@armlinux.org.uk>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Brad Mouring <brad.mouring@ni.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <rcochran@linutronix.de>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 1/3] ARM: l2c: allow CA9 optimizations to be disabled
Message-ID: <20170216160619.GQ27312@n2100.armlinux.org.uk>
References: <20170216153726.22919-1-chris.brandt@renesas.com>
 <20170216153726.22919-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170216153726.22919-2-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 16, 2017 at 10:37:24AM -0500, Chris Brandt wrote:
> diff --git a/arch/arm/mm/cache-l2x0.c b/arch/arm/mm/cache-l2x0.c
> index 2290be3..486cc6d 100644
> --- a/arch/arm/mm/cache-l2x0.c
> +++ b/arch/arm/mm/cache-l2x0.c
> @@ -57,6 +57,9 @@ static unsigned long sync_reg_offset = L2X0_CACHE_SYNC;
>  
>  struct l2x0_regs l2x0_saved_regs;
>  
> +static bool l2x0_bresp_dis;
> +static bool l2x0_flz_dis;

Please use full "disable" here.

Thanks.

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
