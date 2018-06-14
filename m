Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55859 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754616AbeFNHaN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 14 Jun 2018 03:30:13 -0400
Date: Thu, 14 Jun 2018 09:30:09 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-renesas-soc@vger.kernel.org"
        <linux-renesas-soc@vger.kernel.org>,
        Kuninori Morimoto <kuninori.morimoto.gx@gmail.com>
Subject: Re: [PATCH 1/3] arm64: dts: renesas: convert to SPDX identifiers
Message-ID: <20180614073007.25j4vflj3kcxm42j@verge.net.au>
References: <20180611144937.9554-1-wsa+renesas@sang-engineering.com>
 <20180611144937.9554-2-wsa+renesas@sang-engineering.com>
 <OSBPR01MB2293324289A8C59EB59CB906D87F0@OSBPR01MB2293.jpnprd01.prod.outlook.com>
 <20180613111228.csaxbkfz5t2upkyd@verge.net.au>
 <20180614014229.udh4gbl7iqw3nvl5@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180614014229.udh4gbl7iqw3nvl5@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 14, 2018 at 10:42:30AM +0900, Wolfram Sang wrote:
> Hi Simon,
> 
> > I applied this by hand, resolving the conflict in r8a7796.dtsi.
> 
> Thanks for doing this Simon.
> 
> > The result is below. Wolfram, please check it.
> 
> I am afraid there is something missing, though...
> 
> >  arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dts    | 5 +----
> >  arch/arm64/boot/dts/renesas/r8a7796.dtsi               | 4 ----
> >  arch/arm64/boot/dts/renesas/r8a77970-eagle.dts         | 5 +----
> 
> See the broken pattern in the diffstat?
> 
> > diff --git a/arch/arm64/boot/dts/renesas/r8a7796.dtsi b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > index 2a04635bc9ae..03319d008ba1 100644
> > --- a/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > +++ b/arch/arm64/boot/dts/renesas/r8a7796.dtsi
> > @@ -2,10 +2,6 @@
> >   * Device Tree Source for the r8a7796 SoC
> >   *
> >   * Copyright (C) 2016-2017 Renesas Electronics Corp.
> > - *
> > - * This file is licensed under the terms of the GNU General Public License
> > - * version 2.  This program is licensed "as is" without any warranty of any
> > - * kind, whether express or implied.
> >   */
> 
> The actual SPDX identifier like this
> 
> > +// SPDX-License-Identifier: GPL-2.0
> 
> got accidently dropped.

Thanks, should be fixed the next time I push.
