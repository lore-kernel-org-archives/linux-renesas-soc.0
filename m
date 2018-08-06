Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from bin-mail-out-05.binero.net ([195.74.38.228]:22636 "EHLO
        bin-mail-out-05.binero.net" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1728198AbeHFVXg (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 6 Aug 2018 17:23:36 -0400
From: =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
To: Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Ulf Hansson <ulf.hansson@linaro.org>, linux-mmc@vger.kernel.org
Cc: linux-renesas-soc@vger.kernel.org,
        =?UTF-8?q?Niklas=20S=C3=B6derlund?=
        <niklas.soderlund+renesas@ragnatech.se>
Subject: [PATCH 0/2] mmc: renesas_sdhi: extend quirk selection to handle ES revisions
Date: Mon,  6 Aug 2018 21:12:25 +0200
Message-Id: <20180806191227.28401-1-niklas.soderlund+renesas@ragnatech.se>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi,

Recent datasheet updates have made it clear that some quirks are not SoC 
specific but SoC + ES version specific. Currently the quirks are 
selected using compatibility values but whit this new information that 
is not enough.

This small series adds support to select quirks based on SoC + ES 
revision using soc_device_match(). It handles the only quirk upstreamed 
so far, selection of 4-taps for HS400 mode on R-CarH3(ES1.0,ES2.0) and 
R-CarM3W(ES1.0,ES1.1).

As this solution makes the compatible selection method obsolete it is 
removed and all Gen3 compat values now points to the same data 
structure. The specific compats for H3 and M3-W are however kept in the 
driver for backward compatibility.

Based on mmc/next and tested on H3 ES2.0 and M3-N.

Niklas Söderlund (2):
  mmc: renesas_sdhi: handle 4tap hs400 mode quirk based on SoC revision
  mmc: renesas_sdhi: align compatibility properties for H3 and M3-W

 drivers/mmc/host/renesas_sdhi_core.c          | 26 +++++++++++++++++++
 drivers/mmc/host/renesas_sdhi_internal_dmac.c | 20 ++------------
 drivers/mmc/host/renesas_sdhi_sys_dmac.c      | 17 ++----------
 3 files changed, 30 insertions(+), 33 deletions(-)

-- 
2.18.0
