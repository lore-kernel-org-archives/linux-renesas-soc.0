Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f68.google.com ([209.85.221.68]:42687 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727596AbeJDRGK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 4 Oct 2018 13:06:10 -0400
Received: by mail-wr1-f68.google.com with SMTP id g15-v6so6637010wru.9
        for <linux-renesas-soc@vger.kernel.org>; Thu, 04 Oct 2018 03:13:35 -0700 (PDT)
Subject: Re: [PATCH] thermal: rcar_thermal: fix duplicate IRQ request
To: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        linux-pm@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
References: <34a21e56-22b0-3603-1aba-0800aa02eff7@cogentembedded.com>
From: Daniel Lezcano <daniel.lezcano@linaro.org>
Message-ID: <c1f844d3-77bf-15ff-50e5-739dfe2d4a82@linaro.org>
Date: Thu, 4 Oct 2018 12:13:32 +0200
MIME-Version: 1.0
In-Reply-To: <34a21e56-22b0-3603-1aba-0800aa02eff7@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 03/10/2018 22:47, Sergei Shtylyov wrote:
> The driver on R8A77995 requests the same IRQ twice since
> platform_get_resource() is always called for the 1st IRQ resource. 
> 
> Fixes: 1969d9dc2079 ("thermal: rcar_thermal: add r8a77995 support")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> 
> ---

Reviewed-by: Daniel Lezcano <daniel.lezcano@linaro.org>

-- 
 <http://www.linaro.org/> Linaro.org │ Open source software for ARM SoCs

Follow Linaro:  <http://www.facebook.com/pages/Linaro> Facebook |
<http://twitter.com/#!/linaroorg> Twitter |
<http://www.linaro.org/linaro-blog/> Blog
