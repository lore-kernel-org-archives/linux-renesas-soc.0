Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60179 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726846AbeKNAdc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 19:33:32 -0500
Date: Tue, 13 Nov 2018 06:35:04 -0800
From: Simon Horman <horms@verge.net.au>
To: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Richard Weinberger <richard@nod.at>,
        Boris Brezillon <boris.brezillon@bootlin.com>,
        Brian Norris <computersforpeace@gmail.com>,
        David Woodhouse <dwmw2@infradead.org>,
        Marek Vasut <marek.vasut@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Brown <broonie@kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-spi@vger.kernel.org,
        devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-mtd@lists.infradead.org,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Biju Das <biju.das@bp.renesas.com>
Subject: Re: [PATCH v2 2/3] ARM: dts: r8a77470: Add QSPI support
Message-ID: <20181113143504.b47unq3p23bvzzsc@verge.net.au>
References: <1541696684-21235-1-git-send-email-fabrizio.castro@bp.renesas.com>
 <1541696684-21235-3-git-send-email-fabrizio.castro@bp.renesas.com>
 <20181109100556.3yh7lkg5ehnbkrzi@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181109100556.3yh7lkg5ehnbkrzi@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Nov 09, 2018 at 11:05:56AM +0100, Simon Horman wrote:
> On Thu, Nov 08, 2018 at 05:04:42PM +0000, Fabrizio Castro wrote:
> > Add QSPI[01] support to the RZ/G1C SoC specific device tree.
> > 
> > Signed-off-by: Fabrizio Castro <fabrizio.castro@bp.renesas.com>
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again,

applied for v4.21.
