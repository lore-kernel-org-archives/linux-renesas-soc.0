Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50730 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750886AbeFDJnk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 05:43:40 -0400
Date: Mon, 4 Jun 2018 11:43:22 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2] arm64: dts: salvator-x(s): Update I2C ch4 clock to
 400kHz
Message-ID: <20180604094321.dbz7rz4uivft3f3a@verge.net.au>
References: <20180528192947.2808-1-wsa+renesas@sang-engineering.com>
 <20180529124815.baf5o5w33bntgdpa@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180529124815.baf5o5w33bntgdpa@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 29, 2018 at 02:48:15PM +0200, Simon Horman wrote:
> On Mon, May 28, 2018 at 09:29:47PM +0200, Wolfram Sang wrote:
> > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > 
> > Any of the following devices connected to I2C ch4 of the Salvator-X(S)
> > boards will operate at 400 kHz:
> > 
> >     PCA9654, 9FGV0841, ADV7482WBBCZ, MAX9611, 5P49V5923, 5P49V6901A
> > 
> > This patch updates the clock frequency to 400 KHz.
> > 
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [wsa: squashed commits into one]
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> This looks fine but I will wait to see if there are other reviews before
> applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied.
