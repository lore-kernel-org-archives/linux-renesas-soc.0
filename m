Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:54290 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751161AbdAEH4p (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 5 Jan 2017 02:56:45 -0500
Date: Thu, 5 Jan 2017 08:56:37 +0100
From: Simon Horman <horms@verge.net.au>
To: Arnd Bergmann <arnd@arndb.de>
Cc: arm@kernel.org, linux-renesas-soc@vger.kernel.org,
        Olof Johansson <olof@lixom.net>,
        Kevin Hilman <khilman@kernel.org>,
        linux-arm-kernel@lists.infradead.org,
        Magnus Damm <magnus.damm@gmail.com>
Subject: Re: [GIT PULL] Renesas ARM Based SoC Fixes for v4.10
Message-ID: <20170105075637.GC31941@verge.net.au>
References: <cover.1481530910.git.horms+renesas@verge.net.au>
 <3426031.nFTgvuDslP@wuerfel>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3426031.nFTgvuDslP@wuerfel>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Wed, Jan 04, 2017 at 04:10:09PM +0100, Arnd Bergmann wrote:
> On Monday, December 12, 2016 9:30:00 AM CET Simon Horman wrote:
> > This provides an sd0_uhs node rather than duplicate sdh0 nodes
> > resolving an error introduced in a clean-up patch.
> > 
> > This pull request is based on "Second Round of Renesas ARM Based SoC DT
> > Updates for v4.10", tagged as renesas-arm64-dt2-for-v4.10,
> > which you have already pulled. The error corrected by this change
> > was introduced in that pull-request.
> > 
> 
> Pulled into fixes, sorry for the delay.

Great, thanks!
