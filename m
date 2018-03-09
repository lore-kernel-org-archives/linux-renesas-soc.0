Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:62874 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1750937AbeCILy7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 9 Mar 2018 06:54:59 -0500
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: thierry.reding@gmail.com
Cc: linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/2] pwm: rcar: Add suspend/resume support and cleanup for runtime_pm
Date: Fri,  9 Mar 2018 20:54:56 +0900
Message-Id: <1520596498-4801-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set improves power management for Renesas PWM driver.

Hien Dang (1):
  pwm: rcar: Use PM Runtime to control module clock

Yoshihiro Shimoda (1):
  pwm: rcar: add suspend/resume support

 drivers/pwm/pwm-rcar.c | 35 +++++++++++++++++++++++++++++------
 1 file changed, 29 insertions(+), 6 deletions(-)

-- 
1.9.1
