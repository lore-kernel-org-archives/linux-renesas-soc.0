Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51095 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387503AbeHBQeN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 2 Aug 2018 12:34:13 -0400
Date: Thu, 2 Aug 2018 16:42:40 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert@linux-m68k.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT/RFC PULL LTSI-4.14] Renesas SoCs and Drivers to
 v4.18-rc6
Message-ID: <20180802144239.khh5rhdn4si5rqgo@verge.net.au>
References: <20180725152244.fykhouzwpr5mmlpy@verge.net.au>
 <CAMuHMdUB5Nzab1cc+_i2akhebgpcaD=ivFLViUjE7k+4T0ez3g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMuHMdUB5Nzab1cc+_i2akhebgpcaD=ivFLViUjE7k+4T0ez3g@mail.gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 31, 2018 at 05:25:20PM +0200, Geert Uytterhoeven wrote:
> Hi Simon,
> 
> On Wed, Jul 25, 2018 at 5:23 PM Simon Horman <horms@verge.net.au> wrote:
> > ** This series is for informational purposes only! **
> >
> > This series is comprised of backports to v4.14.57 of the components used by
> > Renesas SoCs to their standard as of v4.18-rc6, selected dependencies for
> > those backports and selected post-v4.18-rc6 fixes as detailed in the git
> > changelog text below.
> >
> > This is intended as dry-run of backports components used by
> > Renesas SoCs from v4.18 to v4.14.57.
> >
> > There are 1601 patches.
> >
> > As this work is for informational purposes I do not expect these patches
> > to be imported to quilt by Greg at this time. However, if you would like to
> > do so and rebasing would help please feel free to ask me to do so.
> >
> > I do plan to post an updated version of this work once the
> > LTSI-4.14 merge window opens. As part of that work I intend
> > to address the following known problems:
> >
> > * R-Car H1 / Marzen does not boot to user-space due to an upstream
> >   regression in the R-Car Thermal driver which I have posted a fix for.
> >
> >   "[PATCH] thermal: rcar_thermal: avoid NULL dereference in absense of IRQ
> >   resources"
> >
> > * "xhci: Fix use-after-free in xhci_free_virt_device" is already
> >   present in v4.14.57 and should be dropped from these backports.
> >
> > I have performed build testing of this backports on a wide range of
> > backports. And boot-to-userspace testing on a wide range of boards
> > based on Renesas SoCs. The only regression that testing highlighted
> > is that on Marzen as highlighted above.
> >
> >
> > The following changes since commit ecc160ece609498c946e73710e5c7c54c62b966a:
> >
> >   Linux 4.14.57 (2018-07-22 14:28:52 +0200)
> >
> > are available in the git repository at:
> >
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git backport/v4.14.57/snapshot-to-v4.18-rc6+fixes-flattened
> 
> Thank you!
> 
> I subjected this to the same testing I do for each renesas-drivers release.
> I have detected no regressions from v4.14.48, only increased functionality.

Thanks, this feedback is very valuable.
