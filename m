Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mail-wr0-f194.google.com ([209.85.128.194]:42730 "EHLO
        mail-wr0-f194.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S934466AbeCSQhZ (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 19 Mar 2018 12:37:25 -0400
Received: by mail-wr0-f194.google.com with SMTP id s18so19226029wrg.9
        for <linux-renesas-soc@vger.kernel.org>; Mon, 19 Mar 2018 09:37:25 -0700 (PDT)
From: Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
To: linux-renesas-soc@vger.kernel.org, geert@linux-m68k.org
Cc: laurent.pinchart@ideasonboard.com, kbingham@kernel.org,
        niklas.soderlund@ragnatech.se, sergei.shtylyov@cogentembedded.com,
        Ulrich Hecht <ulrich.hecht+renesas@gmail.com>
Subject: [PATCH 0/3] pinctrl: sh-pfc: R-Car Gen3 VIN4 18-bit pin control fixups
Date: Mon, 19 Mar 2018 17:37:17 +0100
Message-Id: <1521477440-1047-1-git-send-email-ulrich.hecht+renesas@gmail.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

Hi!

This fixes the incorrect RGB666 pin assignments reported by Geert in H3,
M3-W and D3 SoCs. Thank you!

CU
Uli


Ulrich Hecht (3):
  pinctrl: sh-pfc: r8a7795: correct VIN4 18-bit pins
  pinctrl: sh-pfc: r8a7796: correct VIN4 18-bit pins
  pinctrl: sh-pfc: r8a77995: correct VIN4 18-bit pins

 drivers/pinctrl/sh-pfc/pfc-r8a7795.c  | 24 ++++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a7796.c  | 24 ++++++++++++------------
 drivers/pinctrl/sh-pfc/pfc-r8a77995.c | 12 ++++++------
 3 files changed, 30 insertions(+), 30 deletions(-)

-- 
2.7.4
