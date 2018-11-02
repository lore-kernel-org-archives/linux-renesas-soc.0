Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f193.google.com ([209.85.208.193]:36528 "EHLO
        mail-lj1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726098AbeKBVty (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:49:54 -0400
Received: by mail-lj1-f193.google.com with SMTP id s15-v6so1642185lji.3
        for <linux-renesas-soc@vger.kernel.org>; Fri, 02 Nov 2018 05:42:50 -0700 (PDT)
Date: Fri, 2 Nov 2018 13:42:47 +0100
From: Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund@ragnatech.se>
To: Simon Horman <horms@verge.net.au>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Masahiro Yamada <yamada.masahiro@socionext.com>,
        Ulf Hansson <ulf.hansson@linaro.org>,
        linux-mmc@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] mmc: renesas_sdhi: remove workaround for HS400 clock
Message-ID: <20181102124247.GA13506@bigcity.dyn.berto.se>
References: <20181031225944.1226-1-niklas.soderlund@ragnatech.se>
 <20181102115502.if7heamsrphlal5k@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181102115502.if7heamsrphlal5k@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Simon,

On 2018-11-02 12:55:02 +0100, Simon Horman wrote:
> On Wed, Oct 31, 2018 at 11:59:44PM +0100, Niklas S�derlund wrote:
> > From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> > 
> > The driver sets an incorrect clock and depends on the clock driver
> > knowledge of this incorrect setting to still set a 200Mhz SDn clock.
> > Instead of spreading the workaround between the two drivers the clock
> > driver should be made aware of the ES versions where the special clock
> > handling is needed no need to keep this workaround in the SDHI driver.
> > 
> > Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> 
> Does this change cause a regression pending an update
> to the clock driver?

No it does not, the corresponding BSP commit to the clock driver [1] was 
never part of upstream. This change should never have been merged 
upstream as it uses the hack from the BSP clock driver. Also HS400 have 
never been enabled upstream for Gen3.

1. 11fca067bde0221d ("clk: renesas: rcar-gen3: Fix SD divider setting")

-- 
Regards,
Niklas S�derlund
