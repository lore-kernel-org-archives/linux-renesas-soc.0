Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:55223 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753141AbdFSMAC (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Jun 2017 08:00:02 -0400
Date: Mon, 19 Jun 2017 13:59:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        Magnus Damm <magnus.damm@gmail.com>, linux-mmc@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH mmc/next v2 0/4] mmc: renesas_sdhi: add support for R-Car
 Gen3 SDHI DMAC
Message-ID: <20170619115959.GD20088@verge.net.au>
References: <1497607134-10241-1-git-send-email-horms+renesas@verge.net.au>
 <20170617150341.q2pcilgi2fdpfaz2@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20170617150341.q2pcilgi2fdpfaz2@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Jun 17, 2017 at 05:03:42PM +0200, Wolfram Sang wrote:
> > Based on mmc/next
> > 
> > Headline performance boost: 9.5MB/s -> 39.7MB/s
> 
> Did you test writing as well? For me, this fails on M3-W with CMD12
> timeouts. We had some changes in CMD12 handling recently, so it might be
> because of that. I'll check on Monday.
> 
> Visual code review follows...

No, for not particularly good reasons I only checked read.
I'll check write too.
