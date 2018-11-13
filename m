Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from kirsty.vergenet.net ([202.4.237.240]:60130 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727166AbeKNA3z (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Nov 2018 19:29:55 -0500
Date: Tue, 13 Nov 2018 06:31:28 -0800
From: Simon Horman <horms@verge.net.au>
To: Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Magnus Damm <magnus.damm@gmail.com>,
        Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH LOCAL 1/2] arm64: renesas_defconfig: Drop
 CONFIG_ARM_BIG_LITTLE_CPUFREQ=y
Message-ID: <20181113143128.iuavou4kgxxaxrsp@verge.net.au>
References: <20181107101718.2412-1-geert+renesas@glider.be>
 <20181107101718.2412-2-geert+renesas@glider.be>
 <20181108104411.7mv3vrbdvdnacepv@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181108104411.7mv3vrbdvdnacepv@verge.net.au>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Nov 08, 2018 at 11:44:12AM +0100, Simon Horman wrote:
> On Wed, Nov 07, 2018 at 11:17:17AM +0100, Geert Uytterhoeven wrote:
> > CONFIG_ARM_BIG_LITTLE_CPUFREQ was removed on arm64 in commit
> > a7314405d83c8f95 ("cpufreq: drop ARM_BIG_LITTLE_CPUFREQ support for
> > ARM64").
> > 
> > Signed-off-by: Geert Uytterhoeven <geert+renesas@glider.be>
> > ---
> > Not intended for upstream merge.
> 
> Thanks,
> 
> This looks fine to me but I will wait to see if there are other reviews
> before applying.

Thanks again. I have applied this to topic/renesas-defconfig which
it targeted at the devel branch of the renesas tree but not upstream.
