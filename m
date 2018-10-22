Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf1-f169.google.com ([209.85.210.169]:41775 "EHLO
        mail-pf1-f169.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728428AbeJWBV3 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 21:21:29 -0400
Subject: Re: [PATCH 9/9] net: phy: mdio-mux-bcm-iproc: simplify getting
 .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        "David S. Miller" <davem@davemloft.net>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Jon Mason <jonmason@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
References: <20181021200021.1693-1-wsa+renesas@sang-engineering.com>
 <20181021200021.1693-10-wsa+renesas@sang-engineering.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <886a1e4b-214a-8fa0-f11e-11804f4a611f@gmail.com>
Date: Mon, 22 Oct 2018 10:02:08 -0700
MIME-Version: 1.0
In-Reply-To: <20181021200021.1693-10-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/21/18 1:00 PM, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
