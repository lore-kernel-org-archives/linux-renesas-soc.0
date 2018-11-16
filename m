Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48601 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728079AbeKQBJ6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Nov 2018 20:09:58 -0500
Date: Fri, 16 Nov 2018 06:57:13 -0800
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] arm64: defconfig: Enable CONFIG_PHY_RCAR_GEN3_PCIE
Message-ID: <20181116145713.76jiy23otiyq5bqc@verge.net.au>
References: <20181113152201.24476-1-geert+renesas@glider.be>
 <cb6b55cc-c91b-b3e2-bc04-d7dfb80cfa98@gmail.com>
 <20181115143347.f4wtdipdhhyooatu@verge.net.au>
 <9f303eb5-31a1-a3dc-66e9-645b46c5983c@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9f303eb5-31a1-a3dc-66e9-645b46c5983c@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 15, 2018 at 03:47:10PM +0100, Marek Vasut wrote:
> On 11/15/2018 03:33 PM, Simon Horman wrote:
> > On Wed, Nov 14, 2018 at 04:32:05PM +0100, Marek Vasut wrote:
> >> On 11/13/2018 04:22 PM, Geert Uytterhoeven wrote:
> >>> Enable R-Car Gen3 PCIe PHY support, which is needed for PCIe to function
> >>> on the Renesas Condor board.
> >>>
> >>> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> >>
> >> This helps
> >>
> >> Reviewed-by: Marek Vasut <marek.vasut@gmail.com>
> > 
> > Thanks, would it be better to use enable this driver as a module rather
> > than a built-in?
> 
> I think not, since the pcie-rcar cannot be compiled in as module, so the
> associated phy driver shouldn't be compiled in as module either.

Thanks Marek,

applied for v4.21.
