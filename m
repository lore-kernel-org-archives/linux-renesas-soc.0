Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:52440 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750768AbeAOTvM (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 15 Jan 2018 14:51:12 -0500
Date: Mon, 15 Jan 2018 14:51:11 -0500 (EST)
Message-Id: <20180115.145111.1674948548030681862.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-sh@vger.kernel.org
Subject: Re: [PATCH] sh_eth: dix dumping ARSTR
From: David Miller <davem@davemloft.net>
In-Reply-To: <20180113172207.201026516@cogentembedded.com>
References: <20180113172207.201026516@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 13 Jan 2018 20:22:01 +0300

> ARSTR  is always located at the start of the TSU register region, thus
> using add_reg()  instead of add_tsu_reg() in __sh_eth_get_regs() to dump it
> causes EDMR or EDSR (depending on the register layout) to be dumped instead
> of ARSTR.  Use the correct condition/macro there...
> 
> Fixes: 6b4b4fead342 ("sh_eth: Implement ethtool register dump operations")
> Signed-off-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

Applied to 'net' with subj. typo fixed :)
