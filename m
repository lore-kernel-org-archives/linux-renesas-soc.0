Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f45.google.com ([209.85.215.45]:35851 "EHLO
        mail-lf0-f45.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750982AbdA2NVQ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 29 Jan 2017 08:21:16 -0500
Received: by mail-lf0-f45.google.com with SMTP id z134so182669299lff.3
        for <linux-renesas-soc@vger.kernel.org>; Sun, 29 Jan 2017 05:20:56 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
To: netdev@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org
Subject: [PATCH v2 0/3] sh_eth: E-DMAC interrupt mask cleanups
Date: Sun, 29 Jan 2017 15:06:39 +0300
Message-ID: <3387005.NzsGXf10rT@wasted.cogentembedded.com>
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
