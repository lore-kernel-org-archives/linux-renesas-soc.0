Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f68.google.com ([74.125.82.68]:56003 "EHLO
        mail-wm0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032274AbeEZSq0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 May 2018 14:46:26 -0400
Received: by mail-wm0-f68.google.com with SMTP id a8-v6so22147324wmg.5
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 May 2018 11:46:25 -0700 (PDT)
Subject: Re: [PATCH 4/6] sh_eth: remove custom .nway_reset from ethtool ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-5-git-send-email-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <919f9993-1a31-5b37-76aa-6268c6e686ba@cogentembedded.com>
Date: Sat, 26 May 2018 21:46:21 +0300
MIME-Version: 1.0
In-Reply-To: <1527160318-10958-5-git-send-email-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/24/2018 02:11 PM, Vladimir Zapolskiy wrote:

> The change fixes a sleep in atomic context issue, which can be
> always triggered by running 'ethtool -r' command, because
> phy_start_aneg() protects phydev fields by a mutex.

   Again, I'm unable to reproduce this BUG()...

> Another note is that the change implicitly replaces phy_start_aneg()
> with a newer phy_restart_aneg().
> 
> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
[...]

MBR, Sergei
