Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f68.google.com ([209.85.215.68]:34109 "EHLO
        mail-lf0-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750945AbdLaSop (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 31 Dec 2017 13:44:45 -0500
Received: by mail-lf0-f68.google.com with SMTP id h140so1533476lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Sun, 31 Dec 2017 10:44:44 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20171231184134.684953583@cogentembedded.com>
Date: Sun, 31 Dec 2017 21:41:34 +0300
To: netdev@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Subject: [PATCH 0/2] Kill redundant checks in the Renesas Ethernet drivers
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 2 patches against DaveM's 'net-next.git' repo removing
redundant checks in the driver probe() methods.

[1/2] ravb: kill redundant check in the probe() method
[2/2] sh_eth: kill redundant check in the probe() method

MBR, Sergei
