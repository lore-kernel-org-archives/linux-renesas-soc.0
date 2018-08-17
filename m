Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:48215 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726213AbeHQLzq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 17 Aug 2018 07:55:46 -0400
Date: Fri, 17 Aug 2018 10:53:08 +0200
From: Simon Horman <horms@verge.net.au>
To: Marek Vasut <marek.vasut@gmail.com>
Cc: linux-arm-kernel@lists.infradead.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ARM: dts: silk: Add DA9063 RTC and OnKey node
Message-ID: <20180817085308.awjo2oju7s3elh4f@verge.net.au>
References: <20180811110257.31690-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20180811110257.31690-1-marek.vasut+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sat, Aug 11, 2018 at 01:02:57PM +0200, Marek Vasut wrote:
> Add DA9063 RTC and OnKey subnode to DA9063 PMIC node on Silk.
> 
> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> Cc: Geert Uytterhoeven <geert+renesas@glider.be>
> Cc: Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>
> Cc: Simon Horman <horms+renesas@verge.net.au>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: linux-renesas-soc@vger.kernel.org
> ---
> NOTE: Pressing the POWER Switch SW11 triggers KEY_POWER event, which
>       ie. systemd interprets as shutdown command.
> NOTE: The RTC is verified to work with hwclock -w / hwclock -r .

Thanks Marek,

applied for v4.20.
