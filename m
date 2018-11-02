Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:51722 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726016AbeKBVCX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:02:23 -0400
Date: Fri, 2 Nov 2018 12:55:22 +0100
From: Simon Horman <horms@verge.net.au>
To: Niklas =?utf-8?Q?S=C3=B6derlund?= <niklas.soderlund@ragnatech.se>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>,
        Takeshi Saito <takeshi.saito.xv@renesas.com>,
        Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: Re: [PATCH] mmc: tmio: delete wait in tuning process
Message-ID: <20181102115522.vymx75dvxatcwkdm@verge.net.au>
References: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181031230043.1302-1-niklas.soderlund@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 01, 2018 at 12:00:43AM +0100, Niklas Söderlund wrote:
> From: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> 
> The manual does not contain information that a wait is needed in the
> tuning process, this might be a leftover from early development.
> Removing the wait don't have any effect on operation so delete the wait
> to shorten the initialization time.
> 
> Signed-off-by: Masaharu Hayakawa <masaharu.hayakawa.ry@renesas.com>
> Signed-off-by: Takeshi Saito <takeshi.saito.xv@renesas.com>
> [Niklas: fixup commit message]
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Reviewed-by: Simon Horman <horms+renesas@verge.net.au>
