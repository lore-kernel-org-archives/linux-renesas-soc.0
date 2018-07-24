Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44559 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388241AbeGXMJa (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:09:30 -0400
Date: Tue, 24 Jul 2018 13:03:31 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 2/4] mmc: tmio: Fix SCC error detection
Message-ID: <20180724110331.usvbfd7vvs5xxd7l@verge.net.au>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-3-niklas.soderlund+renesas@ragnatech.se>
 <20180724104459.pfggnsz5xlxq6peh@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180724104459.pfggnsz5xlxq6peh@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 24, 2018 at 12:44:59PM +0200, Wolfram Sang wrote:
> On Tue, Jul 17, 2018 at 04:52:14PM +0200, Niklas Söderlund wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > 
> > SDR104 and HS200 need to check for SCC error. If SCC error is detected,
> > retuning is necessary.
> > 
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > [Niklas: update commit message]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> This patch breaks HS400 on my M3-N again :(
> 

I think that may be because renesas_sdhi_check_scc_error needs
to be taught about 8-tap HS400.
