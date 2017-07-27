Return-Path: <kieranbingham.mailinglists+caf_=kieranbingham=gmail.com@gmail.com>
Return-Path: <linux-kernel-owner@vger.kernel.org>
Date: Thu, 27 Jul 2017 15:31:46 +0200
From: Simon Horman <horms@verge.net.au>
To: Rob Herring <robh@kernel.org>
Cc: arm@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        =?utf-8?Q?Beno=C3=AEt?= Cousson <bcousson@baylibre.com>,
        Paul Walmsley <paul@pwsan.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ARM: Convert to using %pOF instead of full_name
Message-ID: <20170727133143.GB16143@verge.net.au>
References: <20170721192835.25555-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20170721192835.25555-1-robh@kernel.org>
Sender: linux-kernel-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jul 21, 2017 at 02:28:32PM -0500, Rob Herring wrote:
> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.
> 
> Signed-off-by: Rob Herring <robh@kernel.org>
> Acked-by: Krzysztof Kozlowski <krzk@kernel.org>
> Acked-by: Heiko Stuebner <heiko@sntech.de>
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Gregory CLEMENT <gregory.clement@free-electrons.com>
> Cc: Russell King <linux@armlinux.org.uk>
> Cc: Kukjin Kim <kgene@kernel.org>
> Cc: Javier Martinez Canillas <javier@osg.samsung.com>
> Cc: Shawn Guo <shawnguo@kernel.org>
> Cc: Sascha Hauer <kernel@pengutronix.de>
> Cc: Fabio Estevam <fabio.estevam@nxp.com>
> Cc: Jason Cooper <jason@lakedaemon.net>
> Cc: Andrew Lunn <andrew@lunn.ch>
> Cc: Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>
> Cc: Tony Lindgren <tony@atomide.com>
> Cc: "Benoît Cousson" <bcousson@baylibre.com>
> Cc: Paul Walmsley <paul@pwsan.com>
> Cc: Simon Horman <horms@verge.net.au>
> Cc: Magnus Damm <magnus.damm@gmail.com>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-samsung-soc@vger.kernel.org
> Cc: linux-omap@vger.kernel.org
> Cc: linux-rockchip@lists.infradead.org
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> v2:
> - Merge several 2 line prints to single line.
> - Add acks
> 
>  arch/arm/kernel/cpuidle.c            | 4 ++--
>  arch/arm/kernel/devtree.c            | 5 ++---
>  arch/arm/kernel/topology.c           | 3 +--
>  arch/arm/mach-exynos/suspend.c       | 7 +++----
>  arch/arm/mach-imx/gpc.c              | 4 ++--
>  arch/arm/mach-mvebu/kirkwood.c       | 3 +--
>  arch/arm/mach-omap2/omap-wakeupgen.c | 4 ++--
>  arch/arm/mach-omap2/omap_hwmod.c     | 4 ++--
>  arch/arm/mach-rockchip/platsmp.c     | 4 ++--
>  arch/arm/mach-shmobile/pm-rmobile.c  | 7 +++----
>  10 files changed, 20 insertions(+), 25 deletions(-)

mach-shmobile portion:

Acked-by: Simon Horman <horms+renesas@verge.net.au>
