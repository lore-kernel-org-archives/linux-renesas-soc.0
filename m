Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f42.google.com ([209.85.215.42]:42904 "EHLO
        mail-lf0-f42.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751814AbeFBTcw (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 2 Jun 2018 15:32:52 -0400
Received: by mail-lf0-f42.google.com with SMTP id v135-v6so19495804lfa.9
        for <linux-renesas-soc@vger.kernel.org>; Sat, 02 Jun 2018 12:32:51 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] sh_eth: fix & clean up sh_eth_soft_swap()
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <9027499a-0e19-7721-a17f-26e86885da3f@cogentembedded.com>
Date: Sat, 2 Jun 2018 22:32:48 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 3 patches against DaveM's 'net-next.git' repo. First one fixes an
old buffer endiannes issue (luckily, the ARM SoCs are smart enough to not actually
care) plus couple clean ups around sh_eth_soft_swap()...

[1/1] sh_eth: make sh_eth_soft_swap() work on ARM
[2/3] sh_eth: uninline sh_eth_soft_swap()
[3/3] sh_eth: use DIV_ROUND_UP() in sh_eth_soft_swap()

MBR, Sergei
