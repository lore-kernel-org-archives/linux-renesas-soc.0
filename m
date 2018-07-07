Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([23.128.96.9]:34720 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1754386AbeGGX6m (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 7 Jul 2018 19:58:42 -0400
Date: Sun, 08 Jul 2018 08:58:34 +0900 (KST)
Message-Id: <20180708.085834.1283723823527928346.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: vladimir_zapolskiy@mentor.com, andrew@lunn.ch,
        geert@linux-m68k.org, netdev@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH v2 00/14] ravb/sh_eth: fix sleep in atomic by reusing
 shared ethtool handlers
From: David Miller <davem@davemloft.net>
In-Reply-To: <14b0b5fd-02d1-3b57-ec7c-eacdf8bff091@cogentembedded.com>
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
        <20180707.104719.681210882015993840.davem@davemloft.net>
        <14b0b5fd-02d1-3b57-ec7c-eacdf8bff091@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sat, 7 Jul 2018 18:22:08 +0300

>    So you applied the whole series to net.git... that was somewhat
>    unexpected, at least by me. Care to share your reasoning?

It's fixes a sleep in atomic which is a serious bug.
