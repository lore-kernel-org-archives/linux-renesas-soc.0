Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f51.google.com ([209.85.215.51]:34211 "EHLO
        mail-lf0-f51.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752356AbdHAN1V (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 1 Aug 2017 09:27:21 -0400
Received: by mail-lf0-f51.google.com with SMTP id g25so6988175lfh.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 01 Aug 2017 06:27:20 -0700 (PDT)
Subject: Re: [PATCH v3 2/2] ravb: add workaround for clock when resuming with
 WoL enabled
To: =?UTF-8?Q?Niklas_S=c3=b6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert@linux-m68k.org>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
References: <20170801101437.9020-1-niklas.soderlund+renesas@ragnatech.se>
 <20170801101437.9020-3-niklas.soderlund+renesas@ragnatech.se>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <4e0cd03e-a2f0-2a41-7c66-903a0eed03a6@cogentembedded.com>
Date: Tue, 1 Aug 2017 16:27:17 +0300
MIME-Version: 1.0
In-Reply-To: <20170801101437.9020-3-niklas.soderlund+renesas@ragnatech.se>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-MW
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 08/01/2017 01:14 PM, Niklas Söderlund wrote:

> The renesas-cpg-mssr clock driver are not yet aware of PSCI sleep where
> power is cut to the SoC. When resuming from this state with WoL enabled
> the enable count of the ravb clock is 1 and the clock driver thinks the
> clock is already on when PM core enables the clock and increments the
> enable count to 2. This will result in the ravb driver failing to talk
> to the hardware since the module clock is off. Work around this by
> forcing the enable count to 0 and then back to 2 when resuming with WoL
> enabled.
> 
> This workaround should be reverted once the renesas-cpg-mssr clock
> driver becomes aware of this PSCI sleep behavior.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
