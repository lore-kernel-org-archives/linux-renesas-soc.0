Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:39010 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752475AbcLBTA6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 14:00:58 -0500
Date: Fri, 02 Dec 2016 14:00:30 -0500 (EST)
Message-Id: <20161202.140030.597013502556382328.davem@davemloft.net>
To: dan.carpenter@oracle.com
Cc: sergei.shtylyov@cogentembedded.com, johan@kernel.org,
        ykaneko0929@gmail.com, kazuya.mizuguchi.ks@renesas.com,
        horms+renesas@verge.net.au, wsa+renesas@sang-engineering.com,
        andrew@lunn.ch, tremyfr@gmail.com,
        niklas.soderlund+renesas@ragnatech.se, arnd@arndb.de,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        kernel-janitors@vger.kernel.org
Subject: Re: [patch] net: renesas: ravb: unintialized return value
From: David Miller <davem@davemloft.net>
In-Reply-To: <20161201205744.GB10701@mwanda>
References: <20161201205744.GB10701@mwanda>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Dan Carpenter <dan.carpenter@oracle.com>
Date: Thu, 1 Dec 2016 23:57:44 +0300

> We want to set the other "err" variable here so that we can return it
> later.  My version of GCC misses this issue but I caught it with a
> static checker.
> 
> Fixes: 9f70eb339f52 ("net: ethernet: renesas: ravb: fix fixed-link phydev leaks")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Applied.
