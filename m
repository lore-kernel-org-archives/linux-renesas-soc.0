Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from pandora.armlinux.org.uk ([78.32.30.218]:42416 "EHLO
        pandora.armlinux.org.uk" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S932652AbdBPQoq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 16 Feb 2017 11:44:46 -0500
Date: Thu, 16 Feb 2017 16:44:24 +0000
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
Subject: Re: [PATCH v4 0/3] ARM: l2c: add l2c support for RZ/A1
Message-ID: <20170216164424.GR27312@n2100.armlinux.org.uk>
References: <20170216161742.29320-1-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170216161742.29320-1-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Feb 16, 2017 at 11:17:39AM -0500, Chris Brandt wrote:
> The PL310 in the Renesas RZ/A1 SoC (R7S72100) does not have the sideband
> signals connected between the CPU and L2C. According the PL310 TRM,
> sideband signals are optional.
> 
> If a PL310 is added to a system, but the sideband signals are not
> connected, some Cortex A9 optimizations cannot be used. In particular,
> enabling Full Line Zeros in the CA9 without sidebands connected will
> crash the system since the CA9 will expect the L2C to perform operations,
> yet the L2C never gets the commands.
> 
> This series adds the option to not enable anything in the PL310 that
> uses sidebands, and then adds L2C support to the RZ/A1 DT.
> 
> v4:
> * changed l2x0_bresp_dis to l2x0_bresp_disable
> * changed l2x0_flz_dis to l2x0_flz_disable

Looks good, thanks.

I'll want to merge patch 1, but I suspect the other two patches need
to go through arm-soc, which will cause a problem due to being merged
independently...  Arnd?

-- 
RMK's Patch system: http://www.armlinux.org.uk/developer/patches/
FTTC broadband for 0.8mile line: currently at 9.6Mbps down 400kbps up
according to speedtest.net.
