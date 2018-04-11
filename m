Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:52839 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750734AbeDKI1o (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 11 Apr 2018 04:27:44 -0400
Date: Wed, 11 Apr 2018 10:27:38 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: linux-i2c@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, Peter Rosin <peda@axentia.se>,
        Joe Perches <joe@perches.com>
Subject: Re: [PATCH v2 1/2] MAINTAINERS: remove me as maintainer for I2C host
 drivers
Message-ID: <20180411082738.jot5ugwto4otsj3s@verge.net.au>
References: <20180410194914.7268-1-wsa@the-dreams.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180410194914.7268-1-wsa@the-dreams.de>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 10, 2018 at 09:49:13PM +0200, Wolfram Sang wrote:
> The number of I2C host controller drivers keeps increasing, and although
> I had some success acquiring specific driver maintainers, my bandwidth
> is by far not enough to act as a fallback for the rest of the drivers.
> To reflect this status-quo in MAINTAINERS, add a seperate entry for I2C
> host drivers, let the I2C list (= community) be the contact point, and
> mark this section as "Odd fixes".
> 
> Signed-off-by: Wolfram Sang <wsa@the-dreams.de>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
