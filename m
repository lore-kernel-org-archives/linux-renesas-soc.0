Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:60640 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751954AbdFLN6P (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 12 Jun 2017 09:58:15 -0400
Date: Mon, 12 Jun 2017 09:58:13 -0400 (EDT)
Message-Id: <20170612.095813.58100051008915326.davem@davemloft.net>
To: niklas.soderlund+renesas@ragnatech.se
Cc: sergei.shtylyov@cogentembedded.com, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v3] sh_eth: add support for changing MTU
From: David Miller <davem@davemloft.net>
In-Reply-To: <20170612083903.1584-1-niklas.soderlund+renesas@ragnatech.se>
References: <20170612083903.1584-1-niklas.soderlund+renesas@ragnatech.se>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=iso-8859-1
Content-Transfer-Encoding: 8BIT
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
Date: Mon, 12 Jun 2017 10:39:03 +0200

> The hardware supports the MTU to be changed and the driver it self is
> somewhat prepared to support this. This patch hooks up the callbacks to
> be able to change the MTU from user-space.
> 
> Signed-off-by: Niklas S�derlund <niklas.soderlund+renesas@ragnatech.se>
> Acked-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied to net-next, thanks.
