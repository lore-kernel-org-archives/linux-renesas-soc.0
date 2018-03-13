Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor4.renesas.com ([210.160.252.174]:5516 "EHLO
        relmlie3.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1752041AbeCMISb (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 13 Mar 2018 04:18:31 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: thierry.reding@gmail.com
Cc: linux-pwm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH v2 0/2] pwm: rcar: Add suspend/resume support and cleanup for runtime_pm
Date: Tue, 13 Mar 2018 17:18:16 +0900
Message-Id: <1520929098-20873-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set improves power management for Renesas PWM driver.

Changes from v1:
 - Add Reviewed-by Geert-san in patch 1 (Thanks!).
 - Check a condition in suspend/resume if requested or not in patch 2.

Hien Dang (1):
  pwm: rcar: Use PM Runtime to control module clock

Yoshihiro Shimoda (1):
  pwm: rcar: add suspend/resume support

 drivers/pwm/pwm-rcar.c | 50 ++++++++++++++++++++++++++++++++++++++++++++------
 1 file changed, 44 insertions(+), 6 deletions(-)

-- 
1.9.1
