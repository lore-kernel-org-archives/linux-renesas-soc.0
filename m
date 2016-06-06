Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52072 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1751141AbcFFAjH (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Sun, 5 Jun 2016 20:39:07 -0400
Date: Mon, 6 Jun 2016 09:39:02 +0900
From: Simon Horman <horms@verge.net.au>
To: Sasha Levin <sasha.levin@oracle.com>
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-renesas-soc@vger.kernel.org,
	Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: Re: [added to the 4.1 stable tree] usb: host: xhci-rcar: Use
 ARCH_RENESAS
Message-ID: <20160606003858.GA17412@verge.net.au>
References: <1464989831-16666-1-git-send-email-sasha.levin@oracle.com>
 <1464989831-16666-66-git-send-email-sasha.levin@oracle.com>
 <20160604004717.GB469@verge.net.au>
 <57522B69.3070105@oracle.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <57522B69.3070105@oracle.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

[Cc Shimoda-san]

On Fri, Jun 03, 2016 at 09:14:17PM -0400, Sasha Levin wrote:
> On 06/03/2016 08:47 PM, Simon Horman wrote:
> > Hi,
> > 
> > I do not believe this patch is suitable for v4.1 stable.
> > 
> > ARCH_RENESAS is not otherwise present there and thus the driver in question
> > will stop being compiled where it was previously compiled.
> > 
> > Moreover, the transition to ARCH_RENESAS is (so far) being handled in such
> > a way that there have not been any regressions that would necessitate a
> > backport to -stable.
> 
> Hey Simon,
> 
> I've picked this commit because of what I saw in f879fc32a
> ("usb: host: xhci-rcar: Avoid long wait in xhci_reset()").
> 
> >From my understanding of that change, we added a dependency on ARCH_RENESAS
> for USB_XHCI_PLATFORM, but since USB_XHCI_RCAR depended on ARCH_SHMOBILE that
> would cause silly errors for kconfig and would probably confuse users.
> 
> Rather than changing it to a ARCH_SHMOBILE dependency, I've preferred
> to pull in f879fc32a to keep the stable tree more aligned with upstream
> and possibly prevent any future backporting errors for new commits that
> add ARCH_RENESAS dependencies.
> 
> If you don't agree with that approach I can change that to a ARCH_SHMOBILE
> dependency and remove this commit, or take any other approach you think
> is better?

Thanks, this does seem to be a bit of a mess. Sorry about that.

My feeling is that it would be better to change f879fc32a to use
ARCH_SHMOBILE as ARCH_RENESAS does not exist in v4.1.

One slight risk in this approach is that ARCH_SHMOBILE covers some (older)
SH SoCs as well as (newer) ARM and arm64 based SoCs (Renesas arm64 based
SoCs are not present in v4.1) whereas ARCH_RENESAS (in kernels that it
exists) only covers ARM and arm64 based SoCs. So the coverage of
ARCH_SHMOBILE is broader. But I don't think that should be a problem as
that is already the dependency being used in v4.1.

A quick compile test using ecovec24_defconfig + USB_XHCI_HCD +
USB_XHCI_RCAR indicates that the driver compiles on that platform.
