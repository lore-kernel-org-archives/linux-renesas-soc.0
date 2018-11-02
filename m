Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from gloria.sntech.de ([185.11.138.130]:43992 "EHLO gloria.sntech.de"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726116AbeKBVcm (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Nov 2018 17:32:42 -0400
From: Heiko Stuebner <heiko@sntech.de>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Zhang Rui <rui.zhang@intel.com>,
        Eduardo Valentin <edubezval@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        linux-pm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        linux-rockchip@lists.infradead.org
Subject: Re: [PATCH 2/5] thermal: rockchip_thermal: simplify getting .driver_data
Date: Fri, 02 Nov 2018 13:25:32 +0100
Message-ID: <2099094.tBqgur4jcY@phil>
In-Reply-To: <20181021200053.2194-3-wsa+renesas@sang-engineering.com>
References: <20181021200053.2194-1-wsa+renesas@sang-engineering.com> <20181021200053.2194-3-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Am Sonntag, 21. Oktober 2018, 22:00:49 CET schrieb Wolfram Sang:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Heiko Stuebner <heiko@sntech.de>
