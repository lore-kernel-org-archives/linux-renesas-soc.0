Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-lf0-f43.google.com ([209.85.215.43]:34539 "EHLO
        mail-lf0-f43.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1750945AbeABQJA (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 2 Jan 2018 11:09:00 -0500
Received: by mail-lf0-f43.google.com with SMTP id h140so5320749lfg.1
        for <linux-renesas-soc@vger.kernel.org>; Tue, 02 Jan 2018 08:08:59 -0800 (PST)
From: Ulf Hansson <ulf.hansson@linaro.org>
To: "Rafael J . Wysocki" <rjw@rjwysocki.net>, linux-pm@vger.kernel.org
Cc: Kevin Hilman <khilman@kernel.org>,
        Viresh Kumar <viresh.kumar@linaro.org>,
        Geert Uytterhoeven <geert+renesas@glider.be>,
        Simon Horman <horms@verge.net.au>,
        Niklas Soderlund <niklas.soderlund+renesas@ragnatech.se>,
        Vincent Guittot <vincent.guittot@linaro.org>,
        linux-renesas-soc@vger.kernel.org,
        Ulf Hansson <ulf.hansson@linaro.org>
Subject: [PATCH v3 0/4] PM / core: Extend behaviour for wakeup paths
Date: Tue,  2 Jan 2018 17:08:49 +0100
Message-Id: <1514909333-4450-1-git-send-email-ulf.hansson@linaro.org>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Changes in v3:
	- Dropped the DPM_FLAG_WAKEUP_PATH, thus re-placed patch 2 and patch 3
	with new patches.
	- Simplified patch4, according to suggestions by Rafael.
	- No changes to patch1.

The generic problem this series intends to solve, is that for some PM domains,
especially genpd, the current information in the dev->power.wakeup_path, is not
sufficient for a PM domain to fully understand how to treat devices in the
wakeup path during system suspend.

Particularly this applies to resources being consumed by the driver that has
configured system wakeup settings for its device. Currently the PM domain lacks
information about these consumed resources, which means it may decide to power
of their corresponding device and its attached PM domain, while they actually
would need to stay powered to allow system wakeup signals to be delivered.

Geert Uytterhoeven, has been working on these kind of problems for some Renesas
SoCs and there have been lots of discussions around this. So far I haven't
included any patches for dealing with the "OUT_BAND_WAKEUP" thingy, but I
suggest we do that in a second separate step, since it's not immediately needed
to fix the problems for the Renesas SoCs.

Ulf Hansson (4):
  PM / core: Assign the wakeup_path status flag in __device_prepare()
  PM / core: Propagate wakeup_path status flag in
    __device_suspend_late()
  PM / wakeup: Add device_set_wakeup_path() helper to control wakeup
    path
  PM / wakeup: Print warn if device gets enabled as wakeup source during
    sleep

 drivers/base/power/main.c   | 37 ++++++++++++++++++++-----------------
 drivers/base/power/wakeup.c |  3 +++
 include/linux/pm_wakeup.h   |  7 +++++++
 3 files changed, 30 insertions(+), 17 deletions(-)

-- 
2.7.4
