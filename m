Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:48792 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1754175AbeFZChN (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 22:37:13 -0400
Date: Tue, 26 Jun 2018 11:37:09 +0900
From: Wolfram Sang <wsa@the-dreams.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-i2c@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Sergey Larin <cerg2010cerg2010@mail.ru>,
        dri-devel@lists.freedesktop.org
Subject: Re: [PATCH 1/2] Revert "i2c: algo-bit: init the bus to a known state"
Message-ID: <20180626023709.jfr7vee7tumarz3h@ninjato>
References: <20180616133757.5994-1-wsa+renesas@sang-engineering.com>
 <20180616133757.5994-2-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180616133757.5994-2-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jun 16, 2018 at 10:37:56PM +0900, Wolfram Sang wrote:
> This reverts commit 3e5f06bed72fe72166a6778f630241a893f67799. As per
> bugzilla #200045, this caused a regression. I don't really see a way to
> fix it without having the hardware. So, revert the patch and I will fix
> the issue I was seeing originally in the i2c-gpio driver itself. I
> couldn't find new users of this algorithm since, so there should be no
> one depending on the new behaviour.
> 
> Reported-by: Sergey Larin <cerg2010cerg2010@mail.ru>
> Fixes: 3e5f06bed72f ("i2c: algo-bit: init the bus to a known state")
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Applied to for-current, thanks!
