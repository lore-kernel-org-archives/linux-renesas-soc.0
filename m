Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:37535 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725857AbeKRMrd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 18 Nov 2018 07:47:33 -0500
Received: by mail-wr1-f66.google.com with SMTP id j10so14286262wru.4
        for <linux-renesas-soc@vger.kernel.org>; Sat, 17 Nov 2018 18:28:48 -0800 (PST)
Subject: Re: [PATCH] dt-bindings: timer: renesas, cmt: Document r8a77470 CMT
 support
To: Biju Das <biju.das@bp.renesas.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mark Rutland <mark.rutland@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, devicetree@vger.kernel.org,
        Simon Horman <horms@verge.net.au>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Chris Paterson <Chris.Paterson2@renesas.com>,
        Fabrizio Castro <fabrizio.castro@bp.renesas.com>,
        linux-renesas-soc@vger.kernel.org
References: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <0cb14d7e-602d-a932-f439-e22f2555bb18@linaro.org>
Date: Sun, 18 Nov 2018 03:28:45 +0100
MIME-Version: 1.0
In-Reply-To: <1540542973-15752-1-git-send-email-biju.das@bp.renesas.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 26/10/2018 10:36, Biju Das wrote:
> Document SoC specific compatible strings for r8a77470. No driver change
> is needed as the fallback strings will activate the right code.
> 
> Signed-off-by: Biju Das <biju.das@bp.renesas.com>
> ---

Applied also, thanks!


-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
