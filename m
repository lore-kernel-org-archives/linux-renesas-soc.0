Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f170.google.com ([209.85.128.170]:40469 "EHLO
        mail-wr0-f170.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934686AbeFYUe4 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 25 Jun 2018 16:34:56 -0400
Received: by mail-wr0-f170.google.com with SMTP id g18-v6so14952301wro.7
        for <linux-renesas-soc@vger.kernel.org>; Mon, 25 Jun 2018 13:34:56 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] sh_eth: RPADIR related clean-ups
To: netdev@vger.kernel.org, "David S. Miller" <davem@davemloft.net>
Cc: linux-renesas-soc@vger.kernel.org
Message-ID: <2809eba8-4c9a-1d5f-a47d-8125777e365b@cogentembedded.com>
Date: Mon, 25 Jun 2018 23:34:52 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 2 patches against DaveM's 'net-next.git' repo. They are
clean-ups related to RPADIR (DMA padding to NET_IP_ALIGN)...

[1/2] sh_eth: fix *enum* RPADIR_BIT
[2/2] sh_eth: remove sh_eth_cpu_data::rpadir_value

MBR, Sergei
