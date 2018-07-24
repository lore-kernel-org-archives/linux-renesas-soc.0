Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:46197 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388265AbeGXNXe (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 09:23:34 -0400
Date: Tue, 24 Jul 2018 14:17:17 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 2/4] mmc: tmio: Fix SCC error detection
Message-ID: <20180724121717.hw4oifpbtnfwbsxb@verge.net.au>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-3-niklas.soderlund+renesas@ragnatech.se>
 <20180724104459.pfggnsz5xlxq6peh@ninjato>
 <20180724110331.usvbfd7vvs5xxd7l@verge.net.au>
 <20180724111710.tioelozl6vq5ya4t@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180724111710.tioelozl6vq5ya4t@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 24, 2018 at 01:17:10PM +0200, Wolfram Sang wrote:
> 
> > > This patch breaks HS400 on my M3-N again :(
> > > 
> > 
> > I think that may be because renesas_sdhi_check_scc_error needs
> > to be taught about 8-tap HS400.
> 
> Right, so patch 2 kind of depends on patch 4?

Yes, I think so. Sorry for missing that in my earlier review.

> Niklas, how is your status on reworking patch 4?
