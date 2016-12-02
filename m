Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33229 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1759049AbcLBJq7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 2 Dec 2016 04:46:59 -0500
Date: Fri, 2 Dec 2016 10:46:59 +0100
From: Johan Hovold <johan@kernel.org>
To: Dan Carpenter <dan.carpenter@oracle.com>
Cc: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>,
        Johan Hovold <johan@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Yoshihiro Kaneko <ykaneko0929@gmail.com>,
        Kazuya Mizuguchi <kazuya.mizuguchi.ks@renesas.com>,
        Simon Horman <horms+renesas@verge.net.au>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Andrew Lunn <andrew@lunn.ch>,
        Philippe Reynes <tremyfr@gmail.com>,
        Niklas =?iso-8859-1?Q?S=F6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>,
        Arnd Bergmann <arnd@arndb.de>, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: Re: [patch] net: renesas: ravb: unintialized return value
Message-ID: <20161202094659.GK29872@localhost>
References: <20161201205744.GB10701@mwanda>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20161201205744.GB10701@mwanda>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On Thu, Dec 01, 2016 at 11:57:44PM +0300, Dan Carpenter wrote:
> We want to set the other "err" variable here so that we can return it
> later.  My version of GCC misses this issue but I caught it with a
> static checker.
> Fixes: 9f70eb339f52 ("net: ethernet: renesas: ravb: fix fixed-link phydev leaks")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>

Thanks for catching this.

Reviewed-by: Johan Hovold <johan@kernel.org>

Johan
