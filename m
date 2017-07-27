Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from utopia.booyaka.com ([74.50.51.50]:43050 "EHLO
        utopia.booyaka.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751122AbdG0PNp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 27 Jul 2017 11:13:45 -0400
Date: Thu, 27 Jul 2017 15:07:03 +0000 (UTC)
From: Paul Walmsley <paul@pwsan.com>
To: Rob Herring <robh@kernel.org>
cc: arm@kernel.org, linux-kernel@vger.kernel.org,
        devicetree@vger.kernel.org, Russell King <linux@armlinux.org.uk>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <krzk@kernel.org>,
        Javier Martinez Canillas <javier@osg.samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Jason Cooper <jason@lakedaemon.net>,
        Andrew Lunn <andrew@lunn.ch>,
        Gregory Clement <gregory.clement@free-electrons.com>,
        Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>,
        Tony Lindgren <tony@atomide.com>,
        =?ISO-8859-15?Q?Beno=EEt_Cousson?= <bcousson@baylibre.com>,
        Heiko Stuebner <heiko@sntech.de>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-arm-kernel@lists.infradead.org,
        linux-samsung-soc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-rockchip@lists.infradead.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: Convert to using %pOF instead of full_name
In-Reply-To: <20170718214339.7774-1-robh@kernel.org>
Message-ID: <alpine.DEB.2.02.1707271506200.23088@utopia.booyaka.com>
References: <20170718214339.7774-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: TEXT/PLAIN; charset=US-ASCII
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, 18 Jul 2017, Rob Herring wrote:

> Now that we have a custom printf format specifier, convert users of
> full_name to use %pOF instead. This is preparation to remove storing
> of the full path string for each node.

Acked-by: Paul Walmsley <paul@pwsan.com>  # for mach-omap2/omap-hwmod.c

- Paul
