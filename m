Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:34100 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726556AbeHFAw1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 5 Aug 2018 20:52:27 -0400
Received: by mail-wr1-f67.google.com with SMTP id c13-v6so10591243wrt.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 05 Aug 2018 15:46:13 -0700 (PDT)
From: Eugeniu Rosca <roscaeugeniu@gmail.com>
Date: Mon, 6 Aug 2018 00:46:10 +0200
To: jacopo mondi <jacopo@jmondi.org>
Cc: Eugeniu Rosca <roscaeugeniu@gmail.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Vladimir Barinov <vladimir.barinov@cogentembedded.com>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        Jacopo Mondi <jacopo+renesas@jmondi.org>,
        Magnus Damm <damm+renesas@opensource.se>,
        Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        linux-renesas-soc@vger.kernel.org,
        Eugeniu Rosca <erosca@de.adit-jv.com>
Subject: Re: [PATCH 14/14] arm64: dts: renesas: r8a77965: ulcb-kf: Initial
 device tree
Message-ID: <20180805224610.GB15682@x230>
References: <20180804231114.21420-1-erosca@de.adit-jv.com>
 <20180804231114.21420-15-erosca@de.adit-jv.com>
 <20180805090136.GD9285@w540>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180805090136.GD9285@w540>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Jacopo,

On Sun, Aug 05, 2018 at 11:01:36AM +0200, jacopo mondi wrote:
> Hi Eugeniu,
> 
> On Sun, Aug 05, 2018 at 01:11:14AM +0200, Eugeniu Rosca wrote:
> > Signed-off-by: Eugeniu Rosca <erosca@de.adit-jv.com>
> > ---
> >  arch/arm64/boot/dts/renesas/Makefile             |  1 +
> >  arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts | 20 ++++++++++++++++++++
> >  2 files changed, 21 insertions(+)
> >
> > diff --git a/arch/arm64/boot/dts/renesas/Makefile b/arch/arm64/boot/dts/renesas/Makefile
> > index ad7be9a8ca56..3e2c5be65a14 100644
> > --- a/arch/arm64/boot/dts/renesas/Makefile
> > +++ b/arch/arm64/boot/dts/renesas/Makefile
> > @@ -9,6 +9,7 @@ dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-ulcb-kf.dtb
> >  dtb-$(CONFIG_ARCH_R8A7796) += r8a7796-salvator-xs.dtb
> >  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-salvator-x.dtb r8a77965-salvator-xs.dtb
> >  dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb.dtb
> > +dtb-$(CONFIG_ARCH_R8A77965) += r8a77965-ulcb-kf.dtb
> >  dtb-$(CONFIG_ARCH_R8A77970) += r8a77970-eagle.dtb r8a77970-v3msk.dtb
> >  dtb-$(CONFIG_ARCH_R8A77980) += r8a77980-condor.dtb r8a77980-v3hsk.dtb
> >  dtb-$(CONFIG_ARCH_R8A77990) += r8a77990-ebisu.dtb
> > diff --git a/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> > new file mode 100644
> > index 000000000000..5c719fb87d8b
> > --- /dev/null
> > +++ b/arch/arm64/boot/dts/renesas/r8a77965-ulcb-kf.dts
> > @@ -0,0 +1,20 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Device Tree Source for the M3-N ULCB Kingfisher board
> > + *
> > + * Copyright (C) 2018 Renesas Electronics Corp.
> > + * Copyright (C) 2018 Cogent Embedded, Inc.
> > + *
> > + * This file is licensed under the terms of the GNU General Public License
> > + * version 2.  This program is licensed "as is" without any warranty of any
> > + * kind, whether express or implied.
> > + */
> 
> Drop the license text please :)

I will. Thanks!

> 
> Thanks
>   j
> > +
> > +#include "r8a77965-ulcb.dts"
> > +#include "ulcb-kf.dtsi"
> > +
> > +/ {
> > +	model = "Renesas ULCB Kingfisher board based on r8a77965";
> > +	compatible = "shimafuji,kingfisher", "renesas,ulcb",
> > +		     "renesas,r8a77965";
> > +};
> > --
> > 2.18.0
> >

Best regards,
Eugeniu.
