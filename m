Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:52926 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750733AbeAOUKK (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 15:10:10 -0500
Date: Mon, 15 Jan 2018 15:10:09 -0500 (EST)
Message-Id: <20180115.151009.1771710412167174925.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH 0/2] sh_eth: simplify TSU initialization
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180114174742.388057652@cogentembedded.com>
References: <20180114174742.388057652@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 14 Jan 2018 20:47:42 +0300

> Here's a set of 2 patches against DaveM's 'net-next.git' repo. With those,
> I'm somewhat simplifying the TSU init code in the driver probe() method...
> 
> [1/2] sh_eth: gather all TSU init code in one place
> [2/2] sh_eth: get Ether port # only when needed

Series applied, thanks Sergei.
