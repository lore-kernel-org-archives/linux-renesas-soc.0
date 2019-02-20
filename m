Return-Path: <SRS0=Daww=Q3=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8EF70C43381
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 5EE6F2147C
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 20 Feb 2019 14:55:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pYyDGZUL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726271AbfBTOzA (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 20 Feb 2019 09:55:00 -0500
Received: from mail-pg1-f175.google.com ([209.85.215.175]:41119 "EHLO
        mail-pg1-f175.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726219AbfBTOy7 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 20 Feb 2019 09:54:59 -0500
Received: by mail-pg1-f175.google.com with SMTP id m1so11975108pgq.8
        for <linux-renesas-soc@vger.kernel.org>; Wed, 20 Feb 2019 06:54:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=2RrdifxpjyrCe1T3Z2T0yeTxYsnltG9S5uMRF++xOt8=;
        b=pYyDGZULBSGaqnZdT7jHyPg0cgZbunz4YnVqevU7f7/FNtyRODV6t+Vps5b/oNnFL4
         yn4+PJOQrCsd0A08x9s82Y4DAjD/hQzTZScsIFlgAWJOYkw0QY4cuNycOKk9zB4La9sJ
         C7/M4J36o2X3MizbNvjS9VPNu9F/bGUqM48VQo7JKio9KxjSkwWupfwTJy7ZthvZHGir
         dQQaNmEV63BDy8clgGBRRdacoHEJk0aGQSF1gu4xUKwO//Vn5qlEaxPsEUONJT5Vq8Ak
         PsgTF2ouK4yWzd1oUyvPm20aqcp1OR96VPINBlcMfQqud2xd+HG63lXSj8wdG0lH5HHM
         4Wbw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=2RrdifxpjyrCe1T3Z2T0yeTxYsnltG9S5uMRF++xOt8=;
        b=Th463j+6wcOrzQ79Tc8bDlSfpVwKTbwgPCYSf8nU7Pm1lG/3IzzD+7NPTpWHvKtdk0
         1ZiT5etXq8q54vvIxR+sZOC8oAVmjQbOCSj8THe1xQ52z9y5pST9t9QoC+wJ6ViTMOTz
         nTva/k66goBnQVUCXPE4IcCV0bVGTU/gPAmoMUcYn0Z+ciqOTlMlV0JVjXf/u7iGL17Q
         NU3U3UTNKdyzuPHpYyR1PR4d5/2HQ7C2awI23GWGJW80dRKvIJGp6j6kpSUtLyO1xKgV
         9LlM2tPBRG32CKDA3svct6rr6Ybh5rzexnyvSkkXoTTWtvZZfc4Dib3GaJ/NOAxzqB3j
         7gog==
X-Gm-Message-State: AHQUAuZR9UFu0/+KVIvXFfdaJ6Xkho3aczD09KXTH9fHrEIghJpm3mB8
        TFwwFB8JJw7PwkUIauHmEguy8bEY
X-Google-Smtp-Source: AHgI3IbWhTNejLX4BuaVl5bdCoCmfsg25uiF9hwfbPX1E2KJODIGA/qttLCm0cskHHW4F0gMRIR23Q==
X-Received: by 2002:a63:7e0e:: with SMTP id z14mr12525699pgc.436.1550674497997;
        Wed, 20 Feb 2019 06:54:57 -0800 (PST)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id g69sm38481579pfd.168.2019.02.20.06.54.55
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 20 Feb 2019 06:54:56 -0800 (PST)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Wed, 20 Feb 2019 23:55:48 +0900
Message-Id: <155067454871.15971.12157033067057246708.sendpatchset@octo>
Subject: [PATCH/RFC 00/09] IPMMU address translation enablement prototype
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

IPMMU address translation enablement prototype

[PATCH/RFC 01/09] iommu/ipmmu-vmsa: Disable IPMMU when address expansion is not needed
[PATCH/RFC 02/09] iommu/ipmmu-vmsa: Display system memory informationn during boot
[PATCH/RFC 03/09] iommu/ipmmu-vmsa: Introduce keepipmmu boot parameter
[PATCH/RFC 04/09] arm64: dts: renesas: ulcb: Introduce keepipmmu boot parameter
[PATCH/RFC 05/09] arm64: dts: renesas: salvator: Introduce keepipmmu boot parameter
[PATCH/RFC 06/09] arm64: dts: renesas: draak: Introduce keepipmmu boot parameter
[PATCH/RFC 07/09] arm64: dts: renesas: ebisu: Introduce keepipmmu boot parameter
[PATCH/RFC 08/09] arm64: dts: renesas: eagle: Introduce keepipmmu boot parameter
[PATCH/RFC 09/09] arm64: dts: renesas: cat874: Introduce keepipmmu boot parameter

These patches experiment with runtime detection of system memory amount
and location to check if all memory exists within 32 bits physical address
space or not. In case all memory exists within 32 bits then we can assume
address expansion via IPMMU will not be required so the white list code
will simply ignore enablement of IPMMU devices on systems with smaller
amounts of system memory.

Not intended for upstream merge however patch 1/9 might be not so far off.

Not-Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of next-20190215

 arch/arm64/boot/dts/renesas/r8a774c0-cat874.dts  |    2 -
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts   |    2 -
 arch/arm64/boot/dts/renesas/r8a77990-ebisu.dts   |    2 -
 arch/arm64/boot/dts/renesas/r8a77995-draak.dts   |    2 -
 arch/arm64/boot/dts/renesas/salvator-common.dtsi |    2 -
 arch/arm64/boot/dts/renesas/ulcb.dtsi            |    2 -
 drivers/iommu/ipmmu-vmsa.c                       |   29 +++++++++++++++++++++-
 7 files changed, 34 insertions(+), 7 deletions(-)


