Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:37379 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032136AbeEZRHf (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 May 2018 13:07:35 -0400
Received: by mail-wm0-f67.google.com with SMTP id l1-v6so22151105wmb.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 May 2018 10:07:35 -0700 (PDT)
Subject: Re: [PATCH 2/6] ravb: remove custom .get_link_ksettings from ethtool
 ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-3-git-send-email-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <d3db368c-62ae-28da-6be8-59f386d47188@cogentembedded.com>
Date: Sat, 26 May 2018 20:07:32 +0300
MIME-Version: 1.0
In-Reply-To: <1527160318-10958-3-git-send-email-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/24/2018 02:11 PM, Vladimir Zapolskiy wrote:

> The change replaces a custom implementation of .get_link_ksettings
> callback with a shared phy_ethtool_get_link_ksettings(), note that

> &priv->lock wrapping is not needed, because the lock does not
> serialize access to phydev fields.

   No BUG() here, AFAICT. But then this is not a fix but an enhancement.
And I would have done that in 2 steps: 1st removing the spinlock code
and the 2nd removing the custom method implementation. 

> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

MBR, Sergei
