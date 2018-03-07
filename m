Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:53256 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933932AbeCGPke (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 7 Mar 2018 10:40:34 -0500
Date: Wed, 07 Mar 2018 10:40:33 -0500 (EST)
Message-Id: <20180307.104033.1799598549716294161.davem@davemloft.net>
To: niklas.soderlund+renesas@ragnatech.se
Cc: sergei.shtylyov@cogentembedded.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH] ravb: remove erroneous comment
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180303223954.14152-1-niklas.soderlund+renesas@ragnatech.se>
References: <20180303223954.14152-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
Date: Sat,  3 Mar 2018 23:39:54 +0100

> When addressing a review comment in a early version of the offending
> patch a comment where left in which should have been removed. Remove the
> comment to keep it consistent with the code.
> 
> Fixes: 75efa06f457bbed3 ("ravb: add support for changing MTU")
> Reported-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>

Applied to net-next, thanks.
