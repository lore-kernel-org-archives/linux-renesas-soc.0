Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ED7E3C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:24 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 0948C206C0
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:30:24 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="vV4nV4J9"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727634AbeLOCaY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:30:24 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:45843 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726890AbeLOCaX (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:30:23 -0500
Received: by mail-wr1-f67.google.com with SMTP id t6so6968478wrr.12;
        Fri, 14 Dec 2018 18:30:22 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=L5W4m6iIPSqDIVqOBS+h6G4ikwj0/qlRsxZ2Des1y+E=;
        b=vV4nV4J9h95YOS1Yym/7mg/P7CYEIIQlsUbkmR6tal3ReeFtZi4mToo3O+5Q2dgTWt
         Pi0JL3jhthjypKYrGdxm4cScdCJQWKjWmLZ7w8w6z9eQIS9ORSbTBs1iJX5xL9WICSQR
         If/3cn0uVWBakkf7LpAcBKQJ+t4k7jT8nBn1A1CYeHZgs5T9+h4fKJwuC6rxeDaTJpmr
         MlK1OcCg2SRMvUbPjCMH0nWaINOnjlllK/HTnsVxuXu8MxaSQkP+kDe51zxi4dnvIg4e
         Qk3egns1GFRyV5aa55mli5L8wNT+VqsF+t7ZOB0tcwXUP0HtixpYY/QKC8W5XU3eUiBr
         J46A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=L5W4m6iIPSqDIVqOBS+h6G4ikwj0/qlRsxZ2Des1y+E=;
        b=qVuveSE5AnVvGtZWLWGfjs0VxAFUJX7sEExS5SFzfvGiG5EHTO9i2q+7nWVf/L7YKS
         vRBiHQ6FvGEpYEejmSNWwrFE2JZdUwWMnhNVP3jVcUIzxOX5m/VGc+Cm0UjfjOagO9hg
         B+KQFRr9hLfo/OmJ5Nv9xD3R3HkbAfnXuCTiPr6bA2IAEbBOZW5/cXZmfDbtVt9CZ9mY
         MZ2Jf+XDcaFD7fjuO/9ZrItavlVxa63Yo8u+sHg8oUn9JmT7d+m9mTWZIQusedIYwz2y
         XC9u9Oqp8pFVoYmzO6PaQkOR/bCy6lszTElxhdPDC1Wa9kZDCznybI+0x32TZH2b9xkQ
         63Pg==
X-Gm-Message-State: AA+aEWbWWMDrxZLlxYPSKKSumU1jLdE/Mz0As2+S7fCLATQ3TQ1u+Ha6
        8FukxHNtoEtzOW2Xs3pE9Xlk9UEk
X-Google-Smtp-Source: AFSGD/VLVFNMaBMacjAZnbuCkphr9RhhCCEAX99py6A/BE/0MmqEZhKa3Jt6xBoiGs+/yIZg2o3v/w==
X-Received: by 2002:a05:6000:1251:: with SMTP id j17mr4181976wrx.315.1544841021494;
        Fri, 14 Dec 2018 18:30:21 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v19sm12151423wrd.46.2018.12.14.18.30.20
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:30:20 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V2 0/6] thermal: Align devm_thermal_zone_{device,of_sensor}_register
Date:   Sat, 15 Dec 2018 03:30:04 +0100
Message-Id: <20181215023010.2857-1-marek.vasut+renesas@gmail.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

This patchset attempts to align devm_thermal_zone_{device,of_sensor}_register()
functions and allow passing tz params to devm_thermal_zone_of_sensor_register()
to allow settings no_hwmon params without digging into the tz structures.

The approach is as follows:
1) Add {devm_,}thermal_zone_of_sensor_register_params(), which behaves just
   like the old variant without _params() suffix, except it takes the struct
   thermal_zone_params as an argument. The old _params()-less version of the
   function is converted to use the new function and pass params = NULL.
   The old _params()-less versions of the functions are retained to avoid
   breaking the ABI.
2) Add the no_hwmon handling into thermal_zone_of_sensor_register_params(),
   that's patch 3.
3) Convert drivers from devm_thermal_zone_of_sensor_register() with structure
   diggings to devm_thermal_zone_of_sensor_register_params() without any
   extra structure digging, that's the rest of the patches.

Marek Vasut (6):
  thermal: split thermal_zone_of_sensor_register{,_param}()
  thermal: split devm_thermal_zone_of_sensor_register{,_param}()
  thermal: Register hwmon in thermal_zone_of_sensor_register_param()
  thermal: stm32: Convert to
    devm_thermal_zone_of_sensor_register_params()
  thermal: rcar_thermal: Convert to
    devm_thermal_zone_of_sensor_register_params()
  thermal: rcar_gen3_thermal: Register hwmon sysfs interface

 drivers/thermal/of-thermal.c        | 106 +++++++++++++++++++++++++---
 drivers/thermal/rcar_gen3_thermal.c |   8 ++-
 drivers/thermal/rcar_thermal.c      |  33 ++++-----
 drivers/thermal/st/stm_thermal.c    |  20 ++----
 include/linux/thermal.h             |  25 +++++++
 5 files changed, 146 insertions(+), 46 deletions(-)

V2: Minor fixes to address feedback from the bot

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org

-- 
2.18.0

