Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from vps0.lunn.ch ([185.16.172.187]:39832 "EHLO vps0.lunn.ch"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726270AbeJVHaz (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 22 Oct 2018 03:30:55 -0400
Date: Mon, 22 Oct 2018 01:14:52 +0200
From: Andrew Lunn <andrew@lunn.ch>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Florian Fainelli <f.fainelli@gmail.com>,
        "David S. Miller" <davem@davemloft.net>,
        Ray Jui <rjui@broadcom.com>,
        Scott Branden <sbranden@broadcom.com>,
        Jon Mason <jonmason@broadcom.com>,
        bcm-kernel-feedback-list@broadcom.com, netdev@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 9/9] net: phy: mdio-mux-bcm-iproc: simplify getting
 .driver_data
Message-ID: <20181021231452.GC12539@lunn.ch>
References: <20181021200021.1693-1-wsa+renesas@sang-engineering.com>
 <20181021200021.1693-10-wsa+renesas@sang-engineering.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181021200021.1693-10-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Sun, Oct 21, 2018 at 10:00:20PM +0200, Wolfram Sang wrote:
> We should get 'driver_data' from 'struct device' directly. Going via
> platform_device is an unneeded step back and forth.
> 
> Signed-off-by: Wolfram Sang <wsa+renesas@sang-engineering.com>

Reviewed-by: Andrew Lunn <andrew@lunn.ch>

    Andrew
