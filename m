Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:45428 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753084AbdFPJYz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Jun 2017 05:24:55 -0400
Date: Fri, 16 Jun 2017 11:24:35 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH mmc/next v2 0/2] mmc: tmio, renesas-sdhi: cleanups
Message-ID: <20170616092435.GC6032@verge.net.au>
References: <1497553214-12914-1-git-send-email-horms+renesas@verge.net.au>
 <20170616082742.pj5crlavihkewlfd@ninjato>
 <20170616091911.GA6032@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170616091911.GA6032@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Fri, Jun 16, 2017 at 11:19:12AM +0200, Simon Horman wrote:
> On Fri, Jun 16, 2017 at 10:27:42AM +0200, Wolfram Sang wrote:
> > 
> > > this short series provides some cleanups to the tmio and renesas-sdhi
> > > drivers to improve their checkpatch cleanness.
> > 
> > Is there a dependency on your Gen3 DMA series?
> 
> No

Sorry, that response was a bit short.

The Gen3 DMA series and this series apply independently of each other.
So I don't see any dependencies between them.
