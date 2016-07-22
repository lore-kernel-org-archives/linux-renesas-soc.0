Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:35771 "EHLO
	kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
	with ESMTP id S1753279AbcGVB72 (ORCPT
	<rfc822;linux-renesas-soc@vger.kernel.org>);
	Thu, 21 Jul 2016 21:59:28 -0400
Date: Fri, 22 Jul 2016 10:59:24 +0900
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: linux-arm-kernel@lists.infradead.org, arm@kernel.org,
	Kevin Hilman <khilman@kernel.org>,
	Magnus Damm <magnus.damm@gmail.com>,
	linux-renesas-soc@vger.kernel.org, Olof Johansson <olof@lixom.net>
Subject: Re: [GIT PULL] Renesas ARM Based SoC DT Fixes for v4.8
Message-ID: <20160722015924.GH21943@verge.net.au>
References: <cover.1468808109.git.horms+renesas@verge.net.au>
 <7322553.kXvQYPfzzh@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <7322553.kXvQYPfzzh@wuerfel>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Jul 21, 2016 at 02:41:52PM +0200, Arnd Bergmann wrote:
> On Monday, July 18, 2016 11:39:35 AM CEST Simon Horman wrote:
> > Renesas ARM Based SoC DT Fixes for v4.8
> > 
> > * Corrections to r8a7792
> > 
> 
> Merged into next/dt, thanks!

Thanks!

I have queued up another fix for v4.8 since sending the above to you.
This time it is an SoC (C-code) rather than a DT fix. I am wondering
if you could offer guidance on:

* If you would prefer me to split fixes out into separate (DT, SoC, ...)
  branches? If so is that until around rc1 when everything has been
  merged into the forthcoming release and thereafter you would prefer
  a single fixes branch?

* What pace you would like me to send fixes. I guess it depends on
  where we are in the cycle. Currently I put the changes in next and
  send what I have about once a week (or not if there are none :).

Typically there are very few fixes. But as I already have 3 for v4.8,
including those in this pull request, I get the feeling a few more could
emerge before v4.8 is released.
