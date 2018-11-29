Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:49370 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729803AbeK3EAp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Nov 2018 23:00:45 -0500
Date: Thu, 29 Nov 2018 17:54:43 +0100
From: Wolfram Sang <wsa@the-dreams.de>
To: Niklas =?utf-8?Q?S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] clk: renesas: rcar-gen3: set state when registering SD
 clocks
Message-ID: <20181129165443.GB1660@kunai>
References: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20181129001538.17974-1-niklas.soderlund+renesas@ragnatech.se>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 29, 2018 at 01:15:38AM +0100, Niklas Söderlund wrote:
> The driver tries to figure out which state a SD clock is in when the
> clock is register instead of setting a known state. This can be
> problematic for two reasons.
> 
> 1. If the clock driver can't figure out the state of the clock
>    registration of the clock fails and setting of a known state by a
>    clock user is not possible.
> 
> 2. The state of the clock depends on if and how the bootloader
>    configured it. The driver only checks that the rate is known not if
>    the clock is stopped or not for example.
> 
> Fix this by setting a known state and make sure the clock is stopped.
> 
> Signed-off-by: Niklas Söderlund <niklas.soderlund+renesas@ragnatech.se>

This patch makes much sense to me, a known state is gold. I can't really
think of a reason why it was matched against the bootloader clock. Can
someone else? If not, maybe asking the BSP team makes sense to ensure we
don't overlook something?
