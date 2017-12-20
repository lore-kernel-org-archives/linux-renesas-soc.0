Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52955 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753269AbdLTJby (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Dec 2017 04:31:54 -0500
Date: Wed, 20 Dec 2017 10:31:50 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 2/2] ARM: dts: r8a7745: move timer node out of bus
Message-ID: <20171220093149.kqcage4rr3an56ww@verge.net.au>
References: <20171218215044.13088-1-horms+renesas@verge.net.au>
 <20171218215044.13088-3-horms+renesas@verge.net.au>
 <CAMuHMdUELsg=qPrho-SmekY_d24q9waUwGS90HFEKQsSV1w7=w@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUELsg=qPrho-SmekY_d24q9waUwGS90HFEKQsSV1w7=w@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 19, 2017 at 09:45:05AM +0100, Geert Uytterhoeven wrote:
> On Mon, Dec 18, 2017 at 10:50 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > The timer node does not have any register properties and thus shouldn't be
> > placed on the bus.
> >
> > This problem is flagged by the compiler as follows:
> > $ make dtbs W=1
> > ...
> > arch/arm/boot/dts/r8a7745-iwg22d-sodimm.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> > arch/arm/boot/dts/r8a7745-iwg22d-sodimm-dbhd-ca.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> >   DTC     arch/arm/boot/dts/r8a7745-sk-rzg1e.dtb
> > arch/arm/boot/dts/r8a7745-sk-rzg1e.dtb: Warning (simple_bus_reg): Node /soc/timer missing or empty reg/ranges property
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
