Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:47685 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750763AbdAXMdL (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jan 2017 07:33:11 -0500
Date: Tue, 24 Jan 2017 13:33:05 +0100
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Chris Brandt <chris.brandt@renesas.com>,
        Magnus Damm <magnus.damm@gmail.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>
Subject: Re: [PATCH] ARM: dts: r7s72100: add power-domains to mmcif
Message-ID: <20170124123304.GC20529@verge.net.au>
References: <20170123141349.29844-1-chris.brandt@renesas.com>
 <CAMuHMdULpxoNaTUX2Dc7R=d+FUb_V45H9=XXfsW3RKBTowE4Uw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdULpxoNaTUX2Dc7R=d+FUb_V45H9=XXfsW3RKBTowE4Uw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jan 23, 2017 at 04:12:16PM +0100, Geert Uytterhoeven wrote:
> On Mon, Jan 23, 2017 at 3:13 PM, Chris Brandt <chris.brandt@renesas.com> wrote:
> > Signed-off-by: Chris Brandt <chris.brandt@renesas.com>
> 
> Reported-by: Geert Uytterhoeven <geert+renesas@glider.be>
> Acked-by: Geert Uytterhoeven <geert+renesas@glider.be>

Should this be queued up as a fix for v4.10 with the following tag?

Fixes: 887862227ba3 ("ARM: dts: r7s72100: add mmcif to device tree")
