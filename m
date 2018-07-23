Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lj1-f176.google.com ([209.85.208.176]:38140 "EHLO
        mail-lj1-f176.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387873AbeGWTK7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 23 Jul 2018 15:10:59 -0400
Received: by mail-lj1-f176.google.com with SMTP id p6-v6so1327885ljc.5
        for <linux-renesas-soc@vger.kernel.org>; Mon, 23 Jul 2018 11:08:34 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/5] sh_eth: clean up the TSU register accessors
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <24093fd0-1b9b-a211-f988-0272483185d6@cogentembedded.com>
Date: Mon, 23 Jul 2018 21:08:31 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 5 patches against DaveM's 'net-next.git' repo. They do a final
clean up of the TSU register accessors...

[1/1] sh_eth: uninline sh_eth_tsu_get_offset()
[2/3] sh_eth: make sh_eth_tsu_get_offset() match its name
[3/3] sh_eth: call sh_eth_tsu_get_offset() from TSU register accessors
[4/5] sh_eth: make sh_eth_tsu_write_entry() take 'offset' parameter
[5/5] sh_eth: make sh_eth_tsu_{read|write}_entry() prototypes symmetric

MBR, Sergei
