Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:34726 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750871AbcHUF1t (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 21 Aug 2016 01:27:49 -0400
Date: Sat, 20 Aug 2016 22:27:48 -0700 (PDT)
Message-Id: <20160820.222748.369829527477678633.davem@davemloft.net>
To: tremyfr@gmail.com
Cc: sergei.shtylyov@cogentembedded.com,
        kazuya.mizuguchi.ks@renesas.com, ykaneko0929@gmail.com,
        horms+renesas@verge.net.au, masaru.nagai.vx@renesas.com,
        geert+renesas@glider.be, niklas.soderlund+renesas@ragnatech.se,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] net: ethernet: renesas: ravb: use phydev from
 struct net_device
From: David Miller <davem@davemloft.net>
In-Reply-To: <1471647139-1867-1-git-send-email-tremyfr@gmail.com>
References: <1471647139-1867-1-git-send-email-tremyfr@gmail.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Philippe Reynes <tremyfr@gmail.com>
Date: Sat, 20 Aug 2016 00:52:18 +0200

> The private structure contain a pointer to phydev, but the structure
> net_device already contain such pointer. So we can remove the pointer
> phy_dev in the private structure, and update the driver to use the
> one contained in struct net_device.
> 
> Signed-off-by: Philippe Reynes <tremyfr@gmail.com>

Applied.
