Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from comal.ext.ti.com ([198.47.26.152]:54791 "EHLO comal.ext.ti.com"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1757841AbcH3LHE (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Aug 2016 07:07:04 -0400
Subject: Re: [RESEND PATCH v3 1/3] ARM: dts: DRA7: Add "linux,pci-domain"
 property for pci dt nodes
To: Tony Lindgren <tony@atomide.com>
References: <1470832400-11929-1-git-send-email-kishon@ti.com>
 <1470832400-11929-2-git-send-email-kishon@ti.com>
 <20160826153035.h6uyplc4mjlbc3v3@atomide.com>
CC: Russell King <linux@armlinux.org.uk>,
        Benoit Cousson <bcousson@baylibre.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <devicetree@vger.kernel.org>, <linux-samsung-soc@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        Nicolas Ferre <nicolas.ferre@atmel.com>,
        Alexandre Belloni <alexandre.belloni@free-electrons.com>,
        Jean-Christophe Plagniol-Villard <plagnioj@jcrosoft.com>,
        Krzysztof Halasa <khalasa@piap.pl>,
        Kukjin Kim <kgene@kernel.org>,
        Krzysztof Kozlowski <k.kozlowski@samsung.com>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <kernel@pengutronix.de>,
        Fabio Estevam <fabio.estevam@nxp.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        Viresh Kumar <vireshk@kernel.org>,
        Shiraz Hashim <shiraz.linux.kernel@gmail.com>, <nsekhar@ti.com>
From: Kishon Vijay Abraham I <kishon@ti.com>
Message-ID: <57C5687C.8030805@ti.com>
Date: Tue, 30 Aug 2016 16:35:32 +0530
MIME-Version: 1.0
In-Reply-To: <20160826153035.h6uyplc4mjlbc3v3@atomide.com>
Content-Type: text/plain; charset="windows-1252"
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Tony,

On Friday 26 August 2016 09:00 PM, Tony Lindgren wrote:
> * Kishon Vijay Abraham I <kishon@ti.com> [160810 05:34]:
>> Since DRA7 has multiple PCIe Rootcomplex, add "linux,pci-domain"
>> property to assign a PCI domain number to each of the host
>> bridges.
> 
> Is this patch safe to apply without the other changes?

Yes. I verified pcie on dra7x by applying only this patch and it doesn't break
anything.

Thanks
Kishon
