Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:33504 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751662AbdJEJG6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Oct 2017 05:06:58 -0400
Date: Thu, 5 Oct 2017 11:06:27 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-common: add pfc node for
 USB3.0 channel 0
Message-ID: <20171005090626.GD26369@verge.net.au>
References: <1507017672-21493-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
 <CAMuHMdUz78BmySULe_wizFEhFAtiBiQLZ9Ov++S94+yb4YpxDg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUz78BmySULe_wizFEhFAtiBiQLZ9Ov++S94+yb4YpxDg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Oct 04, 2017 at 03:53:36PM +0200, Geert Uytterhoeven wrote:
> On Tue, Oct 3, 2017 at 10:01 AM, Yoshihiro Shimoda
> <yoshihiro.shimoda.uh@renesas.com> wrote:
> > Since a R-Car Gen3 bootloader enables the PFC of USB3.0 channel 0,
> > the USB3.0 host controller works without this setting on the kernel.
> > But, this setting should have salvator-common.dtsi. So, this patch
> > adds the pfc node for USB3.0 channel 0.
> >
> > Signed-off-by: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
