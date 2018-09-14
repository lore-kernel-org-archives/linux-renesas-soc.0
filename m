Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32977 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727623AbeINSui (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Sep 2018 14:50:38 -0400
Date: Fri, 14 Sep 2018 15:36:01 +0200
From: Simon Horman <horms@verge.net.au>
To: Phil Edworthy <phil.edworthy@renesas.com>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>, devicetree@vger.kernel.org
Subject: Re: [PATCH v2] ARM: dts: r9a06g032: Correct UART and add all other
 UARTs
Message-ID: <20180914133600.nhbgbmxiafc65abw@verge.net.au>
References: <20180910160254.3882-1-phil.edworthy@renesas.com>
 <20180912092035.lhzlebd6rh72yjgj@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180912092035.lhzlebd6rh72yjgj@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Sep 12, 2018 at 11:20:39AM +0200, Simon Horman wrote:
> On Mon, Sep 10, 2018 at 05:02:54PM +0100, Phil Edworthy wrote:
> > - UART0 was missing the bus clock ("apb_pclk").
> > - Now that the relevant rzn1 bindings have been added, replace the Synopsys
> >   compat string with the rzn1 strings.
> 
> Perhaps: Use recently accepted r9a06g032 and rzn1 compat strings.
> 
> > - Add all the other UARTs.
> > 
> > Signed-off-by: Phil Edworthy <phil.edworthy@renesas.com>
> 
> The above notwithstanding this looks good to me but I will wait to see if
> there are other reviews before applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks again, I have applied this for v4.20 with the changelog
update above.
