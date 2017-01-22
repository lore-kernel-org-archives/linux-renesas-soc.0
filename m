Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f50.google.com ([209.85.215.50]:34753 "EHLO
        mail-lf0-f50.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751047AbdAVTRZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 22 Jan 2017 14:17:25 -0500
Received: by mail-lf0-f50.google.com with SMTP id v186so83507510lfa.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 22 Jan 2017 11:17:24 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/3] sh_eth: E-DMAC interrupt mask cleanups
Date: Sun, 22 Jan 2017 22:17:20 +0300
Message-ID: <1636105.gp4aQxGd5K@wasted.cogentembedded.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello.

   Here's a set of 3 patches against DaveM's 'net-next.git' repo. The main goal
of this set is to stop using the bare numbers for the E-DMAC interrupt masks.

[1/3] sh_eth: rename EESIPR bits
[2/3] sh_eth: add missing EESIPR bits
[3/3] sh_eth: stop using bare numbers for EESIPR values

MBR, Sergei
