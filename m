Return-Path: <SRS0=oRiM=O4=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D5DCC43387
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 26D2121850
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 19 Dec 2018 10:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="NzVbvk4q"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728786AbeLSKZl (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 19 Dec 2018 05:25:41 -0500
Received: from mail-pg1-f193.google.com ([209.85.215.193]:41507 "EHLO
        mail-pg1-f193.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727310AbeLSKZl (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 19 Dec 2018 05:25:41 -0500
Received: by mail-pg1-f193.google.com with SMTP id m1so7621968pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 19 Dec 2018 02:25:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=N9POvgPbRDG0N0+KviDEA+cbDoogdhctILcTpV9uZ/Q=;
        b=NzVbvk4qsC1uN8FTwg94rAALX7PGUfJubfHdknxjw27dla5bbuE6JhCIJ2TTTSn6EM
         bnZSEH+26vVYs7N3aDLkQJAHVdaJTLrqPnp2NJNLKGKAbH+sWQgS3Ah4wEyXPGnCTodH
         bD1BngkYVJ7k9VU5jnZX/hU+zzBM5gpo+UcgRaeUyM9VKnHhiTVtJaPFiXqy+wDEn42W
         X2V1CVvRrs98/jzHAs/NT0MLBbxfHRr3DoiNKIc+s7nppS+/BnMVJbbk5jbh3lwmdaZX
         EAhHInTsGf76ig2x6c9FJCYMpGHGhw0iyTP4ceeZ8niHFIGPQhmGbWQ5UKMSF1lkpWN1
         52sQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=N9POvgPbRDG0N0+KviDEA+cbDoogdhctILcTpV9uZ/Q=;
        b=Rzp+El9KmISygrusLEeNiYC8DMskPhrgjVBDZTqCDeTC3UFoWs61/KzBSphWlSferD
         Nava33d301hwQwOxvQW/tZ1ELiveqvcBgLMc+Q6eKIyS9MVPn88qsTT16PTlHlH214UO
         mAmWGWBFnmJ1Qtr3AA1a0E9mGezRDom38kGk2gj9mM48jdW43UkowqiQDnu4k/qv/WCy
         4HfMjorX71mxn2hgWhT1ZNypK6yP6cQf8xomvPhobsxTmUw0s+w4tUygLuPGYJOO2SUV
         +2AmGHPAI16FbmvRc5Ww6GCtUUGOr8MCLfd3momZBiCL1XPtfPlZEIq4Wsg+Z2ZhyvcM
         MfDA==
X-Gm-Message-State: AA+aEWYMPnu2fKQGhCif45yp76jcEKal9+fQvu9M2NtXwzR7Wl3elX7I
        xiY6EnzJQIoykt3sve8GAlcrYhDk
X-Google-Smtp-Source: AFSGD/UlDpCHj9pnuN0l4eh2nASd+spXviYakx5kS0LmN033AJrFVxTjB1DP4MsC1cN5c1Mh7fxBjg==
X-Received: by 2002:a62:da5a:: with SMTP id w26mr19939642pfl.106.1545215139214;
        Wed, 19 Dec 2018 02:25:39 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id l184sm26381568pfc.112.2018.12.19.02.25.36
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 19 Dec 2018 02:25:38 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 19 Dec 2018 19:26:06 +0900
Message-Id: <154521516632.7290.5245227863765109428.sendpatchset@octo>
Subject: [PATCH 00/09] Test R-Car Gen3 IMR-LX4 device
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Test R-Car Gen3 IMR-LX4 device

[PATCH 01/09] Prototype code for basic IMR-LX4 test
[PATCH 02/09] arm64: dts: renesas: r8a7795: One IMR-LX4 device for R-Car H3
[PATCH 03/09] arm64: dts: renesas: r8a7796: One IMR-LX4 device for R-Car M3-W
[PATCH 04/09] arm64: dts: renesas: r8a77965: One IMR-LX4 device for R-Car M3-N
[PATCH 05/09] arm64: dts: renesas: r8a77970: One IMR-LX4 device for R-Car V3M
[PATCH 06/09] arm64: dts: renesas: r8a77980: One IMR-LX4 device for R-Car V3H
[PATCH 07/09] arm64: dts: renesas: r8a77995: One IMR-LX4 device for R-Car D3
[PATCH 08/09] arm64: dts: renesas: r8a77990: One IMR-LX4 device for R-Car E3
[PATCH 09/09] Random build workarounds for renesas-drivers

These patches temporarily introduce a IMR-LX4 driver that uses Runtime PM
to control clocks and power when performing a basic reset of the device.

The user should check console printouts and verify that register settings
are changed after the reset has been performed during probe().

Not intended for upstream merge. Successfully tested on H3 ES2 ULCB.

Created as an example of how to test power domains for a certain device.
I hope to use this approach to test IPMMU power domain support in the future.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-drivers-2018-12-18-v4.20-rc7

 arch/arm64/boot/dts/renesas/r8a7795.dtsi        |   30 ---------
 arch/arm64/boot/dts/renesas/r8a7796.dtsi        |   10 ---
 arch/arm64/boot/dts/renesas/r8a77965.dtsi       |   11 +++
 arch/arm64/boot/dts/renesas/r8a77970.dtsi       |   10 +++
 arch/arm64/boot/dts/renesas/r8a77980.dtsi       |   10 +++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi       |   10 +++
 arch/arm64/boot/dts/renesas/r8a77995.dtsi       |   10 +++
 arch/arm64/include/asm/smp.h                    |    2 
 drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c |    2 
 drivers/soc/renesas/Makefile                    |    2 
 drivers/soc/renesas/renesas-test-imr-lx4.c      |   71 +++++++++++++++++++++++
 drivers/tty/serial/sh-sci.c                     |    2 
 12 files changed, 126 insertions(+), 44 deletions(-)
