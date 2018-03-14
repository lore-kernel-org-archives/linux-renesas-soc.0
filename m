Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35064 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751673AbeCNOo1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 14 Mar 2018 10:44:27 -0400
Date: Wed, 14 Mar 2018 15:44:23 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Rob Herring <robh+dt@kernel.org>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS"
        <devicetree@vger.kernel.org>, Magnus Damm <magnus.damm@gmail.com>,
        Mark Rutland <mark.rutland@arm.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: renesas: v3msk: add SCIF0 pins
Message-ID: <20180314144420.3vlufrr45amuzokw@verge.net.au>
References: <d21e29c9-1364-357e-dd64-af14b0068cbd@cogentembedded.com>
 <CAMuHMdW6CwF25pPXQqMKy=ZdV0oPDrxyEnt8p_NWjDT=ZSOS8Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdW6CwF25pPXQqMKy=ZdV0oPDrxyEnt8p_NWjDT=ZSOS8Q@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Mar 14, 2018 at 02:14:27PM +0100, Geert Uytterhoeven wrote:
> On Tue, Mar 13, 2018 at 8:26 PM, Sergei Shtylyov
> <sergei.shtylyov@cogentembedded.com> wrote:
> > Add the (previously omitted) SCIF0 pin data to the V3M Starter Kit board's
> > device tree.
> >
> > Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
