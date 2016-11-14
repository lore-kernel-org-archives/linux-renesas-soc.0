Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:34800 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752158AbcKNKhc (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 14 Nov 2016 05:37:32 -0500
Date: Mon, 14 Nov 2016 11:37:26 +0100
From: Simon Horman <horms@verge.net.au>
To: Greg KH <gregkh@linuxfoundation.org>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT/RFC PULL LTSI-4.9] Renesas SoCs and Drivers to
 next-20161028
Message-ID: <20161114103726.GA11439@verge.net.au>
References: <20161114090343.GA17137@verge.net.au>
 <20161114091652.GB18318@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161114091652.GB18318@kroah.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Nov 14, 2016 at 10:16:52AM +0100, Greg KH wrote:
> On Mon, Nov 14, 2016 at 10:03:44AM +0100, Simon Horman wrote:
> > Hi,
> > 
> > ** This series is for informational purposes only! **
> > 
> > This series is comprised of backports to v4.9-rc3 of the following
> > components to their standard as of next-20161028:
> > 
> > * gen3          (ARM64 SoC Integration)
> > * mach-shmobile (ARM32 SoC Integration)
> > * rcar-du       (driver)
> > * rcar-snd      (driver)
> > * vsp1          (driver)
> > 
> > 
> > It is intended as a dry-run for backporting components used
> > by Renesas SoCs from v4.10 and beyond to v4.9, an activity that
> > I anticipate carrying out in the event that the next LTSI release
> > is to be based on v4.9.
> > 
> > In posting this work I am not implying anything about
> > decisions on the base of the LTSI release will be.
> 
> Very nice to see!
> 
> And yes, I'm hoping that 4.9 will be the next LTSI release, as it is
> looking good from my side to make 4.9 the next LTS kernel release.  If
> you see anything that might be a problem with 4.9 for your platforms,
> please let me know.

Thanks Greg,

That is good to know.

I will double check but I don't see any problems at this time.
