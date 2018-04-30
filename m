Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-io0-f196.google.com ([209.85.223.196]:35642 "EHLO
        mail-io0-f196.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752151AbeD3JD0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 30 Apr 2018 05:03:26 -0400
Received: by mail-io0-f196.google.com with SMTP id g1-v6so62712iob.2
        for <linux-renesas-soc@vger.kernel.org>; Mon, 30 Apr 2018 02:03:26 -0700 (PDT)
MIME-Version: 1.0
In-Reply-To: <b0c1e303-ca95-8bc8-a5d4-65e75dc8398a@ti.com>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-11-wsa+renesas@sang-engineering.com> <b0c1e303-ca95-8bc8-a5d4-65e75dc8398a@ti.com>
From: Linus Walleij <linus.walleij@linaro.org>
Date: Mon, 30 Apr 2018 11:03:25 +0200
Message-ID: <CACRpkday+d9iGeX+CRHTEyC=w+oNUK-8oTy0HqugO5PRhHn62w@mail.gmail.com>
Subject: Re: [PATCH 10/61] gpio: simplify getting .drvdata
To: Grygorii Strashko <grygorii.strashko@ti.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        kernel-janitors@vger.kernel.org, Hoan Tran <hotran@apm.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        Michal Simek <michal.simek@xilinx.com>,
        "open list:GPIO SUBSYSTEM" <linux-gpio@vger.kernel.org>,
        Linux-OMAP <linux-omap@vger.kernel.org>,
        linux-tegra@vger.kernel.org,
        Linux ARM <linux-arm-kernel@lists.infradead.org>
Content-Type: text/plain; charset="UTF-8"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Apr 19, 2018 at 5:14 PM, Grygorii Strashko
<grygorii.strashko@ti.com> wrote:
> On 04/19/2018 09:05 AM, Wolfram Sang wrote:
>>
>> We should get drvdata from struct device directly. Going via
>> platform_device is an unneeded step back and forth.
>>
>> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> ---
>>
>> Build tested only. buildbot is happy. Please apply individually.
>
>
> for gpio-omap.c:
> Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

Hm I only see the responses not the actual patch, I guess I will find it
sooner or later.

Wolfram: if I don't find it, poke me with something sharp so I get to apply it.

Yours,
Linus Walleij
