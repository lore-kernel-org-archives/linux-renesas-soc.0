Return-Path: <linux-renesas-soc-owner@vger.kernel.org>
Received: from relmlor3.renesas.com ([210.160.252.173]:48217 "EHLO
        relmlie2.idc.renesas.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1727178AbeHaK4S (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 31 Aug 2018 06:56:18 -0400
From: Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
To: balbi@kernel.org, robh+dt@kernel.org, mark.rutland@arm.com
Cc: gregkh@linuxfoundation.org, linux-usb@vger.kernel.org,
        linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
        Yoshihiro Shimoda <yoshihiro.shimoda.uh@renesas.com>
Subject: [PATCH 0/3] usb: renesas_usbhs: add reset_control and multiple clocks management
Date: Fri, 31 Aug 2018 15:48:36 +0900
Message-Id: <1535698119-10132-1-git-send-email-yoshihiro.shimoda.uh@renesas.com>
MIME-Version: 1.0
Content-Type: text/plain
Sender: linux-renesas-soc-owner@vger.kernel.org
List-ID: <linux-renesas-soc.vger.kernel.org>

This patch set is based on Felipe's usb.git / testing/next branch
(the commit id is 5b394b2ddf0347bef56e50c69a58773c94343ff3) with
the following patch:

https://patchwork.kernel.org/patch/10574875/

Yoshihiro Shimoda (3):
  usb: renesas_usbhs: Add reset_control
  dt-bindings: usb: renesas_usbhs: add clock-names property
  usb: renesas_usbhs: Add multiple clocks management

 .../devicetree/bindings/usb/renesas_usbhs.txt      |  2 +
 drivers/usb/renesas_usbhs/common.c                 | 53 ++++++++++++++++++++++
 drivers/usb/renesas_usbhs/common.h                 |  5 ++
 3 files changed, 60 insertions(+)

-- 
1.9.1
