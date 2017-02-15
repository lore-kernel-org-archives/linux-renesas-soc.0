Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-oi0-f65.google.com ([209.85.218.65]:36418 "EHLO
        mail-oi0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752237AbdBOWO3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 15 Feb 2017 17:14:29 -0500
Date: Wed, 15 Feb 2017 16:14:26 -0600
From: Rob Herring <robh@kernel.org>
To: Chris Brandt <chris.brandt@renesas.com>
Cc: Simon Horman <horms+renesas@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Russell King <linux@armlinux.org.uk>,
        Brad Mouring <brad.mouring@ni.com>,
        Andrey Smirnov <andrew.smirnov@gmail.com>,
        Arnd Bergmann <arnd@arndb.de>,
        Richard Cochran <rcochran@linutronix.de>,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/3] ARM: l2c: add pl310-no-sideband option
Message-ID: <20170215221426.e3dk4zzmhgfuplti@rob-hp-laptop>
References: <20170207170929.29525-1-chris.brandt@renesas.com>
 <20170207170929.29525-2-chris.brandt@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170207170929.29525-2-chris.brandt@renesas.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Feb 07, 2017 at 12:09:27PM -0500, Chris Brandt wrote:
> If a PL310 is added to a system, but the sideband signals are not
> connected, some Cortex A9 optimizations cannot be used. In particular,
> enabling Full Line Zeros in the CA9 without sidebands connected will
> crash the system since the CA9 will expect the L2C to perform operations,
> yet the L2C never gets the commands.

I assume you are talking about just the AxUSER signals, not the 
AxCACHE signals too. That would be really broken. IIRC, the other AxUSER 
signals are just hints and no connection would not be a problem. This is 
the only one that requires coordination with enabling/disabling in the 
core. 

I think this should follow existing feature properties and explicitly 
disable the specific properties rather than have this indirection.

> 
> Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> ---
>  Documentation/devicetree/bindings/arm/l2c2x0.txt | 2 ++
>  arch/arm/mm/cache-l2x0.c                         | 9 +++++++--
>  2 files changed, 9 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/arm/l2c2x0.txt b/Documentation/devicetree/bindings/arm/l2c2x0.txt
> index 917199f..85046d2 100644
> --- a/Documentation/devicetree/bindings/arm/l2c2x0.txt
> +++ b/Documentation/devicetree/bindings/arm/l2c2x0.txt
> @@ -90,6 +90,8 @@ Optional properties:
>  - arm,standby-mode: L2 standby mode enable. Value <0> (forcibly disable),
>    <1> (forcibly enable), property absent (OS specific behavior,
>    preferably retain firmware settings)
> +- arm,pl310-no-sideband : disable all features that require sideband signals to
> +  be connected between the CPU and L2 (PL310 only).
>  
>  Example:
>  
