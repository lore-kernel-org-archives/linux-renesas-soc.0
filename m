Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:37531 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934312AbeGFSsJ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 14:48:09 -0400
Received: by mail-wr1-f67.google.com with SMTP id q10-v6so5075498wrd.4
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 11:48:08 -0700 (PDT)
Subject: Re: [PATCH v2 03/14] sh_eth: simplify link auto-negotiation by
 ethtool
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081245.7395-4-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <a5bcaf2f-1a55-bc59-f826-96511112ac2a@cogentembedded.com>
Date: Fri, 6 Jul 2018 21:48:05 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081245.7395-4-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:12 AM, Vladimir Zapolskiy wrote:

> There is no need to call a heavyweight phy_start_aneg() for phy
> auto-negotiation by ethtool, the phy is already initialized and
> link auto-negotiation is started by calling phy_start() from
> sh_eth_phy_start() when a network device is opened.
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
