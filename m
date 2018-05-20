Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:41390 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1750895AbeETGpn (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 20 May 2018 02:45:43 -0400
Date: Sun, 20 May 2018 08:45:40 +0200
From: Wolfram Sang <wsa@the-dreams.de>
To: Peter Rosin <peda@axentia.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 1/2] i2c: mux: demux-pinctrl: use proper parent device
 for demux adapter
Message-ID: <20180520064540.t54o7akrmx3g6cd6@ninjato>
References: <20180430115544.22903-1-wsa+renesas@sang-engineering.com>
 <20180430115544.22903-2-wsa+renesas@sang-engineering.com>
 <12bff5fc-dee4-e0bf-2dde-96201a8cd1fb@axentia.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <12bff5fc-dee4-e0bf-2dde-96201a8cd1fb@axentia.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, May 19, 2018 at 11:40:04PM +0200, Peter Rosin wrote:
> On 2018-04-30 13:55, Wolfram Sang wrote:
> > Due to a typo, the wrong parent device was assigned to the newly created
> > demuxing adapter device. It got connected to the demuxing platform
> > device but not to the selected parent I2C adapter device. Fix it to get
> > a proper parent-child relationship of the demuxed busses, needed also for
> > proper PM.
> > 
> 
> Should this one have a Fixes: tag? Should it go to current or next? Is
> a backport to stable good enough?

A Fixes tag is probably apropriate. I don't think it should go to
stable, though, because it will break a scheme a user might be using.
This can't be avoided for a kernel upgrade here, but IMO we shouldn't
enforce it for a stable update. Especially, given this is not a real
bug, but more something improper. For the same reason, I'd think -next
is good enough.

Thanks, will resend!

   Wolfram
