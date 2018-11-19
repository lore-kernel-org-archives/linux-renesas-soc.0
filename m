Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:34472 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727385AbeKSUtp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Nov 2018 15:49:45 -0500
Received: by mail-wr1-f66.google.com with SMTP id j2so3035478wrw.1
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Nov 2018 02:26:33 -0800 (PST)
Subject: Re: [PATCH] arm64: dts: renesas: r8a7796: Add CMT device nodes
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Simon Horman <horms@verge.net.au>,
        Magnus Damm <magnus.damm@gmail.com>,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        John Stultz <john.stultz@linaro.org>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>
References: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1be47ef6-1a92-e032-12c1-1deae5b67960@linaro.org>
Date: Mon, 19 Nov 2018 11:26:29 +0100
MIME-Version: 1.0
In-Reply-To: <1540542307-63158-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 26/10/2018 10:25, Biju Das wrote:
> This patch adds CMT{0|1|2|3} device nodes for r8a7796 SoC.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---
> This patch is tested against renesas-dev
> 
> I have executed on inconsistency-check, nanosleep and clocksource_switch
> selftests on this arm64 SoC. The inconsistency-check and nanosleep tests
> are working fine.The clocksource_switch asynchronous test is failing due
> to inconsistency-check failure on "arch_sys_counter".
> 
> But if i skip the clocksource_switching of "arch_sys_counter", the
> asynchronous test is passing for CMT0/1/2/3 timer.
> 
> Has any one noticed this issue?

So now that you mention that, I've been through the clocksource_switch
on another ARM64 platform (hikey960) and disabled the
ARM64_ERRATUM_858921 config option. I can see the same issue.

Is this option set on your config ?


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
