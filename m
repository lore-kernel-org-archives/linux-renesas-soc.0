Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pg1-f178.google.com ([209.85.215.178]:34194 "EHLO
        mail-pg1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1728444AbeJWBVJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 21:21:09 -0400
Subject: Re: [PATCH 1/9] net: dsa: bcm_sf2: simplify getting .driver_data
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        linux-kernel@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, Andrew Lunn <andrew@lunn.ch>,
        Vivien Didelot <vivien.didelot@savoirfairelinux.com>,
        "David S. Miller" <davem@davemloft.net>, netdev@vger.kernel.org
References: <20181021200021.1693-1-wsa+renesas@sang-engineering.com>
 <20181021200021.1693-2-wsa+renesas@sang-engineering.com>
From: Florian Fainelli <f.fainelli@gmail.com>
Message-ID: <66826091-9d6a-5301-944e-e69ab99c8024@gmail.com>
Date: Mon, 22 Oct 2018 10:01:47 -0700
MIME-Version: 1.0
In-Reply-To: <20181021200021.1693-2-wsa+renesas@sang-engineering.com>
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
