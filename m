Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52831 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750786AbdGNHaG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Jul 2017 03:30:06 -0400
Date: Fri, 14 Jul 2017 09:29:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut@gmail.com>
Subject: Re: [PATCH] arm64: dts: renesas: salvator-xs: Add VC6 clock generator
Message-ID: <20170714072959.GG12105@verge.net.au>
References: <20170713110653.7606-1-laurent.pinchart+renesas@ideasonboard.com>
 <CAMuHMdWP_BN5PefaM0xqN8kPP6Q2+-UCPqZ8XxQ=OVkJJoXoRg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdWP_BN5PefaM0xqN8kPP6Q2+-UCPqZ8XxQ=OVkJJoXoRg@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 13, 2017 at 01:19:12PM +0200, Geert Uytterhoeven wrote:
> On Thu, Jul 13, 2017 at 1:06 PM, Laurent Pinchart
> <laurent.pinchart+renesas@ideasonboard.com> wrote:
> > The VC6 is an I2C-controlled programmable clock generator, used on the
> > board to provide a display dot clock. Add it to DT.
> >
> > Signed-off-by: Laurent Pinchart <laurent.pinchart+renesas@ideasonboard.com>
> 
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, applied for v4.14.
