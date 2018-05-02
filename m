Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f53.google.com ([209.85.215.53]:45784 "EHLO
        mail-lf0-f53.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751078AbeEBTx0 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 2 May 2018 15:53:26 -0400
Received: by mail-lf0-f53.google.com with SMTP id y14-v6so22261355lfy.12
        for <linux-renesas-soc@vger.kernel.org>; Wed, 02 May 2018 12:53:26 -0700 (PDT)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Subject: [PATCH 0/2] sh_eth: complain on access to unimplemented TSU registers
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org, linux-sh@vger.kernel.org
Message-ID: <4a17ab65-4d9c-897e-c340-7d86e0296f2f@cogentembedded.com>
Date: Wed, 2 May 2018 22:53:23 +0300
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Language: en-MW
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 2 patches against DaveM's 'net-next.git' repo. The 1st patch
routes TSU_POST<n> register accesses thru sh_eth_tsu_{read|write}() and the 2nd
added WARN_ON() unimplemented register to those functions. I'm going to deal with
TSU_ADR{H|L}<n> registers in a later series...

[1/2] sh_eth: use TSU register accessors for TSU_POST<n>
[2/2] sh_eth: WARN_ON() access to unimplemented TSU register

MBR, Sergei
