Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from aserp1040.oracle.com ([141.146.126.69]:32187 "EHLO
	aserp1040.oracle.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1750727AbcFDBO1 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Fri, 3 Jun 2016 21:14:27 -0400
Subject: Re: [added to the 4.1 stable tree] usb: host: xhci-rcar: Use
 ARCH_RENESAS
To: Simon Horman <horms@verge.net.au>
References: <1464989831-16666-1-git-send-email-sasha.levin@oracle.com>
 <1464989831-16666-66-git-send-email-sasha.levin@oracle.com>
 <20160604004717.GB469@verge.net.au>
Cc: stable@vger.kernel.org, stable-commits@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-renesas-soc@vger.kernel.org
From: Sasha Levin <sasha.levin@oracle.com>
Message-ID: <57522B69.3070105@oracle.com>
Date: Fri, 3 Jun 2016 21:14:17 -0400
MIME-Version: 1.0
In-Reply-To: <20160604004717.GB469@verge.net.au>
Content-Type: text/plain; charset=windows-1252
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 06/03/2016 08:47 PM, Simon Horman wrote:
> Hi,
> 
> I do not believe this patch is suitable for v4.1 stable.
> 
> ARCH_RENESAS is not otherwise present there and thus the driver in question
> will stop being compiled where it was previously compiled.
> 
> Moreover, the transition to ARCH_RENESAS is (so far) being handled in such
> a way that there have not been any regressions that would necessitate a
> backport to -stable.

Hey Simon,

I've picked this commit because of what I saw in f879fc32a
("usb: host: xhci-rcar: Avoid long wait in xhci_reset()").

>From my understanding of that change, we added a dependency on ARCH_RENESAS
for USB_XHCI_PLATFORM, but since USB_XHCI_RCAR depended on ARCH_SHMOBILE that
would cause silly errors for kconfig and would probably confuse users.

Rather than changing it to a ARCH_SHMOBILE dependency, I've preferred
to pull in f879fc32a to keep the stable tree more aligned with upstream
and possibly prevent any future backporting errors for new commits that
add ARCH_RENESAS dependencies.

If you don't agree with that approach I can change that to a ARCH_SHMOBILE
dependency and remove this commit, or take any other approach you think
is better?


Thanks,
Sasha
