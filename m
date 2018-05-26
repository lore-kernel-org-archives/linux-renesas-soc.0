Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wm0-f66.google.com ([74.125.82.66]:53211 "EHLO
        mail-wm0-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1032357AbeEZTW7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 26 May 2018 15:22:59 -0400
Received: by mail-wm0-f66.google.com with SMTP id 18-v6so16728667wml.2
        for <linux-renesas-soc@vger.kernel.org>; Sat, 26 May 2018 12:22:59 -0700 (PDT)
Subject: Re: [PATCH 4/6] sh_eth: remove custom .nway_reset from ethtool ops
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>,
        "David S. Miller" <davem@davemloft.net>
Cc: netdev@vger.kernel.org, linux-renesas-soc@vger.kernel.org
References: <1527160318-10958-1-git-send-email-vladimir_zapolskiy@mentor.com>
 <1527160318-10958-5-git-send-email-vladimir_zapolskiy@mentor.com>
 <919f9993-1a31-5b37-76aa-6268c6e686ba@cogentembedded.com>
Message-ID: <da2a8cd8-9e75-bdd5-673b-a73c3b25819a@cogentembedded.com>
Date: Sat, 26 May 2018 22:22:55 +0300
MIME-Version: 1.0
In-Reply-To: <919f9993-1a31-5b37-76aa-6268c6e686ba@cogentembedded.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

On 05/26/2018 09:46 PM, Sergei Shtylyov wrote:

>> The change fixes a sleep in atomic context issue, which can be
>> always triggered by running 'ethtool -r' command, because
>> phy_start_aneg() protects phydev fields by a mutex.
> 
>    Again, I'm unable to reproduce this BUG()...

   Now I can! I started to suspect this check needs to be specifically enabled
under the Kernel Hacking menu, and it turned out to be so...

>> Another note is that the change implicitly replaces phy_start_aneg()
>> with a newer phy_restart_aneg().
>>
>> Signed-off-by: Vladimir Zapolskiy <vladimir_zapolskiy@mentor.com>
> [...]

MBR, Sergei
