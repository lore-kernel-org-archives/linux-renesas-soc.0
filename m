Return-Path: <SRS0=IwST=O2=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.1 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 29A4EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:53 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id F111E2133F
	for <linux-renesas-soc@archiver.kernel.org>; Mon, 17 Dec 2018 15:56:52 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="pQiP8ZNK"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2387847AbeLQP4w (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Mon, 17 Dec 2018 10:56:52 -0500
Received: from mail-wr1-f68.google.com ([209.85.221.68]:37199 "EHLO
        mail-wr1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2387635AbeLQP4w (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Mon, 17 Dec 2018 10:56:52 -0500
Received: by mail-wr1-f68.google.com with SMTP id s12so12379769wrt.4;
        Mon, 17 Dec 2018 07:56:51 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=0Jie6Xeqe+sguIyQlfPiTeQ07VPsmwAzAaUNyJbhZxg=;
        b=pQiP8ZNK61B4PWKoUGyE0RvYZlsxasURrPI/KXdwzZ2R993zBLncVFUrqn9Kfzh7jd
         9fJglwvLvmxJj21DODmZn8Y/vNqmk0NYTwVYnTBRZFkrrKqsEDZ9XGo3EOAoJxK0uTVa
         O2gni2iyPxdPnHxcaDcd/2JM+WBeheWJg1IPVJDkQP5AVr6j1lYyBFBue1F82pgFMh/L
         MW8W84Nog6niT+nJmOI77fhA3bk5bM3vuxUtHUZyLnN5r0SFbavceXuXhL4t3oO8sIXM
         Q/MWAC6LXztciw/jtBQ98h9f6LL7FpTD/5AprWa/HLr+hSM6mCYAjstjl1qRoyefAwvQ
         JRyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=0Jie6Xeqe+sguIyQlfPiTeQ07VPsmwAzAaUNyJbhZxg=;
        b=M1beQ7/Mqbca4egEKR8DoU2oBwAu/+GC9RxapIxys92vyXpIv9Zg94QmDP5QMYJqnz
         ADrGkEbdyBAAjgH7MIEvgTq3zXpDH+3o0jNBy3s7uLnRFMSkxth5LizJxZwINr0PEPHT
         rG1kGtRoiA2Ejd64pEVQG10IJemcMz1HsXxOVcmh1qW7m1Qoq/+1yC4TOuL5RqS0neGS
         GL+56Wqwl8x/DUHlvMWfFf0jpnhLXcGeikLhrRZAmwHPK7m3tlfLRDqwaSgvW/QPhLN8
         gH0KrQLCx08KYdpIvM6sI/krt25lgYa8HifIxc3nRNgDcLpiGc8l7NLsGTTXTNvZOYb1
         8WXg==
X-Gm-Message-State: AA+aEWYfw277sMbE8f/P4++QqSF+2/6+Ja84q6sJWlbOJ0QxtsTWpC2D
        ajZulkQRFBOxAyERLhZFu2ArxojV
X-Google-Smtp-Source: AFSGD/VPWWwQ4I3uZ0142R0R9pZBSaWHlNrkw5CrSHnRCDDuN7mTaPmOisBr5BHYmzm3xhj18aGmNA==
X-Received: by 2002:a5d:68c3:: with SMTP id p3mr11596777wrw.34.1545062210254;
        Mon, 17 Dec 2018 07:56:50 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id z17sm869465wrv.2.2018.12.17.07.56.48
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 17 Dec 2018 07:56:49 -0800 (PST)
From:   marek.vasut@gmail.com
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH V3 0/6] thermal: Align devm_thermal_zone_{device,of_sensor}_register
Date:   Mon, 17 Dec 2018 16:56:38 +0100
Message-Id: <20181217155644.29278-1-marek.vasut@gmail.com>
X-Mailer: git-send-email 2.18.0
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

From: Marek Vasut <marek.vasut@gmail.com>

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
V3: - Work around the From line and SoB line checkpatch warning
    - Reorder the SoB line at the end

From: Marek Vasut <marek.vasut+renesas@gmail.com>
Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org

-- 
2.18.0

