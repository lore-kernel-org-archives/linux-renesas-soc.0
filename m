Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51794 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725935AbeKBVJG (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:09:06 -0400
Date: Fri, 2 Nov 2018 13:02:05 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH v3 3/3] mmc: renesas_sdhi: add initial setting of
 interrupt mask register
Message-ID: <20181102120205.rpyd2ldjd2vh4yth@verge.net.au>
References: <20181031230554.1660-1-niklas.soderlund@ragnatech.se>
 <20181031230554.1660-4-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181031230554.1660-4-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 01, 2018 at 12:05:54AM +0100, Niklas Söderlund wrote:
> From: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> The initial value of the interrupt mask register may be different from
> the H/W manual at the startup of the kernel by setting from the
> bootloader. Since the error interrupts may be unmasked, the driver sets
> initial value.
> 
> The initial value is only known for R-Car Gen2 and Gen3 platforms so
> limit the initialization to those platforms.
> 
> Based on work from Masaharu Hayakawa.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
