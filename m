Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44521 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751466AbdLMI0W (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 13 Dec 2017 03:26:22 -0500
Date: Wed, 13 Dec 2017 09:26:18 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [PATCH 3/3] arm64: dts: renesas: r8a7796: add reg properties to
 pciec[01] nodes
Message-ID: <20171213082617.wj343fwkfv6aporx@verge.net.au>
References: <20171212082436.12210-1-horms+renesas@verge.net.au>
 <20171212082436.12210-4-horms+renesas@verge.net.au>
 <CAMuHMdW6hPCT0J0PHvXkJos51=0QjWijebWZZ5C_cgKzNS5=6Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW6hPCT0J0PHvXkJos51=0QjWijebWZZ5C_cgKzNS5=6Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Dec 12, 2017 at 10:50:33AM +0100, Geert Uytterhoeven wrote:
> On Tue, Dec 12, 2017 at 9:24 AM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > Add reg properties to pciec[01] placeholder nodes
> >
> > This is to stop the compiler complaining as follows:
> > $ make
> > ...
> >   DTC     arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb
> > arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@fe000000 has a unit name, but no reg property
> > arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@ee800000 has a unit name, but no reg property
> > arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pcie@fe000000 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7796-salvator-x.dtb: Warning (simple_bus_reg): Node /soc/pcie@ee800000 missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@fe000000 has a unit name, but no reg property
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@ee800000 has a unit name, but no reg property
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pcie@fe000000 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb.dtb: Warning (simple_bus_reg): Node /soc/pcie@ee800000 missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@fe000000 has a unit name, but no reg property
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@ee800000 has a unit name, but no reg property
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pcie@fe000000 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7796-m3ulcb-kf.dtb: Warning (simple_bus_reg): Node /soc/pcie@ee800000 missing or empty reg/ranges property
> >   DTC     arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb
> > arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@fe000000 has a unit name, but no reg property
> > arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb: Warning (unit_address_vs_reg): Node /soc/pcie@ee800000 has a unit name, but no reg property
> > arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/pcie@fe000000 missing or empty reg/ranges property
> > arch/arm64/boot/dts/renesas/r8a7796-salvator-xs.dtb: Warning (simple_bus_reg): Node /soc/pcie@ee800000 missing or empty reg/ranges property
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
