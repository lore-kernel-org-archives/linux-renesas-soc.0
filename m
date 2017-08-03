Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from out1-smtp.messagingengine.com ([66.111.4.25]:44477 "EHLO
        out1-smtp.messagingengine.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1751870AbdHCBzJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 Aug 2017 21:55:09 -0400
Date: Wed, 2 Aug 2017 18:55:04 -0700
From: Greg KH <greg@kroah.com>
To: Simon Horman <horms@verge.net.au>
Cc: ltsi-dev@lists.linuxfoundation.org,
        linux-renesas-soc@vger.kernel.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [LTSI-dev] [GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.12
Message-ID: <20170803015504.GC3031@kroah.com>
References: <20170710133333.GC27613@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170710133333.GC27613@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Mon, Jul 10, 2017 at 03:33:34PM +0200, Simon Horman wrote:
> Hi,
> 
> This is a submission to LTSI-v4.9.
> 
> This series is comprised of backports to v4.9 of the following
> components to their standard as of v4.12:
> 
> It is a follow up to early preparatory work the main difference being
> a rebase onto v4.9.36. This is a follow-up to a similar submission
> backporting Renesas SoCs and Drivers to v4.10. I plan to follow-up with
> a backport to v4.12.
> 
> I have tested for build regressions on a wide range of defconfigs
> on a wide range of architectures.
> 
> There are 286 patches.
> 
> This is based on a similar backports to v4.11 which is in turn based on v4.9.36.
> That work was posted as "[GIT PULL LTSI-4.9] Renesas SoCs and Drivers to v4.11"
> and is tagged as tags/backport/v4.9.36/snapshot-to-v4.11-flattened
> 
> 
> The following changes since commit 338ec844533e7bb1120f88f83a3fcc1d9618eef7:
> 
>   drm: bridge: dw-hdmi: fix building without CONFIG_OF (2017-07-10 14:51:26 +0200)
> 
> are available in the git repository at:
> 
>   https://git.kernel.org/pub/scm/linux/kernel/git/horms/renesas-backport.git tags/backport/v4.9.36/snapshot-to-v4.12-flattened

Hm, this was odd, I had to drop a number of patches in the middle here,
but then got the rest to apply.  Did some patches end up already in the
earlier series?

Anyway, all now applied, thanks.

greg k-h
