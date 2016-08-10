Return-Path: <devicetree-owner@vger.kernel.org>
Subject: Re: [RFT RESEND PATCH v3 2/3] ARM: Fix *MIGHT_HAVE_PCI* config from
 being selected redundantly
To: Kishon Vijay Abraham I <kishon@ti.com>,
	Russell King <linux@armlinux.org.uk>,
	Benoit Cousson <bcousson@baylibre.com>,
	Tony Lindgren <tony@atomide.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-omap@vger.kernel.org, devicetree@vger.kernel.org,
	linux-samsung-soc@vger.kernel.org,
	linux-renesas-soc@vger.kernel.org
References: <1470832400-11929-1-git-send-email-kishon@ti.com>
 <1470832400-11929-3-git-send-email-kishon@ti.com>
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
Message-id: <e2e7e471-190d-a685-e496-1ab3e1d3a333@samsung.com>
Date: Wed, 10 Aug 2016 15:08:05 +0200
MIME-version: 1.0
In-reply-to: <1470832400-11929-3-git-send-email-kishon@ti.com>
Content-type: text/plain; charset=windows-1252
Content-transfer-encoding: 7bit
Sender: devicetree-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/10/2016 02:33 PM, Kishon Vijay Abraham I wrote:
> *MIGHT_HAVE_PCI* config is already selected in ARCH_MULTIPLATFORM.
> Fix it from getting redundantly selected in all

I don't like the "fix" here and in subject. There is no error, no
warning, no issue to be fixed. Fix might be a candidate to backport
(stable, vendor etc) but this just removes something which is not needed.

With the change in subject, for exynos:
Acked-by: Krzysztof Kozlowski <k.kozlowski@samsung.com>

Best regards,
Krzysztof

