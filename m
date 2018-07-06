Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41170 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934527AbeGFTP1 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 6 Jul 2018 15:15:27 -0400
Received: by mail-wr1-f67.google.com with SMTP id h10-v6so5133924wrq.8
        for <linux-renesas-soc@vger.kernel.org>; Fri, 06 Jul 2018 12:15:26 -0700 (PDT)
Subject: Re: [PATCH v2 07/14] sh_eth: remove custom .set_link_ksettings from
 ethtool ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S . Miller" <davem@davemloft.net>
Cc: Andrew Lunn <andrew@lunn.ch>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <20180704081245.7395-1-vladimir_zapolskiy@mentor.com>
 <20180704081451.7482-3-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <af68b09f-bdc1-30a3-0a7e-b155aa4692f9@cogentembedded.com>
Date: Fri, 6 Jul 2018 22:15:23 +0300
MIME-Version: 1.0
In-Reply-To: <20180704081451.7482-3-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 07/04/2018 11:14 AM, Vladimir Zapolskiy wrote:

> The generic phy_ethtool_set_link_ksettings() function from phylib can
> be used instead of in-house sh_eth_set_link_ksettings().
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

Reviewed-by: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>

MBR, Sergei
