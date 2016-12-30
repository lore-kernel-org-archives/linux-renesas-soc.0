Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from mailout4.samsung.com ([203.254.224.34]:36858 "EHLO
        mailout4.samsung.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1753096AbcL3ELj (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Thu, 29 Dec 2016 23:11:39 -0500
From: Chanwoo Choi <cw00.choi@samsung.com>
To: kishon@ti.com, maxime.ripard@free-electrons.com, wens@csie.org
Cc: linux-kernel@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, chanwoo@kernel.org,
        Chanwoo Choi <cw00.choi@samsung.com>
Subject: [PATCH v2 0/2] phy: Replace the deprecated extcon API
Date: Fri, 30 Dec 2016 13:11:27 +0900
Message-id: <1483071089-8362-1-git-send-email-cw00.choi@samsung.com>
References: <CGME20161230041136epcas5p4e0229714cd00961e5d3cb5ef9923b7aa@epcas5p4.samsung.com>
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patches just replace the deprecated extcon API without any change
of extcon operation and use the resource-managed function for
extcon_register_notifier().

The new extcon API instead of deprecated API.
- extcon_set_cable_state_() -> extcon_set_state_sync();
- extcon_get_cable_state_() -> extcon_get_state();

Changes from v1:
- Rebase these patches based on v4.10-rc1.
- Drop the usb/power-supply/chipidea patches.

Chanwoo Choi (2):
  phy: rcar-gen3-usb2: Replace the deprecated extcon API
  phy: sun4i-usb: Replace the deprecated extcon API

 drivers/phy/phy-rcar-gen3-usb2.c | 8 ++++----
 drivers/phy/phy-sun4i-usb.c      | 4 ++--
 2 files changed, 6 insertions(+), 6 deletions(-)

-- 
1.9.1
