Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35717 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S935829AbdADMJk (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 4 Jan 2017 07:09:40 -0500
Received: by mail-lf0-f45.google.com with SMTP id b14so303203415lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 04 Jan 2017 04:09:39 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] sh_eth: E-MAC interrupt handler cleanups
Date: Wed, 04 Jan 2017 15:09:36 +0300
Message-ID: <64514012.uUvlhX0YRQ@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's a set of 3 patches against DaveM's 'net-next.git' repo. I'm cleaning
up the E-MAC interrupt handling with the main goal of factoring out the E-MAC
interrupt handler into a separate function.

[1/3] sh_eth: handle only enabled E-MAC interrupts
[2/3] sh_eth: no need for *else* after *goto*
[3/3] sh_eth: factor out sh_eth_emac_interrupt()

MBR, Sergei
