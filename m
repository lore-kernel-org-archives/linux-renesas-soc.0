Return-Path: <SRS0=T57Y=2G=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AED24C43603
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Dec 2019 10:29:35 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 8251420725
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 16 Dec 2019 10:29:35 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=ideasonboard.com header.i=@ideasonboard.com header.b="nqIPkvBH"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727420AbfLPK3f (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 16 Dec 2019 05:29:35 -0500
Received: from perceval.ideasonboard.com ([213.167.242.64]:40678 "EHLO
        perceval.ideasonboard.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727070AbfLPK3f (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 16 Dec 2019 05:29:35 -0500
Received: from localhost.localdomain (cpc89242-aztw30-2-0-cust488.18-1.cable.virginm.net [86.31.129.233])
        by perceval.ideasonboard.com (Postfix) with ESMTPSA id 415FBA34;
        Mon, 16 Dec 2019 11:29:33 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
        s=mail; t=1576492173;
        bh=/Ae1A6fIuWX0Ip31Z4Xhsxz/W1T/aWVNo8XCcwXVpq8=;
        h=From:To:Subject:Date:In-Reply-To:References:From;
        b=nqIPkvBHJ943LPjniWnkJxTp9MDxwbGE7Y7gygeo/UYaRl3Q3YCe6X2Cya8o3cQsU
         bfzsQPnnNFK3YjHmVdQTpGmwdZFM+ya8Ib9Vko+XQYatJLNm39TcVdc+z/hZIMYY1e
         6xn9bXVBCn2+kQki6mtBt3ltINa1faAHPC0NIIYA=
From:   Kieran Bingham <kieran.bingham+renesas@ideasonboard.com>
To:     Jacopo Mondi <jacopo@jmondi.org>, linux-renesas-soc@vger.kernel.org
Subject: [RFC PATCH v6 00/13] GMSL Renesas Platform Support
Date:   Mon, 16 Dec 2019 10:29:17 +0000
Message-Id: <20191216102930.5867-1-kieran.bingham+renesas@ideasonboard.com>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
References: <20191211124459.20508-1-kieran.bingham+renesas@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Here is the current state of my GMSL v6 platform support which applies on top
of the recently posted MAX9286 driver.

These patches are marked RFC as they are not yet intended for integration, but
are posted to allow review and to build upon them with work that is currently
in progress by Jacopo.

This includes the RDACM20 driver which we still would like to refactor further
before posting to mainline (and we probably need max9286 to land or settle for
that too)

Included in this series are a few debug patches and workarounds.

I would specifically like to know if there is value in integrating:
  "[10/13] media: i2c: max9286: Introduce a debugfs layer"

directly into the max9286 driver, as I think there will be benefits to
developers to be able to expose state and statistics from this device.

The patch:
 "[01/13] media: i2c: max9286: Add GPIO chip controller"

Is currently blocked while we decide whether we should create this as an MFD
device - but expresses a means to expose the GPIO lines from the MAX9286 as a
GPIO controller directly.

These patches (and a few more specific debug patches, and configuration of 'my'
specific camera layout) are also available at:

 git://git.kernel.org/pub/scm/linux/kernel/git/kbingham/rcar.git
 Branch: gmsl/dev

--
Regards

Kieran



Jacopo Mondi (1):
  dt-bindings: media: i2c: Add bindings for IMI RDACM20

Kieran Bingham (10):
  media: i2c: max9286: Add GPIO chip controller
  media: i2c: Add RDACM20 driver
  arm64: dts: renesas: eagle: Provide MAX9286 GMSL deserialiser
  arm64: dts: renesas: eagle: Provide Eagle FAKRA dynamic overlay
  arm64: dts: renesas: eagle: Include Eagle FAKRA overlay
  arm64: dts: renesas: r8a7795-es1-salvator-x: Include MAX9286 8 Camera
    expansion board
  media: i2c: max9286: Introduce a debugfs layer
  [DNI:DEBUG] media: i2c: max9286: Add max9286_check_config_link()
  media: i2c: max9286: [Workaround] Hard delay while waiting to enable
    the V3M cameras
  media: i2c: max9286: [Workaround] 'device is bound'

Laurent Pinchart (1):
  arm64: dts: renesas: salvator-x: Add MAX9286 expansion board

Niklas Söderlund (1):
  arm64: dts: renesas: eagle: enable VIN

 .../bindings/media/i2c/imi,rdacm20.txt        |  66 ++
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 MAINTAINERS                                   |  10 +
 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi  | 128 +++
 .../dts/renesas/r8a7795-es1-salvator-x.dts    |   3 +
 .../arm64/boot/dts/renesas/r8a77970-eagle.dts | 154 +++
 .../boot/dts/renesas/salvator-x-max9286.dtsi  | 394 ++++++++
 drivers/media/i2c/Kconfig                     |  11 +
 drivers/media/i2c/Makefile                    |   1 +
 drivers/media/i2c/max9286.c                   | 291 +++++-
 drivers/media/i2c/rdacm20-ov10635.h           | 953 ++++++++++++++++++
 drivers/media/i2c/rdacm20.c                   | 613 +++++++++++
 12 files changed, 2624 insertions(+), 2 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/media/i2c/imi,rdacm20.txt
 create mode 100644 arch/arm64/boot/dts/renesas/eagle-fakra.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/salvator-x-max9286.dtsi
 create mode 100644 drivers/media/i2c/rdacm20-ov10635.h
 create mode 100644 drivers/media/i2c/rdacm20.c

-- 
2.20.1

