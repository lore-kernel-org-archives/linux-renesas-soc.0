Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7819AC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:29 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3976C2080F
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 14:26:29 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="VEjy2FpT"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729707AbeLOO02 (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 09:26:28 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:33455 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729687AbeLOO02 (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 09:26:28 -0500
Received: by mail-wm1-f67.google.com with SMTP id r24so1254742wmh.0;
        Sat, 15 Dec 2018 06:26:27 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=w2/jKi2gWd7ra3PJllURc7FusMvT+tvLFCzSiMR0aMM=;
        b=VEjy2FpTCU2t7BO9/xOqh1MVF009VUfdG6oxoHgkpbpSbNBZrX0UCRZ3LyyeTk5Cu5
         A99M5uiyTLfg2E0npS/svvmtU6FR0v++tLf/ffxLswJymV8i/DkrJhEy0LPVG7mP4Q/B
         ru+zLstO44aDDt7Dyn+wmVEYxDYfhg5nBRuJCHP0ZyoD12nHfCb3+x3DIFLDTcw+zsYK
         Wz29xk4qkumGofZmfWS00GSxb2daChYJzRrHAq6ADRKSR9NpQn07CTzhrk0J/iEnr374
         DKDPnqd9k4bdok1B6RvmTwyudLcTpU+CFScd9eKK6YP3cLlPZhbdp3oOSUdX3Ht4e6bN
         TL4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=w2/jKi2gWd7ra3PJllURc7FusMvT+tvLFCzSiMR0aMM=;
        b=VYcFgz9lAlav2+XJfgCitUrOf7nSfEvS7SUmnF+Cycn7Fs4ErwaTXchnBAubEn76Qj
         m7kgLdgn3OS46/xPYySzq2Plr9v3sRr+UtxdKRtMcwoA6EJqT5ndZYZ1ss/7KSWE1+DW
         RCr9WfgZwZHM/uUljHqE/McFKIMqZeOU4CzJ0NhD9upKJGJL+go5tsW+FV+Kx9StU3ED
         UitN/zjupkA5k6f6/cckMuNs4C02839UQJe03Japa79BIyOFuAFXTw4rwN5wIQt/3wa6
         jz8PJKBI9Kzd2gwu2YbXNdCJBgbwCazyTDnAYldj1e3TC5k5ZYlx51yts4XOmXaM6/1N
         TPkA==
X-Gm-Message-State: AA+aEWZCQ6QSLwytMiIq8hCiipo3we4Aht7RKPNFUYK8GkerJS80D/lT
        0zh1Nmg4cEpxo3bZNb6JBA4PfXuh
X-Google-Smtp-Source: AFSGD/VBacyHtTC/jNCiasII8MexHbCZ6XKyZhSuwzrM/OhEmlsXI8K2ueJZtgBZQoA2m/RtdZQS/Q==
X-Received: by 2002:a1c:9dcc:: with SMTP id g195mr6112838wme.153.1544883985755;
        Sat, 15 Dec 2018 06:26:25 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c7sm15401225wre.64.2018.12.15.06.26.24
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 06:26:24 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-gpio@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Linus Walleij <linus.walleij@linaro.org>,
        Bartosz Golaszewski <bgolaszewski@baylibre.com>
Subject: [PATCH V3 00/14] gpio: pca953x: Code cleanup and regmap conversion
Date:   Sat, 15 Dec 2018 15:25:51 +0100
Message-Id: <20181215142605.15397-1-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

Clean the PCA953x driver up, convert to regmap and add suspend/resume support.

Marek Vasut (14):
  gpio: pca953x: Deduplicate the bank_shift
  gpio: pca953x: Fix AI overflow on PCAL6524
  gpio: pca953x: Repair multi-byte IO address increment on PCA9575
  gpio: pca953x: Unify pca95{3,7}x_write_regs_16()
  gpio: pca953x: Unify pca953x_{read,write}_regs_{16,24}()
  gpio: pca953x: Unify pca953x_{read,write}_regs_{8,mul}()
  gpio: pca953x: Factor out common code from device_pca95xx_init()
  gpio: pca953x: Zap ad-hoc I2C block write in multi GPIO set
  gpio: pca953x: Extract the register address mangling to single
    function
  gpio: pca953x: Perform basic regmap conversion
  gpio: pca953x: Zap ad-hoc reg_direction cache
  gpio: pca953x: Zap ad-hoc reg_output cache
  gpio: pca953x: Zap single use of pca953x_read_single()
  gpio: pca953x: Restore registers after suspend/resume cycle

 drivers/gpio/Kconfig        |   1 +
 drivers/gpio/gpio-pca953x.c | 484 ++++++++++++++++++++++--------------
 2 files changed, 303 insertions(+), 182 deletions(-)

V2: Minor fixes in 01,02,14/14
V3: The only change is in 10/14, where we select REGMAP_I2C in Kconfig,
    since the driver uses regmap now

Cc: Linus Walleij <linus.walleij@linaro.org>
Cc: Bartosz Golaszewski <bgolaszewski@baylibre.com>

-- 
2.18.0

