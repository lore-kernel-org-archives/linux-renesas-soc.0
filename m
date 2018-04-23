Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-bn3nam01on0056.outbound.protection.outlook.com ([104.47.33.56]:1281
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1751414AbeDWGFK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Apr 2018 02:05:10 -0400
Subject: Re: [PATCH 10/61] gpio: simplify getting .drvdata
To: Wolfram Sang <wsa@the-dreams.de>,
        Michal Simek <michal.simek@xilinx.com>
CC: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-kernel@vger.kernel.org>,
        <linux-renesas-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, Hoan Tran <hotran@apm.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Thierry Reding <thierry.reding@gmail.com>,
        Jonathan Hunter <jonathanh@nvidia.com>,
        <linux-gpio@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <linux-tegra@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-11-wsa+renesas@sang-engineering.com>
 <34f4679f-d306-073b-eae0-28c9e8965780@xilinx.com>
 <20180421162333.d4jtidmbxrx76k4x@ninjato>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <19e48035-917c-7bb0-eef3-a7d6db4c1db2@xilinx.com>
Date: Mon, 23 Apr 2018 08:04:48 +0200
MIME-Version: 1.0
In-Reply-To: <20180421162333.d4jtidmbxrx76k4x@ninjato>
Content-Type: text/plain; charset="windows-1252"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi Wolfram,

On 21.4.2018 18:23, Wolfram Sang wrote:
> Hi Michal,
> 
> Thanks for the reviews!
> 
>> There are two more occurences in this gpio-zynq driver.
>> zynq_gpio_resume, zynq_gpio_suspend. It wasn't detected because these
>> two lines are not together. But the same change can be applied for them too.
> 
> Not really. The rule would have matched if there was just "something"
> inbetween. It did not match because the "something" involves the
> variable 'pdev', so we can't remove it. And just changing towards
> 'dev_get_drvdata' and keeping 'pdev' was not worth the hazzle in my
> book. Especially since I think the code should probably get refactored.
> Calling platform_get_irq() in suspend/resume paths in order to get the
> irq_data looks a little expensive to me, but I haven't tested it.
> 

ok. Thanks. I have overlooked that.

Thanks,
Michal
