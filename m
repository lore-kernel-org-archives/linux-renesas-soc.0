Return-Path: <devicetree-owner@vger.kernel.org>
From: Robert Jarzmik <robert.jarzmik@free.fr>
To: Kishon Vijay Abraham I <kishon@ti.com>
Cc: Tony Lindgren <tony@atomide.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Kukjin Kim <kgene@kernel.org>,
	Krzysztof Kozlowski <k.kozlowski@samsung.com>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Daniel Mack <daniel@zonque.org>,
	Haojian Zhuang <haojian.zhuang@gmail.com>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>,
	Arnd Bergmann <arnd@arndb.de>, <helgaas@kernel.org>,
	Benoit Cousson <bcousson@baylibre.com>,
	Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Russell King <linux@armlinux.org.uk>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Greg Ungerer <gerg@uclinux.org>,
	<linux-samsung-soc@vger.kernel.org>,
	<linux-renesas-soc@vger.kernel.org>, <linux-omap@vger.kernel.org>,
	<devicetree@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>,
	<linux-kernel@vger.kernel.org>, <linux-pci@vger.kernel.org>,
	<nsekhar@ti.com>
Subject: Re: [RFT PATCH v2 2/3] ARM: Fix *MIGHT_HAVE_PCI* config from being selected redundantly
References: <1470049950-4697-1-git-send-email-kishon@ti.com>
	<1470049950-4697-3-git-send-email-kishon@ti.com>
Date: Mon, 01 Aug 2016 21:10:22 +0200
In-Reply-To: <1470049950-4697-3-git-send-email-kishon@ti.com> (Kishon Vijay
	Abraham, I's message of "Mon, 1 Aug 2016 16:42:29 +0530")
Message-ID: <87oa5cxq3l.fsf@belgarion.home>
MIME-Version: 1.0
Content-Type: text/plain
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Kishon Vijay Abraham I <kishon@ti.com> writes:

> *MIGHT_HAVE_PCI* config is already selected in ARCH_MULTIPLATFORM.
> Fix it from getting redundantly selected in all
> ARCH_MULTIPLATFORM based machines.

If that's the purpose, then CM-X255 and CM-X270 don't fall in that category, as
they are not part of ARCH_MULTIPLATFORM nor ready for it AFAIK. So the change
below shouldn't be done according to the commit message.

> diff --git a/arch/arm/mach-pxa/Kconfig b/arch/arm/mach-pxa/Kconfig
> index cd894d6..39f7755 100644
> --- a/arch/arm/mach-pxa/Kconfig
> +++ b/arch/arm/mach-pxa/Kconfig
> @@ -113,7 +113,6 @@ config MACH_ARMCORE
>  	bool "CompuLab CM-X255/CM-X270 modules"
>  	select ARCH_HAS_DMA_SET_COHERENT_MASK if PCI
>  	select IWMMXT
> -	select MIGHT_HAVE_PCI
>  	select NEED_MACH_IO_H if PCI
>  	select PXA25x
>  	select PXA27x

Cheers.

--
Robert
