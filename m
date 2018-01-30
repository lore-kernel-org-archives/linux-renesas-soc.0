Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:49693 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752868AbeA3Qpk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 30 Jan 2018 11:45:40 -0500
Date: Tue, 30 Jan 2018 17:45:36 +0100
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [PATCH v2 0/9] ARM: dts: gen2: add IP core switcher for all
 busses
Message-ID: <20180130164536.a6us6f4lyfq7vq6a@verge.net.au>
References: <20171231112320.3461-1-wsa+renesas@sang-engineering.com>
 <20180130105135.3vxze4xrjvfmvtwq@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180130105135.3vxze4xrjvfmvtwq@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jan 30, 2018 at 11:51:37AM +0100, Wolfram Sang wrote:
> On Sun, Dec 31, 2017 at 12:23:11PM +0100, Wolfram Sang wrote:
> > Here is the updated series to add the I2C IP core switcher to all busses of
> > Gen2 boards where some kind of switching is possible (mostly to/from GPIO).
> > 
> > These patches were tested locally on Lager and Alt, and remotely on Koelsch,
> > Porter and Gose. We have no Silk board available but the patch follows the same
> > style as the other patches. In addition, these patches have been double-checked
> > by vimdiff-comparing the i2c-bus blobs before and after this patchset.
> > 
> > As discussed previously: the tested boards boot fine. No regression encountered
> > there. However, changing masters at runtime for HDMI-named busses and PWR-named
> > busses will likely cause kernel warnings and maybe OOPSes. This is due to the
> > rebind-issues in the V4L and regulator subsystems. For the former, fixing is
> > WIP. For the latter, it is unknown how to deal with rebinding in general (but
> > I'd need to look at this issue again if this is desired). It was decided that
> > we consider those follow-up problems which should not hold back these patches
> > anymore. The EXIO named busses seemed to work fine as far as this could be
> > remotely tested.
> > 
> > Changes since V1:
> > 
> > * fixed I2C4 pinmux for Koelsch and Gose (thanks Geert for the report!)
> > * rebased to current renesas/dt-for-v4.16
> > * fixed typo in branch name (s/topc/topic/)
> > 
> > The branch can be found here:
> > 
> > git://git.kernel.org/pub/scm/linux/kernel/git/wsa/linux.git renesas/topic/ip-switch-rework-2017
> > 
> > It is based on v4.15-rc1 + renesas/dt-for-v4.16 merged in.
> > 
> > Please review, comment...
> 
> Simon, any issues left before applying this series?

I'm a bit uncomfortable about the OOpses, but if that was the consensus
(in San Sebastian?) then I'm happy to accept these patches.

Could you rebase the series? It does not seem to apply (likely due to my
recent clean-up efforts).
