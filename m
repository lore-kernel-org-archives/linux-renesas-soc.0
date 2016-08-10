Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [RFT RESEND PATCH v3 3/3] ARM: select PCI_DOMAINS config from
 ARCH_MULTIPLATFORM
To: Kishon Vijay Abraham I <kishon@ti.com>,
	Russell King <linux@armlinux.org.uk>,
	Benoit Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <1470832400-11929-1-git-send-email-kishon@ti.com>
 <1470832400-11929-4-git-send-email-kishon@ti.com>
Cc: Rob Herring <robh+dt@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Nicolas Ferre <nicolas.ferre@atmel.com>,
	Alexandre Belloni <alexandre.belloni@free-electrons.com>,
	Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
	Krzysztof Halasa <khalasa@piap.pl>,
	Kukjin Kim <kgene@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <kernel@pengutronix.de>,
	Fabio Estevam <fabio.estevam@nxp.com>,
	Santosh Shilimkar <ssantosh@kernel.org>,
	Simon Horman <horms@verge.net.au>,
	Magnus Damm <magnus.damm@gmail.com>,
	Viresh Kumar <vireshk@kernel.org>,
	Shiraz Hashim <shiraz.linux.kernel@gmail.com>, nsekhar@ti.com
From: Krzysztof Kozlowski <k.kozlowski@samsung.com>
Message-id: <cf4a7376-1cd4-aeb4-cbf0-7dbbc3575137@samsung.com>
Date: Wed, 10 Aug 2016 15:23:43 +0200
MIME-version: 1.0
In-reply-to: <1470832400-11929-4-git-send-email-kishon@ti.com>
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/10/2016 02:33 PM, Kishon Vijay Abraham I wrote:
> PCI_DOMAINS config should be selected for any SoCs
> having more than a single PCIe controller. Without PCI_DOMAINS
> config, only one PCIe controller gets registered.
> 
> Select PCI_DOMAINS in ARCH_MULTIPLATFORM if PCI is selected, since
> it doesn't harm even if a platform has a single PCIe port.
> Also remove PCI_DOMAINS being selected from other platform
> specific configs.
> 
> Signed-off-by: Kishon Vijay Abraham I <kishon@ti.com>
> ---
>  arch/arm/Kconfig               |    1 +
>  arch/arm/mach-axxia/Kconfig    |    1 -
>  arch/arm/mach-cns3xxx/Kconfig  |    1 -
>  arch/arm/mach-exynos/Kconfig   |    1 -
>  arch/arm/mach-imx/Kconfig      |    2 --
>  arch/arm/mach-keystone/Kconfig |    1 -
>  arch/arm/mach-shmobile/Kconfig |    1 -
>  7 files changed, 1 insertion(+), 7 deletions(-)

For Exynos5440 output is equal and we do not use PCI on other SoCs, so:

Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof
