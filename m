Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-ve1eur01on0090.outbound.protection.outlook.com ([104.47.1.90]:42560
        "EHLO EUR01-VE1-obe.outbound.protection.outlook.com"
        rhost-flags-OK-OK-OK-FAIL) by vger.kernel.org with ESMTP
        id S1727771AbeITXLD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 20 Sep 2018 19:11:03 -0400
Subject: Re: [RFC PATCH 2/4] i2c: core: remove level of indentation in
 i2c_transfer
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Stefan Lengfeld <contact@stefanchrist.eu>,
        preid@electromag.com.au, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, Keerthy <j-keerthy@ti.com>,
        Tero Kristo <t-kristo@ti.com>,
        Grygorii Strashko <grygorii.strashko@ti.com>,
        Andy Shevchenko <andriy.shevchenko@linux.intel.com>
References: <20180920161423.13990-1-wsa+renesas@sang-engineering.com>
 <20180920161423.13990-3-wsa+renesas@sang-engineering.com>
From: Peter Rosin <peda@axentia.se>
Message-ID: <c7ee2547-1b3b-3e43-e933-234516031770@axentia.se>
Date: Thu, 20 Sep 2018 19:26:21 +0200
MIME-Version: 1.0
In-Reply-To: <20180920161423.13990-3-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 2018-09-20 18:14, Wolfram Sang wrote:
> Using the common kernel pattern to bail out at the beginning if some
> conditions are not met, we can save a level of indentation. No
> functional change.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Yes please!

Acked-by: Peter Rosin <peda@axentia.se>

Cheers,
Peter
