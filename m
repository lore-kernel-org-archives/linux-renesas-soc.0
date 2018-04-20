Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-bn3nam01on0042.outbound.protection.outlook.com ([104.47.33.42]:36016
        "EHLO NAM01-BN3-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1753539AbeDTHXU (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 20 Apr 2018 03:23:20 -0400
Subject: Re: [PATCH 59/61] watchdog: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-kernel@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>,
        Wim Van Sebroeck <wim@linux-watchdog.org>,
        Guenter Roeck <linux@roeck-us.net>,
        Michal Simek <michal.simek@xilinx.com>,
        <linux-watchdog@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-60-wsa+renesas@sang-engineering.com>
From: Michal Simek <michal.simek@xilinx.com>
Message-ID: <c8156dd1-5081-7ab6-6dce-fde367190ae9@xilinx.com>
Date: Fri, 20 Apr 2018 09:23:00 +0200
MIME-Version: 1.0
In-Reply-To: <20180419140641.27926-60-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 19.4.2018 16:06, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.
> 
>  drivers/watchdog/cadence_wdt.c   | 6 ++----
>  drivers/watchdog/of_xilinx_wdt.c | 6 ++----

Acked-by: Michal Simek <michal.simek@xilinx.com>

Thanks,
Michal
