Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:35713 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752447AbeEQIPR (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 17 May 2018 04:15:17 -0400
Received: by mail-lf0-f50.google.com with SMTP id y72-v6so7433224lfd.2
        for <linux-renesas-soc@vger.kernel.org>; Thu, 17 May 2018 01:15:16 -0700 (PDT)
Subject: Re: [PATCH 1/3] sh_eth: add RGMII support
To: Andrew Lunn <andrew@lunn.ch>
Cc: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>,
        linux-renesas-soc@vger.kernel.org
References: <087c91a3-a451-6de7-5e0f-a835f8cc98f1@cogentembedded.com>
 <38a56174-c05d-8864-adf0-d3099e426a60@cogentembedded.com>
 <20180516203031.GI26028@lunn.ch>
 <252cbfe6-ed4b-aebb-e5b7-1b60cec7fb69@cogentembedded.com>
 <20180516203724.GL26028@lunn.ch>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <13cbd134-3704-acd4-33bd-8689c9891a61@cogentembedded.com>
Date: Thu, 17 May 2018 11:15:14 +0300
MIME-Version: 1.0
In-Reply-To: <20180516203724.GL26028@lunn.ch>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 5/16/2018 11:37 PM, Andrew Lunn wrote:

>>> What about
>>> 	PHY_INTERFACE_MODE_RGMII_ID,
>>> 	PHY_INTERFACE_MODE_RGMII_RXID,
>>> 	PHY_INTERFACE_MODE_RGMII_TXID,
>>
>>     Oops, totally forgot about those... :-/
> 
> Everybody does. I keep intending to write a email template for
> this, and phy_interface_mode_is_rgmii() :-)

    The latter doesn't fit for *switch*, anyway.

> 	Andrew

MBR, Sergei
