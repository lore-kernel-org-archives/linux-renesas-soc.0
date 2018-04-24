Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:32976 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751097AbeDXJ1R (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Apr 2018 05:27:17 -0400
Date: Tue, 24 Apr 2018 11:27:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH 00/04] arm64: dts: renesas: Enable IPMMU devices
Message-ID: <20180424092712.dbrd7ih4jfxglv4z@verge.net.au>
References: <152439168688.19829.5853068596124565316.sendpatchset@little-apple>
 <CAMuHMdU3eye_jaYA1nb72swAhwZoYSYw3WQ0fpXVOUZumO1Qjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdU3eye_jaYA1nb72swAhwZoYSYw3WQ0fpXVOUZumO1Qjw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Apr 23, 2018 at 09:56:06AM +0200, Geert Uytterhoeven wrote:
> Hi Magnus,
> 
> On Sun, Apr 22, 2018 at 12:08 PM, Magnus Damm <magnus.damm@gmail.com> wrote:
> > arm64: dts: renesas: Enable IPMMU devices
> >
> > [PATCH 01/04] arm64: dts: renesas: r8a7795: Enable IPMMU devices
> > [PATCH 02/04] arm64: dts: renesas: r8a7796: Enable IPMMU devices
> > [PATCH 03/04] arm64: dts: renesas: r8a77970: Enable IPMMU devices
> > [PATCH 04/04] arm64: dts: renesas: r8a77995: Enable IPMMU devices
> >
> > Following the policy of using DT to describe the hardware and not software
> > support state, ...
> 
> Good policy! So "[PATCH 0/2] arm64: dts: renesas: r8a77970: Add SMP Support"
> can be applied, too?
> 
> > ... this series makes sure all IPMMU devices are enabled in DT
> > for SoCs such as r8a7795, r8a7796, r8a77970 and r8a77995.
> 
> BTW, do you plan to fix arch/arm64/boot/dts/renesas/r8a7795-es1.dtsi, too?

I took the liberty of posting a patch to do that.
