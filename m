Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:47037 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1752575AbeESU5y (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 19 May 2018 16:57:54 -0400
Received: by mail-lf0-f68.google.com with SMTP id z27-v6so2570822lfg.13
        for <linux-renesas-soc@vger.kernel.org>; Sat, 19 May 2018 13:57:53 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/3] sh_eth: fix typos/grammar
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <d47afee4-6fd5-af6d-885c-5b07996749fc@cogentembedded.com>
Date: Sat, 19 May 2018 23:57:50 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 3 patches against DaveM's 'net-next.git' repo plus the R8A77980
support patches posted earlier. They fix the comments typos/grammar and another
typo in the EESR bit...

[1/1] sh_eth: fix typo in EESR.TRO bit name
[2/3] sh_eth: fix comment grammar in 'struct sh_eth_cpu_data'
[3/3] sh_eth: fix typo in comment to BCULR write

MBR, Sergei
