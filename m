Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46006 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S936350AbeF2Ork (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 29 Jun 2018 10:47:40 -0400
Date: Fri, 29 Jun 2018 16:47:36 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH] arm64: dts: renesas: r8a77965: Add second port to
 rcar_sound placeholder
Message-ID: <20180629144734.23zhak4uhxr4sgdk@verge.net.au>
References: <20180628124259.12760-1-horms+renesas@verge.net.au>
 <CAMuHMdVBbQ-rHHcdkw=3_+Dng-sOdnV4uyQ7bGXT_FNWte67Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVBbQ-rHHcdkw=3_+Dng-sOdnV4uyQ7bGXT_FNWte67Fw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jun 28, 2018 at 03:33:59PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jun 28, 2018 at 2:43 PM Simon Horman <horms+renesas@verge.net.au> wrote:
> > This node is just a placeholder but fills that function better if it does
> > not trigger build warnings. This update satisfies the requirement that
> > nodes with #address-cells/#size-cells properties have more than one child
> > node.
> >
> > This is flagged by dtc as follows:
> >  # make dtbs W=1
> >  arch/arm64/boot/dts/renesas/r8a77965-salvator-x.dtb: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> >  arch/arm64/boot/dts/renesas/r8a77965-salvator-xs.dtb: Warning (graph_child_address): /soc/sound@ec500000/ports: graph node has single child node 'port@0', #address-cells/#size-cells are not necessary
> >
> > Signed-off-by: Simon Horman <horms+renesas@verge.net.au>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied.
