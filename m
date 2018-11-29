Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49354 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729519AbeK3EAi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 23:00:38 -0500
Date: Thu, 29 Nov 2018 17:54:34 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 2/2] clk: renesas: rcar-gen3: add HS400 quirk for SD
 clock
Message-ID: <20181129165429.GA1660@kunai>
References: <20181129003949.19984-1-niklas.soderlund+renesas@ragnatech.se>
 <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181129003949.19984-3-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Niklas,

thanks for the patches!

On Thu, Nov 29, 2018 at 01:39:49AM +0100, Niklas Söderlund wrote:
> On H3 (ES1.x, ES2.0) and M3-W (ES1.0, ES1.1) the clock setting for HS400
> needs a quirk to function properly. The reason for the quirk is that
> there are two settings which produces same divider value for the SDn
> clock. On the effected boards the one currently selected results in
> HS400 not working.
> 
> This change uses the same method as the Gen2 CPG driver and simply
> ignores the first clock setting as this is the offending one when
> selecting the settings. Which of the two possible settings is used have
> no effect for SDR104.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>
> 
> ---
> * Changes since v1
> - Fixed spelling in commit message, thanks Sergei and Geert!
> - Reworked the whole patch per Geerts suggestion. Instead of only
>   skipping the first row on the effected boards when setting the clock
>   rete totally ignore it. This is made possible by another change to the

"rete"? I don't get this sentence and I think it is important to
understand when reviewing these patches :)

>   clock driver posted separately from this series and which this patch
>   now depends on [1].

Hmm, why didn't you add it to the series then?

Still, all in all, seems we are on a nice track for having HS400 in the
next release \o/ Now, if that doesn't justify the 5.0 jump... ;D

Regards,

   Wolfram
