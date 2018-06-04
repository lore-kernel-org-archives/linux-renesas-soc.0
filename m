Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:50697 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751624AbeFDJmq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 4 Jun 2018 05:42:46 -0400
Date: Mon, 4 Jun 2018 11:42:27 +0200
From: Simon Horman <horms@verge.net.au>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Kihara <takeshi.kihara.df@renesas.com>
Subject: Re: [PATCH v2] arm64: dts: renesas: Add sdhi2_ds pin group to SDHI2
 pinctrl groups
Message-ID: <20180604094227.b42jr3ue7dcldapa@verge.net.au>
References: <20180528192842.2758-1-wsa+renesas@sang-engineering.com>
 <20180529124741.psdy7qjijurbyh5d@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180529124741.psdy7qjijurbyh5d@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, May 29, 2018 at 02:47:41PM +0200, Simon Horman wrote:
> On Mon, May 28, 2018 at 09:28:42PM +0200, Wolfram Sang wrote:
> > From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > 
> > This patch adds definitions for configuration of the power-source,
> > drive-strength, etc... for the SD2_DS pin for Salvator-X(S) and ULCB
> > boards.
> > 
> > Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > [wsa: fixed for ULCB boards, too]
> > Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> 
> This looks fine but I will wait to see if there are other reviews before
> applying.
> 
> Reviewed-by: Simon Horman <horms+renesas@verge.net.au>

Thanks, applied.
