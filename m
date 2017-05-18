Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from sauhun.de ([88.99.104.3]:44091 "EHLO pokefinder.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1753855AbdERVLx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 18 May 2017 17:11:53 -0400
From: Wolfram Sang <wsa+renesas@sang-engineering.com>
To: linux-i2c@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        Wolfram Sang <wsa+renesas@sang-engineering.com>
Subject: [RFC PATCH 0/2] i2c: sh_mobile: remove platform_data support
Date: Thu, 18 May 2017 23:11:38 +0200
Message-Id: <20170518211140.12023-1-wsa+renesas@sang-engineering.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Here is a cleanup series for the i2c-sh_mobile driver. Patch 1 states why I
think it can safely be removed, but I certainly want others people feedback on
this, so this is RFC for now. Found while cleaning up include/linux/i2c.

Wolfram Sang (2):
  i2c: sh_mobile: remove platform_data
  i2c: sh_mobile: drop needless check for of_node

 drivers/i2c/busses/i2c-sh_mobile.c | 28 ++++++++--------------------
 include/linux/i2c/i2c-sh_mobile.h  | 11 -----------
 2 files changed, 8 insertions(+), 31 deletions(-)
 delete mode 100644 include/linux/i2c/i2c-sh_mobile.h

-- 
2.11.0
