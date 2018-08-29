Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:51158 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728701AbeH2TG5 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 29 Aug 2018 15:06:57 -0400
Received: by mail-wm0-f66.google.com with SMTP id s12-v6so5650869wmc.0
        for <linux-renesas-soc@vger.kernel.org>; Wed, 29 Aug 2018 08:09:34 -0700 (PDT)
Subject: Re: [PATCH 1/2] clocksource/drivers/ostm: Delay driver registration
To: Chris Brandt <chris.brandt@renesas.com>,
        Thomas Gleixner <tglx@linutronix.de>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms+renesas@verge.net.au>
References: <20180829132954.64862-1-chris.brandt@renesas.com>
 <20180829132954.64862-2-chris.brandt@renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <1ff04fa1-ee3b-6095-bcd8-f16dbb99b57a@linaro.org>
Date: Wed, 29 Aug 2018 17:09:28 +0200
MIME-Version: 1.0
In-Reply-To: <20180829132954.64862-2-chris.brandt@renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 29/08/2018 15:29, Chris Brandt wrote:
> The newer RZ/A clock control driver no longer registers all its clocks
> using DT, therefore the clocks required by this driver are no longer
> present at the beginning of boot.
> 
> Because of this, TIMER_OF_DECLARE can no longer be used because this
> causes the driver to get probed too early before the parent clock exists,
> and the probe will fail with "ostm: Failed to get clock".
> 
> So, we'll change this driver to register/probe during subsys_initcall which
> is after the appropriate clocks have been registered.

Can the boot constraints [1] solve this issue instead of the changes you
are proposing ?

[1] https://lwn.net/Articles/747250/




-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
