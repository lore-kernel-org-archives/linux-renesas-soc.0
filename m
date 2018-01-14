Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f67.google.com ([209.85.215.67]:33451 "EHLO
        mail-lf0-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751735AbeANRwA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sun, 14 Jan 2018 12:52:00 -0500
Received: by mail-lf0-f67.google.com with SMTP id j143so10875177lfg.0
        for <linux-renesas-soc@vger.kernel.org>; Sun, 14 Jan 2018 09:51:59 -0800 (PST)
From: Sergei Shtylyov <sergei.shtylyov@cogentembedded.com>
Message-Id: <20180114174742.388057652@cogentembedded.com>
Date: Sun, 14 Jan 2018 20:47:42 +0300
To: netdev@vger.kernel.org
To: linux-renesas-soc@vger.kernel.org
Cc: linux-sh@vger.kernel.org
Subject: [PATCH 0/2] sh_eth: simplify TSU initialization
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hello!

Here's a set of 2 patches against DaveM's 'net-next.git' repo. With those,
I'm somewhat simplifying the TSU init code in the driver probe() method...

[1/2] sh_eth: gather all TSU init code in one place
[2/2] sh_eth: get Ether port # only when needed

MBR, Sergei
