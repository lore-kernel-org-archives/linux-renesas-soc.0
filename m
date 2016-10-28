Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:53121 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750807AbcJ1Foh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Oct 2016 01:44:37 -0400
Date: Fri, 28 Oct 2016 07:44:30 +0200
From: Simon Horman <horms@verge.net.au>
To: Magnus Damm <magnus.damm@gmail.com>
Cc: "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Arnd Bergmann <arnd@arndb.de>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will.deacon@arm.com>,
        linux-kernel <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
        khilman@baylibre.com
Subject: Re: [PATCH] arm64: defconfig: Enable DRM DU and V4L2 FCP + VSP
 modules
Message-ID: <20161028054430.GA1106@verge.net.au>
References: <20161026052422.17283.57864.sendpatchset@little-apple>
 <20161027070801.GB7706@verge.net.au>
 <20161027071523.GD7706@verge.net.au>
 <CANqRtoTizLGYSgY-EV_DwC+yeqeuAsuBKPwXXW6zqwqpHM3MfA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CANqRtoTizLGYSgY-EV_DwC+yeqeuAsuBKPwXXW6zqwqpHM3MfA@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Oct 27, 2016 at 04:37:53PM +0900, Magnus Damm wrote:
> Hi Simon,
> 
> On Thu, Oct 27, 2016 at 4:15 PM, Simon Horman <horms@verge.net.au> wrote:
> > On Thu, Oct 27, 2016 at 09:08:01AM +0200, Simon Horman wrote:
> >> On Wed, Oct 26, 2016 at 02:24:22PM +0900, Magnus Damm wrote:
> >> > From: Magnus Damm <damm+renesas@opensource.se>
> >> >
> >> > Extend the ARM64 defconfig to enable the DU DRM device as module
> >> > together with required dependencies of V4L2 FCP and VSP modules.
> >> >
> >> > This enables VGA output on the r8a7795 Salvator-X board.
> >> >
> >> > Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
> >>
> >> Thanks, I have queued this up.
> >
> > Given discussion elsewhere on enabling DU I am holding off on this for a
> > little; it is not queued up for now.
> 
> Sure, thanks for holding off the DT integration patches for r8a7796.
> Please note that as of mainline v4.9-rc2 the r8a7795 Salvator-X board
> has thanks to DU, FCP and VSP a working VGA port. So enabling those
> devices in the defconfig from now on makes sense to me.

Understood, I have queued this up.
