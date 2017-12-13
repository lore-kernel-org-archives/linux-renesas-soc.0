Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-pl0-f68.google.com ([209.85.160.68]:37610 "EHLO
        mail-pl0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751871AbdLMDnp (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 12 Dec 2017 22:43:45 -0500
To: sergei.shtylyov@cogentembedded.com, davem@davemloft.net,
        horms+renesas@verge.net.au, kazuya.mizuguchi.ks@renesas.com,
        niklas.soderlund+renesas@ragnatech.se, geert+renesas@glider.be,
        erosca@de.adit-jv.com, yuval.shaia@oracle.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        "linux-kernel@vger.kernel.org >> Linux Kernel Mailing List"
        <linux-kernel@vger.kernel.org>
From: Jia-Ju Bai <baijiaju1990@gmail.com>
Subject: [BUG] renesas/ravb: two possible sleep-in-atomic bugs in
 ravb_set_link_ksettings and ravb_nway_reset
Message-ID: <60e1df6b-71de-63e0-2c48-2e6d6a35923a@gmail.com>
Date: Wed, 13 Dec 2017 11:43:33 +0800
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Accoring to drivers/net/ethernet/renesas/ravb_main.c, the driver may 
sleep under a spinlock.
The function call paths are:
ravb_set_link_ksettings (acquire the spinlock)
   phy_ethtool_ksettings_set
     phy_start_aneg
       phy_start_aneg_priv
         mutex_lock --> may sleep

ravb_nway_reset (acquire the spinlock)
   phy_start_aneg
     phy_start_aneg_priv
       mutex_lock --> may sleep

I do not find a good way to fix them, so I only report.
These possible bugs are found by my static analysis tool (DSAC) and 
checked by my code review.


Thanks,
Jia-Ju Bai
