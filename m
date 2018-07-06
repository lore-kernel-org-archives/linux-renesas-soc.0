Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f66.google.com ([209.85.221.66]:33737 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S933234AbeGFTEh (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 15:04:37 -0400
Received: by mail-wr1-f66.google.com with SMTP id k7-v6so5099451wrq.0
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 12:04:37 -0700 (PDT)
Subject: Re: [PATCH v2 04/14] sh_eth: remove custom .nway_reset from ethtool
 ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081245.7395-5-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <de3fa952-f262-5774-6f42-403de4327b09@cogentembedded.com>
Date: Fri, 6 Jul 2018 22:04:34 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081245.7395-5-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:12 AM, Vladimir Zapolskiy wrote:

> The generic phy_ethtool_nway_reset() function from phylib can be used
> instead of in-house sh_eth_nway_reset().
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
