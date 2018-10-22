Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl1-f195.google.com ([209.85.214.195]:42099 "EHLO
        mail-pl1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727218AbeJWBUl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 21:20:41 -0400
Subject: Re: [PATCH 1/1] net: dsa: legacy: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
References: <20181021200105.2414-1-wsa+renesas@sang-engineering.com>
 <20181021200105.2414-2-wsa+renesas@sang-engineering.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <aba74c12-1ee6-b2ad-d06a-6b83cec1718a@gmail.com>
Date: Mon, 22 Oct 2018 10:01:14 -0700
MIME-Version: 1.0
In-Reply-To: <20181021200105.2414-2-wsa+renesas@sang-engineering.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 10/21/18 1:01 PM, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Florian Fainelli <f.fainelli@gmail.com>
-- 
Florian
