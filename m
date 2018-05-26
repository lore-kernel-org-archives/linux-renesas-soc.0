Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f67.google.com ([74.125.82.67]:38401 "EHLO
        mail-wm0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032179AbeEZRvi (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 May 2018 13:51:38 -0400
Received: by mail-wm0-f67.google.com with SMTP id m129-v6so22196602wmb.3
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 May 2018 10:51:37 -0700 (PDT)
Subject: Re: [PATCH 1/6] ravb: remove custom .nway_reset from ethtool ops
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-ID: <bb3eaa46-137c-264f-732f-3cc87383a884@cogentembedded.com>
Date: Sat, 26 May 2018 20:51:35 +0300
MIME-Version: 1.0
In-Reply-To: <1527160318-10958-2-git-send-email-vladimir_zapolskiy@mentor.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/24/2018 02:11 PM, Vladimir Zapolskiy wrote:

> The change fixes a sleep in atomic context issue, which can be
> always triggered by running 'ethtool -r' command, because
> phy_start_aneg() protects phydev fields by a mutex.

   BTW, I was unable to trigger the BUG() with 'ethtool -r eth0' where 'eth0'
is EtherAVB. What am I doing wrong? :-)

MBR, Sergei
