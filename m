Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from lelnx193.ext.ti.com ([198.47.27.77]:47925 "EHLO
        lelnx193.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751381AbeDSPOq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 19 Apr 2018 11:14:46 -0400
Subject: Re: [PATCH 35/61] net: ethernet: ti: simplify getting .drvdata
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        <linux-kernel@vger.kernel.org>
CC: <linux-renesas-soc@vger.kernel.org>,
        <kernel-janitors@vger.kernel.org>, <linux-omap@vger.kernel.org>,
        <netdev@vger.kernel.org>
References: <20180419140641.27926-1-wsa+renesas@sang-engineering.com>
 <20180419140641.27926-36-wsa+renesas@sang-engineering.com>
From: Grygorii Strashko <grygorii.strashko@ti.com>
Message-ID: <08a08b63-976a-dda5-229a-b79a18eb80d7@ti.com>
Date: Thu, 19 Apr 2018 10:14:40 -0500
MIME-Version: 1.0
In-Reply-To: <20180419140641.27926-36-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset="utf-8"; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>



On 04/19/2018 09:06 AM, Wolfram Sang wrote:
> We should get drvdata from struct device directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>
> ---
> 
> Build tested only. buildbot is happy. Please apply individually.

Reviewed-by: Grygorii Strashko <grygorii.strashko@ti.com>

-- 
regards,
-grygorii
