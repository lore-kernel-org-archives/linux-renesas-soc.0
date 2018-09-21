Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from smtp1.de.adit-jv.com ([62.225.105.245]:53452 "EHLO
        smtp1.de.adit-jv.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2391160AbeIVBjJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 21 Sep 2018 21:39:09 -0400
Date: Fri, 21 Sep 2018 21:48:33 +0200
From: Eugeniu Rosca <erosca@de.adit-jv.com>
To: Marc Kleine-Budde <mkl@pengutronix.de>
CC: Simon Horman <horms+renesas@verge.net.au>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Wolfgang Grandegger <wg@grandegger.com>,
        "David S . Miller" <davem@davemloft.net>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        <linux-can@vger.kernel.org>, <netdev@vger.kernel.org>,
        <devicetree@vger.kernel.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        <linux-renesas-soc@vger.kernel.org>,
        Eugeniu Rosca <rosca.eugeniu@gmail.com>,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH v3 net-next] dt-bindings: can: rcar_can: document
 r8a77965 support
Message-ID: <20180921194833.GA28500@vmlxhi-102.adit-jv.com>
References: <20180820144910.13210-1-erosca@de.adit-jv.com>
 <50048177-96ad-cbda-6845-20ffc32d025a@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <50048177-96ad-cbda-6845-20ffc32d025a@pengutronix.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Marc,

On Mon, Aug 27, 2018 at 12:08:48PM +0200, Marc Kleine-Budde wrote:
> On 08/20/2018 04:49 PM, Eugeniu Rosca wrote:
> > From: Eugeniu Rosca <rosca.eugeniu@gmail.com>
> > 
> > Document the support for rcar_can on R8A77965 SoC devices.
> > Add R8A77965 to the list of SoCs which require the "assigned-clocks" and
> > "assigned-clock-rates" properties (thanks, Sergei).
> > 
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > Reviewed-by: Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
> 
> Added to linux-can.

I can't find the patch in below repositories:
 - https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can.git
 - https://git.kernel.org/pub/scm/linux/kernel/git/mkl/linux-can-next.git

Could you please let me know what "linux-can" means?

> 
> Marc
> 
> -- 
> Pengutronix e.K.                  | Marc Kleine-Budde           |
> Industrial Linux Solutions        | Phone: +49-231-2826-924     |
> Vertretung West/Dortmund          | Fax:   +49-5121-206917-5555 |
> Amtsgericht Hildesheim, HRA 2686  | http://www.pengutronix.de   |

Thanks,
Eugeniu.
