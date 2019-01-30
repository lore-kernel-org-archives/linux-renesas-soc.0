Return-Path: <SRS0=dpDL=QG=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.8 required=3.0 tests=DKIM_INVALID,DKIM_SIGNED,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_NEOMUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DE3DBC282D9
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 09:46:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id B0E1820882
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 30 Jan 2019 09:46:16 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=verge.net.au header.i=@verge.net.au header.b="rZncRNhq"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1730479AbfA3JqQ (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 30 Jan 2019 04:46:16 -0500
Received: from kirsty.vergenet.net ([202.4.237.240]:38680 "EHLO
        kirsty.vergenet.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726406AbfA3JqQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 30 Jan 2019 04:46:16 -0500
Received: from reginn.horms.nl (watermunt.horms.nl [80.127.179.77])
        by kirsty.vergenet.net (Postfix) with ESMTPA id 201F525B74E;
        Wed, 30 Jan 2019 20:46:14 +1100 (AEDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=verge.net.au; s=mail;
        t=1548841574; bh=7u6u7g2BAPPB6kswZKrms6yTNi9E5Mdi68hF6kB+rKY=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=rZncRNhq0D8cm0rqJGU7mpC3ZQ+vJdcDhji+FweDgo+gekbC0uRRpkG7GWg2eaei0
         U1oIZRPUokUKsDn/RQ58jJ+z/+07VH7aqk8NnuAtuZeH1vI3Xj8kPCBoIRW/ddMb5H
         QtKk/r8TPhDAGh0rDwvvO+FqLyjop0bSi7Be1MrE=
Received: by reginn.horms.nl (Postfix, from userid 7100)
        id 4FB5494043D; Wed, 30 Jan 2019 10:46:12 +0100 (CET)
Date:   Wed, 30 Jan 2019 10:46:12 +0100
From:   Simon Horman <horms@verge.net.au>
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Magnus Damm <magnus.damm@gmail.com>,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Subject: Re: [PATCH/RFT] arm64: dts: renesas: r8a77990: Add OPPs table for
 cpu devices
Message-ID: <20190130094607.z7sqc2vqt4c7kzd4@verge.net.au>
References: <1547553762-4467-1-git-send-email-ykaneko0929@gmail.com>
 <20190128140519.wfbnpgznbkx3msft@verge.net.au>
 <CAMuHMdW2j4e4yc2ZkeJ71uqGz7FS2Kb2141tyZp9y3zTrJ21_g@mail.gmail.com>
 <20190128163639.kv77wczde7d7lntv@verge.net.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20190128163639.kv77wczde7d7lntv@verge.net.au>
Organisation: Horms Solutions BV
User-Agent: NeoMutt/20170113 (1.7.2)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 05:36:39PM +0100, Simon Horman wrote:
> On Mon, Jan 28, 2019 at 04:15:30PM +0100, Geert Uytterhoeven wrote:
> > Hi Simon,
> > 
> > On Mon, Jan 28, 2019 at 3:05 PM Simon Horman <horms@verge.net.au> wrote:
> > > On Tue, Jan 15, 2019 at 09:02:42PM +0900, Yoshihiro Kaneko wrote:
> > > > From: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > >
> > > > This patch define OOP tables for all CPUs.
> > > > This allows CPUFreq to function.
> > > >
> > > > Signed-off-by: Takeshi Kihara <takeshi.kihara.df@renesas.com>
> > > > Signed-off-by: Yoshihiro Kaneko <ykaneko0929@gmail.com>
> > > > ---
> > >
> > > Thanks, I have tested CPUFreq with this tested that with this patch and
> > > "[PATCH] clk: renesas: r8a77990: Add Z2 clock"
> > > (https://patchwork.kernel.org/patch/10783723/) applied on top of
> > > renesas-devel-20190128-v5.0-rc4.
> > >
> > > Geert, or others, is it expected that z2 does not scale
> > > in this test?
> > 
> > Given your patch adds the Z2 clock as a fixed clock, this is expected ;-)
> > 
> > Note that the BSP adds this clock as a programmable clock of type
> > CLK_TYPE_GEN3_Z2.
> 
> Thanks, understood.

I have now tested this patch in conjunction with
"[PATCH v2 0/6] clk: renesas: r8a77990: Add Z2 clock" [1],
which implements Z2 as a variable clock, and the results
seem substantially better.

# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_governor
performance
# cat /sys/devices/system/cpu/cpu0/cpufreq/scaling_available_frequencies
800000 1000000 1200000 
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z2/clk_rate:1200000000

# echo 1000000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:975000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1000000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:975000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1000000
/sys/kernel/debug/clk/z2/clk_rate:975000000

# echo 800000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq
# grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:787500
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:800000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:787500
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:800000
/sys/kernel/debug/clk/z2/clk_rate:787500000

# echo 1200000 > /sys/devices/system/cpu/cpu0/cpufreq/scaling_max_freq grep . /sys/devices/system/cpu/cpu*/cpufreq/*_cur_freq
# /sys/kernel/debug/clk/z2/clk_rate
/sys/devices/system/cpu/cpu0/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu0/cpufreq/scaling_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/cpuinfo_cur_freq:1200000
/sys/devices/system/cpu/cpu1/cpufreq/scaling_cur_freq:1200000
/sys/kernel/debug/clk/z2/clk_rate:1200000000

Tested-by: Simon Horman <horms+renesas@verge.net.au>

[1] https://lore.kernel.org/linux-renesas-soc/20190130094029.9604-1-horms+renesas@verge.net.au/T/#mec59a349508e0be00d3a1d6ef89f838c0e193591
