Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35462 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbeJWCtx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 22:49:53 -0400
Subject: Re: [PATCH 4/6] gpio: gpio-omap: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-kernel@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>,
        Santosh Shilimkar <ssantosh@kernel.org>,
        Kevin Hilman <khilman@kernel.org>,
        Linus Walleij <linus.walleij@linaro.org>,
        <linux-omap@vger.kernel.org>, <linux-gpio@vger.kernel.org>
References: <20181021200002.1472-1-wsa+renesas@sang-engineering.com>
 <20181021200002.1472-5-wsa+renesas@sang-engineering.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <99558402-4dbb-f111-3e25-eb42c3944179@ti.com>
Date: Mon, 22 Oct 2018 13:30:06 -0500
MIME-Version: 1.0
In-Reply-To: <20181021200002.1472-5-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 10/21/18 2:59 PM, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy.

Thank you
Acked-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
regards,
-grygorii
