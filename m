Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:59602 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753048AbdK2Jwk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Nov 2017 04:52:40 -0500
Date: Wed, 29 Nov 2017 10:52:36 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: linux-renesas-soc@vger.kernel.org,
        Kieran Bingham <kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] rcar-vin: enable support for r8a77970
Message-ID: <20171129095236.6vivuxozieo73lci@verge.net.au>
References: <20171126002348.20561-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20171126002348.20561-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Nov 26, 2017 at 01:23:48AM +0100, Niklas Söderlund wrote:
> Add the SoC specific information for Renesas r8a77970.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> ---
>  .../devicetree/bindings/media/rcar_vin.txt         |  1 +
>  drivers/media/platform/rcar-vin/rcar-core.c        | 40 ++++++++++++++++++++++
>  2 files changed, 41 insertions(+)
> 
> Hi,
> 
> I plan to include this patch in the next version of the series for Gen3 
> support. But to enable who wish to start working with VIN on V3M I
> send it out now as a separate patch as the big Gen3 series is waiting 
> for -rc1 to be available before being re-posted.

Thanks. With the above in mind I have marked this as an RFC in patchwork.
