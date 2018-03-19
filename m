Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:37032 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S965324AbeCSQhu (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 12:37:50 -0400
Received: by mail-wr0-f194.google.com with SMTP id z12so19322560wrg.4
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 09:37:49 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/3] pinctrl: sh-pfc: R-Car Gen 3 VIN4 deduplication
Date: Mon, 19 Mar 2018 17:37:42 +0100
Message-Id: <1521477465-1174-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This uses union vin_data and VIN_DATA_PIN_GROUP() to reduce redundancy
in the VIN4 pin data on H3, M3-W and D3 SoCs.

CU
Uli


Ulrich Hecht (3):
  pinctrl: sh-pfc: r8a7795: deduplicate VIN4 pin definitions
  pinctrl: sh-pfc: r8a7796: deduplicate VIN4 pin definitions
  pinctrl: sh-pfc: r8a77995: deduplicate VIN4 pin definitions

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  | 308 ++++++++--------------------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  | 308 ++++++++--------------------------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 154 ++++-------------
 3 files changed, 180 insertions(+), 590 deletions(-)

-- 
2.7.4
