Return-Path: <SRS0=NjMp=ST=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5EE61C282DA
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:10:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 307F0205F4
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 17 Apr 2019 15:10:47 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TQ9L4hN7"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731472AbfDQPKq (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Wed, 17 Apr 2019 11:10:46 -0400
Received: from mail-pl1-f178.google.com ([209.85.214.178]:35464 "EHLO
        mail-pl1-f178.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729395AbfDQPKq (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Wed, 17 Apr 2019 11:10:46 -0400
Received: by mail-pl1-f178.google.com with SMTP id w24so12182696plp.2
        for <linux-renesas-soc@vger.kernel.org>; Wed, 17 Apr 2019 08:10:46 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:date:message-id:subject;
        bh=gFUHkWhR5wcqYhhL5UBShOTDBq+CZay15T4ejX4ebik=;
        b=TQ9L4hN7MnvvFzFftk2bcPdRyGnoctjocwIVr5Rl/WWbQEsd3hHgsApLqHrGULsg2J
         cQ5HYPhNJI3XJiV3PIOxLDj8d29sBasr50zUfa8refJsWamb0tp3djekm/Klvyq6u/cZ
         bpWM/vrj/62RU9Qg0L9bhjN2gAHwJmYtFURKaXsLtX9J3RdWlPNepB/tM5wm545TA4oS
         7dXBG13n1LgM13klEE5zx+2kcOJk+rCbq72Ax5j8QgHxuQqp56g+MsLPIpBVRqmELTi+
         yv8Aj4ndRyf8foFPguxZNIvXafYFKHngitVbwRN/2ejm+rNGeDWrUtvC8lcOazNPgkdp
         gv/A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:date:message-id:subject;
        bh=gFUHkWhR5wcqYhhL5UBShOTDBq+CZay15T4ejX4ebik=;
        b=WTkafScECqfBlTu78fyZyfJivTE2qAf0JCzoZowl6yDtA1TYmagK1YYFfldV1/FCXQ
         xUoiHQ/mW50UFL3aOWDYWO/WBDPc6P7L4+mzAl8gPUExcbZTM2eMEtkhJWI5aYvX7tJu
         jpQm6mrPaoVLP/kVy08BBHXSNwfLIqxMAz2pirIE+8S0w/UFdpluycCxo4mkzih0K6Qu
         pL9FR7lYXdrhk607maT1qr33wkX9Fojmc8GtJRqOu4T0Aim/uZRShAYqNKaNHr6TJ99X
         OxVVJ9FbbUKcT0VcVsluheA0XtsdJlAC3VIXUSFd2KclrrI2yyQ8Agrb9sZSdDmL/t5d
         C0bA==
X-Gm-Message-State: APjAAAUJWvX3FfwBR+wcKKrftkMV2ZO++AkG3xDr1NQB3eHs3Tn6xyI0
        5RchlizAwlaWW/NbAG7nso99oSbC
X-Google-Smtp-Source: APXvYqzAQZMcUE8EBCcNct8ofijZIZCqcNt6idOJT6ZnuYORu8/fhoyFY0j5xreh5FP9hw81WOf8Lw==
X-Received: by 2002:a17:902:54c:: with SMTP id 70mr57452198plf.210.1555513845478;
        Wed, 17 Apr 2019 08:10:45 -0700 (PDT)
Received: from [127.0.0.1] (s214090.ppp.asahi-net.or.jp. [220.157.214.90])
        by smtp.gmail.com with ESMTPSA id h16sm41815009pgj.85.2019.04.17.08.10.43
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Wed, 17 Apr 2019 08:10:44 -0700 (PDT)
From:   Magnus Damm <magnus.damm@gmail.com>
To:     linux-renesas-soc@vger.kernel.org
Cc:     Magnus Damm <magnus.damm@gmail.com>
Date:   Thu, 18 Apr 2019 00:11:55 +0900
Message-Id: <155551391518.5261.925425188248761120.sendpatchset@octo>
Subject: [PATCH 0/4] arm: dts: Bootargs update for older boards from Renesas
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

arm: dts: Bootargs update for older boards from Renesas

[PATCH 1/4] arm: dts: kzm9d: Add rw parameter to bootargs
[PATCH 2/4] arm: dts: bockw: Reorder bootargs
[PATCH 3/4] arm: dts: marzen: Add rw to bootargs and use ip=dhcp
[PATCH 4/4] arm: dts: ape6evm: Reorder bootargs

These patches try to make bootargs more consistent across older boards with
32-bit ARM SoCs from Renesas. Simple reordering, adding rw parameter and in
case of Marzen we go from ip=on to ip=dhcp. I believe using the ip parameter
consistently across the boards is a good first step.

Signed-off-by: Magnus Damm <damm+renesas@opensource.se>
---

 Developed on top of renesas-devel-20190410-v5.1-rc4

arch/arm/boot/dts/emev2-kzm9d.dts     |    2 +-
 arch/arm/boot/dts/r8a73a4-ape6evm.dts |    2 +-
 arch/arm/boot/dts/r8a7778-bockw.dts   |    2 +-
 arch/arm/boot/dts/r8a7779-marzen.dts  |    2 +-
 4 files changed, 4 insertions(+), 4 deletions(-)


