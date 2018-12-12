Return-Path: <SRS0=B/Gi=OV=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7572EC6783B
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 36B9F20811
	for <linux-renesas-soc@archiver.kernel.org>; Wed, 12 Dec 2018 01:49:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="e1GpagJ5"
DMARC-Filter: OpenDMARC Filter v1.3.2 mail.kernel.org 36B9F20811
Authentication-Results: mail.kernel.org; dmarc=fail (p=none dis=none) header.from=gmail.com
Authentication-Results: mail.kernel.org; spf=none smtp.mailfrom=linux-renesas-soc-owner@vger.kernel.org
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726267AbeLLBtu (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 11 Dec 2018 20:49:50 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:39842 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726201AbeLLBtt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 11 Dec 2018 20:49:49 -0500
Received: by mail-wr1-f66.google.com with SMTP id t27so16025911wra.6;
        Tue, 11 Dec 2018 17:49:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=from:to:cc:subject:date:message-id;
        bh=Zhl+/F8RjTeUlpGNm75mF1YDVxdbGW8rIkbOLsM7xpA=;
        b=e1GpagJ5RkQYZQ2S/kT5sPaCFKR8XKADt8Vvn4acHKxm5Vt5cViMJD6/lj7we33z/o
         WrxbUXUUP8ttYmnpzpuAdI/Q3yjUre835jNZ9syLL0pF0HgdDjJt9Mt8Zp/Bc+HyjG/G
         sAZxCi18+5p2gsPUo5YHg6wWfYbHjiFnx6lRIC+RpYlKaBZST3S/JyEHedmd0JpufEI2
         hCyapIsbS2u+vf9ZpEzEts5XWPqKl478q+NvlMfDVSpoklCWEU9KhfqV/UX8r3gihgOQ
         6mLl1ZQD2PXiP9IlKWljBAGXcLeN9oBo422BO6i5NG9ORFx/8QxcHvqoMRLsJ2baVp2c
         F8Gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id;
        bh=Zhl+/F8RjTeUlpGNm75mF1YDVxdbGW8rIkbOLsM7xpA=;
        b=c9bPecsTcove5BYw0KEwZeXlVt4en8BkRVLt3C//O8+MMX94eczwETEbf/L31K4eI6
         UpMgQ2DprV32HgZeJ3TF+Y75oM7Qn1jkAOTqHHqwzWJYOjJcyuvJapmAabd6s5eIu824
         P559Ad2Tkmls+AgeBQo1+XIw8XH09vqSDLKs3NYTdKT4wRIBheO2cWSirf6azL70d4cg
         rEq4OquZ0Th4hBxMsZN4LD7ZDyrJp5cc5/uU0Ju8hrWdwj8y5/y5tVtVSMg93mYoCINZ
         Ir/qgHRpHqrL1FzFCNN+bpmE+97BwIRnp8MP9MowM4E9XW1tbgQP8+CHZKSkQnoIMu5y
         G0yw==
X-Gm-Message-State: AA+aEWaE5n9PcWRoDXJw1BTpUFBzQ9rjBWYsCecOgkuuKqhU7Ndq7NRI
        kh35NNAhf2I8JH+0Bya5JRdnzl6h
X-Google-Smtp-Source: AFSGD/VCVSiUKM3s4tReKFUJqHGjKUfLapdpQDHoxRpnrEueynM0GhRrjTuIuTCi8lCjQf0iqVsdEw==
X-Received: by 2002:adf:f350:: with SMTP id e16mr14773454wrp.125.1544579387536;
        Tue, 11 Dec 2018 17:49:47 -0800 (PST)
Received: from kurokawa.lan (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id v8sm12887250wrq.53.2018.12.11.17.49.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 11 Dec 2018 17:49:46 -0800 (PST)
From:   Marek Vasut <marek.vasut@gmail.com>
X-Google-Original-From: Marek Vasut <marek.vasut+renesas@gmail.com>
To:     linux-pm@vger.kernel.org
Cc:     linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Eduardo Valentin <edubezval@gmail.com>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: [PATCH 0/6] thermal: Align devm_thermal_zone_{device,of_sensor}_register
Date:   Wed, 12 Dec 2018 02:49:21 +0100
Message-Id: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
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

 drivers/thermal/of-thermal.c        | 104 +++++++++++++++++++++++++---
 drivers/thermal/rcar_gen3_thermal.c |   8 ++-
 drivers/thermal/rcar_thermal.c      |  33 ++++-----
 drivers/thermal/st/stm_thermal.c    |  20 ++----
 include/linux/thermal.h             |  25 +++++++
 5 files changed, 144 insertions(+), 46 deletions(-)

Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
Cc: Eduardo Valentin <edubezval@gmail.com>
Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
Cc: Zhang Rui <rui.zhang@intel.com>
Cc: linux-renesas-soc@vger.kernel.org
To: linux-pm@vger.kernel.org

-- 
2.18.0

