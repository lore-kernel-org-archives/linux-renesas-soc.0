Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:59358 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750734AbeBPVfX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 16 Feb 2018 16:35:23 -0500
Date: Fri, 16 Feb 2018 16:35:21 -0500 (EST)
Message-Id: <20180216.163521.2244800833732729149.davem@davemloft.net>
To: niklas.soderlund+renesas@ragnatech.se
Cc: sergei.shtylyov@cogentembedded.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2] ravb: add support for changing MTU
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180216161008.12882-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180216161008.12882-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
Date: Fri, 16 Feb 2018 17:10:08 +0100

> Allow for changing the MTU within the limit of the maximum size of a
> descriptor (2048 bytes). Add the callback to change MTU from user-space
> and take the configurable MTU into account when configuring the
> hardware.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Applied.

However, most drivers support MTU change while the interface is up and
frankly that is what is most useful for users.
