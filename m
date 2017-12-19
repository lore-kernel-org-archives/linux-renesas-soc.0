Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f65.google.com ([209.85.215.65]:34946 "EHLO
        mail-lf0-f65.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1751072AbdLSVW6 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 19 Dec 2017 16:22:58 -0500
Received: by mail-lf0-f65.google.com with SMTP id j124so21741355lfg.2
        for <linux-renesas-soc@vger.kernel.org>; Tue, 19 Dec 2017 13:22:58 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: Kishon Vijay Abraham I <kishon@ti.com>,
        linux-kernel@vger.kernel.org
Cc: "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>,
        Geert Uytterhoeven <geert@linux-m68k.org>,
        linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH 0/3] phy: core: Re-work runtime PM deployment and fix an issue
Date: Tue, 19 Dec 2017 22:22:28 +0100
Message-Id: <1513718551-28624-1-git-send-email-ulf.hansson@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

The intend of this series is to simplify the runtime PM deployment in the phy
core, but while doing that fixing a related problem for a Renesas SoC making use
of a phy. This issue was raised by Geert Uytterhoeven and Yoshihiro Shimoda, due
to a changed behaviour in the runtime PM core.

The commit in question is f8817f61e821 (PM / runtime: Drop children check from
__pm_runtime_set_status()). However, it turned out that the problem existed
already prior this change, only that the error was printed instead of giving a
WARN splat.

More details about the changes are available in each change log. For additional
background, please have look at the link below.

https://patchwork.kernel.org/patch/10086651/

Ulf Hansson (3):
  phy: core: Move runtime PM reference counting to the parent device
  phy: core: Drop unused runtime PM APIs
  phy: core: Update the runtime PM section in the docs to reflect
    changes

 Documentation/phy.txt   | 28 +++++++-------
 drivers/phy/phy-core.c  | 99 +++++++------------------------------------------
 include/linux/phy/phy.h | 45 ----------------------
 3 files changed, 28 insertions(+), 144 deletions(-)

-- 
2.7.4
