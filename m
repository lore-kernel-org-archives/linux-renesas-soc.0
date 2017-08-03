Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44584 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751582AbdHCHpQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 3 Aug 2017 03:45:16 -0400
Date: Thu, 3 Aug 2017 09:45:11 +0200
From: Simon Horman <horms@verge.net.au>
To: Greg KH <greg@kroah.com>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.12
Message-ID: <20170803074511.GD19671@verge.net.au>
References: <20170710133333.GC27613@verge.net.au>
 <20170803015504.GC3031@kroah.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170803015504.GC3031@kroah.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Aug 02, 2017 at 06:55:04PM -0700, Greg KH wrote:
> On Mon, Jul 10, 2017 at 03:33:34PM +0200, Simon Horman wrote:
> > Hi,
> > 
> > This is a submission to LTSI-v4.9.
> > 
> > This series is comprised of backports to v4.9 of the following
> > components to their standard as of v4.12:
> > 
> > It is a follow up to early preparatory work the main difference being
> > a rebase onto v4.9.36. This is a follow-up to a similar submission
> > backporting Renesas SoCs and Drivers to v4.10. I plan to follow-up with
> > a backport to v4.12.
> > 
> > I have tested for build regressions on a wide range of defconfigs
> > on a wide range of architectures.
> > 
> > There are 286 patches.
> > 
> > This is based on a similar backports to v4.11 which is in turn based on v4.9.36.
> > That work was posted as "[GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.11"
> > and is tagged as tags/backport/v4.9.36/snapshot-to-v4.11-flattened
> > 
> > 
> > The following changes since commit 338ec844533e7bb1120f88f83a3fcc1d9618eef7:
> > 
> >   drm: bridge: dw-hdmi: fix building without CONFIG_OF (2017-07-10 14:51:26 +0200)
> > 
> > are available in the git repository at:
> > 
> >   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.36/snapshot-to-v4.12-flattened
> 
> Hm, this was odd, I had to drop a number of patches in the middle here,
> but then got the rest to apply.  Did some patches end up already in the
> earlier series?
> 
> Anyway, all now applied, thanks.

Thanks Greg,

I'll look over what you have applied.
The likely explanation for the problem is that I messed things up somehow
when preparing the branch for you.
