Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pf0-f194.google.com ([209.85.192.194]:37005 "EHLO
        mail-pf0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752338AbdLMDjT (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 22:39:19 -0500
To: sergei.shtylyov@cogentembedded.com, davem@davemloft.net,
        niklas.soderlund+renesas@ragnatech.se, geert+renesas@glider.be,
        laurent.pinchart@ideasonboard.com, horms+renesas@verge.net.au
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Linux Kernel Mailing List <linux-kernel@vger.kernel.org>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] renesas/sh_eth: two possible sleep-in-atomic bugs in
 sh_eth_set_link_ksettings and sh_eth_nway_reset
Message-ID: <45698118-3050-d1c5-4e48-c318d0cd164d@gmail.com>
Date: Wed, 13 Dec 2017 11:39:07 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Accoring to drivers/net/ethernet/renesas/sh_eth.c, the driver may sleep 
under a spinlock.
The function call paths are:
sh_eth_set_link_ksettings (acquire the spinlock)
   phy_ethtool_ksettings_set
     phy_start_aneg
       phy_start_aneg_priv
         mutex_lock --> may sleep

sh_eth_nway_reset (acquire the spinlock)
   phy_start_aneg
     phy_start_aneg_priv
       mutex_lock --> may sleep

I do not find a good way to fix them, so I only report.
These possible bugs are found by my static analysis tool (DSAC) and 
checked by my code review.


Thanks,
Jia-Ju Bai
