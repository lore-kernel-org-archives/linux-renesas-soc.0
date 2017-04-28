Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45458 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1162886AbdD1FKM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 28 Apr 2017 01:10:12 -0400
Date: Fri, 28 Apr 2017 07:10:06 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        "linux-arm-kernel@lists.infradead.org"
        <linux-arm-kernel@lists.infradead.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH 0/9] ARM: dts: renesas: update PFC node name to
 pin-controller
Message-ID: <20170428051005.GA18349@verge.net.au>
References: <20170426100538.22060-1-horms+renesas@verge.net.au>
 <CAMuHMdVtMAMEjbEUA+ypwK5V+Sh+mEPs14_rUe0e4--sH=sTjw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdVtMAMEjbEUA+ypwK5V+Sh+mEPs14_rUe0e4--sH=sTjw@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Apr 26, 2017 at 01:20:52PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Apr 26, 2017 at 12:05 PM, Simon Horman
> <horms+renesas@verge.net.au> wrote:
> > The device trees for Renesas SoCs use either pfc or pin-controller as the
> > node name for the PFC device. This patch is intended to take a step towards
> > unifying the node name used as pin-controller which appears to be the more
> > generic of the two and thus more in keeping with the DT specs.
> >
> > My analysis is that this is a user-visible change to the extent that kernel
> > logs, and sysfs entries change from XXX.pfc and pfc@XXX to
> > XXX.pin-controller and pin-controller@XXX.
> >
> > Boot tested on:
> >  r8a73a4/ape6evm
> >  r8a7740/armadillo800evb
> >  r8a7778/bockw
> >  r8a7790/lager
> >  r8a7791/koelsch
> >  r8a7791/porter
> >  r8a7793/gose
> >  sh73a9/kzm9g
> >
> > Not tested on (due to lack of hw access):
> >  evm2/kzm9d
> >  r8a7789/marzen
> >
> > Simon Horman (9):
> 
> For the whole series:
> Reviewed-by: Geert Uytterhoeven <geert+renesas@glider.be>

Thanks, I have queued these up.
