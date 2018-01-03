Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from shards.monkeyblade.net ([184.105.139.130]:32810 "EHLO
        shards.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751305AbeACPWD (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 3 Jan 2018 10:22:03 -0500
Date: Wed, 03 Jan 2018 10:21:55 -0500 (EST)
Message-Id: <20180103.102155.745876383952341968.davem@davemloft.net>
To: sergei.shtylyov@cogentembedded.com
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
Subject: Re: [PATCH 0/2] Kill redundant checks in the Renesas Ethernet
 drivers
From: David Miller <davem@davemloft.net>
In-Reply-To: <20171231184134.684953583@cogentembedded.com>
References: <20171231184134.684953583@cogentembedded.com>
Mime-Version: 1.0
Content-Type: Text/Plain; charset=us-ascii
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Date: Sun, 31 Dec 2017 21:41:34 +0300

> Here's a set of 2 patches against DaveM's 'net-next.git' repo removing
> redundant checks in the driver probe() methods.

Series applied with the "disassembly" typo fixed.
