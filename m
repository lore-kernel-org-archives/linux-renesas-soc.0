Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:43268 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726967AbeJQQJf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Oct 2018 12:09:35 -0400
Date: Wed, 17 Oct 2018 10:15:00 +0200
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Linus Walleij <linus.walleij@linaro.org>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        linux-renesas-soc@vger.kernel.org, linux-gpio@vger.kernel.org
Subject: Re: [PATCH] pinctrl: sh-pfc: Reduce kernel size for narrow VIN
 channels
Message-ID: <20181017081459.bbjuei3pnrdqhatc@verge.net.au>
References: <20181016120036.13041-1-geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181016120036.13041-1-geert+renesas@glider.be>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Tue, Oct 16, 2018 at 02:00:36PM +0200, Geert Uytterhoeven wrote:
> Some VIN channels support less than 24 lanes.  As union vin_data always
> consumes space for 24 lanes, this wastes memory.
> 
> Hence introduce new smaller unions vin_data12 and vin_data16, to
> accommodate VIN channels with only 12 or 16 lanes.
> 
> This reduces the static pin controller driver size by 320 bytes for
> R-Car V2H, and by 96 bytes for R-Car E2.
> 
> Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> ---
> To be queued in sh-pfc-for-v4.21.

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
