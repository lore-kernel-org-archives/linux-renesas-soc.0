Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:39141 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751431AbeDRNwS (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 18 Apr 2018 09:52:18 -0400
Date: Wed, 18 Apr 2018 15:52:13 +0200
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] arm64: dts: r8a77965: Add R-Car Gen3 thermal support
Message-ID: <20180418135211.6nl64iskathhrosw@verge.net.au>
References: <20180417210342.16061-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20180417210342.16061-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Apr 17, 2018 at 11:03:42PM +0200, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Based on previous work by Ryo Kataoka <ryo.kataoka.wt@renesas.com>.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  arch/arm64/boot/dts/renesas/r8a77965.dtsi | 59 +++++++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> Hi Simon,
> 
> This patch depends on '[PATCH 0/2] thermal: rcar_gen3_thermal: add 
> r8a77965 support'. So it's probably best you hold back applying it to 
> such time it's dependency are accepted. I post it in any case to get 
> review comments and keep it ready for future integration in 
> renesas-drivers branches.
> 
> It also uses numerical values for the power-doamains propery as the 
> defines where not yet available for me. This shall of course be updated 
> before they are accepted.

Thanks,  I will mark this as deferred. Please repost or ping me once
the dependency is accepted.
