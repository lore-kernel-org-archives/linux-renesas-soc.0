Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:44464 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2388241AbeGXME4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 24 Jul 2018 08:04:56 -0400
Date: Tue, 24 Jul 2018 12:58:59 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa@the-dreams.de>
Cc: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
Subject: Re: [PATCH v3 1/4] mmc: tmio: Fix tuning flow
Message-ID: <20180724105738.vl6zjipv4sqwlryr@verge.net.au>
References: <20180717145216.16840-1-niklas.soderlund+renesas@ragnatech.se>
 <20180717145216.16840-2-niklas.soderlund+renesas@ragnatech.se>
 <20180724104254.oaggeurkkvnumbch@ninjato>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180724104254.oaggeurkkvnumbch@ninjato>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Jul 24, 2018 at 12:42:54PM +0200, Wolfram Sang wrote:
> On Tue, Jul 17, 2018 at 04:52:13PM +0200, Niklas Söderlund wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > 
> > If the return value of mmc_send_tuning() is error other than -EILSEQ,
> > the tuning fails and process goes out of for_loop. The correct
> > processing is to judge their TAP as not good (NG) and continue.
> > 
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > [Niklas: update commit message]
> > Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> > Reviewed-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> > Tested-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> Re-tested this with Simon's HS400 patches.
> 
> Actually, this patch is needed to make HS400 work on my M3-N board.
> 
> Simon, did I get it correctly, it worked without this patch for you?

I think so but I would have to re-test for sure as at some
point I had a variant of this patch in my patch stack.
