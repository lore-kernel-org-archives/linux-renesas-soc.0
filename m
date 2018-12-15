Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-2.5 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_MUTT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 564F2C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:02:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 660A2206C2
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 02:02:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="IQwMVZ60"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729969AbeLOCCd (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Fri, 14 Dec 2018 21:02:33 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:33250 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1729029AbeLOCCd (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Fri, 14 Dec 2018 21:02:33 -0500
Received: by mail-pg1-f195.google.com with SMTP id z11so3492177pgu.0;
        Fri, 14 Dec 2018 18:02:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=8UYTCbuhlw+hk9DmnoFdjp6lawT6jIUZqbGkvG6yHF8=;
        b=IQwMVZ60L/DmoQPcPk2ge7YrM7HBmEZzBsCSSyopTJ6pNAGcvSBcPH6dHXV51PzY0r
         7brJaQoc9WuKjgbnT+4jrnFY9rFSzNvol58ubnUMOFsQ4kdskGySocXhNj9UaCISWCZL
         kncZi9fZEtckAxYVNWrGB16mjwKY92aSMU5saIxe4zo4b5QNHpv1Z8g3Kg5SbaFcoySd
         WnKTwotG3QvvvojvsDv0aFGO8e3kzuUp4GGd5UyBxM+aI6cipz/wSK84r0q9YZKL/VPv
         yYbuXsPlPMHiZZLUk3B2qXX6W7KWInTb2lfOekQM0T0PviimjUpJS47qdKEo5YPvuHfs
         B86Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=8UYTCbuhlw+hk9DmnoFdjp6lawT6jIUZqbGkvG6yHF8=;
        b=lpFUqYxTs/tDo7z3sMXjf7O1s3PKTtQFzWcG/y3LgnFGRyM8CpDQMSj/ZGV95YJ2iB
         1BCeG+b4lbO1TcH7b2oabmYnpi03At221qZX81f3UC20T8GbeTBRh1ytcicuQ5l5m335
         6VH2+ghWTbVIOvslAiB2weadKnkUzju+puPdGLHL+J2pfFeJ5NrWhniw9txd321BaFkN
         0v3OZTbA0aAHP8kkXqONCWCjR3SLXMmjwNCyDP0YTon6eDum0QL51gbEu7D4XqCydENf
         AlQX1uKD2WWB85fLoEAIdoefyIptjbu0zBLD4cPKFmn8+6uLDR1hzFA1jhkr+trC0RuD
         yuug==
X-Gm-Message-State: AA+aEWbFRm6tDtq8UGz+k4c2dQrOFowVYSaxBqgWC/DaOKbETtdDvuQ3
        ssgdPGR3qKoQY5aKELKiEVjtYg8M
X-Google-Smtp-Source: AFSGD/UogEFoRMqcgEvxJCs1abd5QZM2RGyPQkYcNsw10BwdkQvmE1XIGNYQv9OGWZWJTVeiIT1sbw==
X-Received: by 2002:a62:60c5:: with SMTP id u188mr5038112pfb.4.1544839352401;
        Fri, 14 Dec 2018 18:02:32 -0800 (PST)
Received: from localhost.localdomain ([73.93.152.175])
        by smtp.gmail.com with ESMTPSA id i1sm9097813pgb.46.2018.12.14.18.02.31
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Fri, 14 Dec 2018 18:02:31 -0800 (PST)
Date:   Fri, 14 Dec 2018 18:02:29 -0800
From:   Eduardo Valentin <edubezval@gmail.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>
Subject: Re: [PATCH 0/6] thermal: Align
 devm_thermal_zone_{device,of_sensor}_register
Message-ID: <20181215020228.GB24528@localhost.localdomain>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Wed, Dec 12, 2018 at 02:49:21AM +0100, Marek Vasut wrote:
> This patchset attempts to align devm_thermal_zone_{device,of_sensor}_register()
> functions and allow passing tz params to devm_thermal_zone_of_sensor_register()
> to allow settings no_hwmon params without digging into the tz structures.
> 
> The approach is as follows:
> 1) Add {devm_,}thermal_zone_of_sensor_register_params(), which behaves just
>    like the old variant without _params() suffix, except it takes the struct
>    thermal_zone_params as an argument. The old _params()-less version of the
>    function is converted to use the new function and pass params = NULL.
>    The old _params()-less versions of the functions are retained to avoid
>    breaking the ABI.
> 2) Add the no_hwmon handling into thermal_zone_of_sensor_register_params(),
>    that's patch 3.
> 3) Convert drivers from devm_thermal_zone_of_sensor_register() with structure
>    diggings to devm_thermal_zone_of_sensor_register_params() without any
>    extra structure digging, that's the rest of the patches.
> 
> Marek Vasut (6):
>   thermal: split thermal_zone_of_sensor_register{,_param}()
>   thermal: split devm_thermal_zone_of_sensor_register{,_param}()
>   thermal: Register hwmon in thermal_zone_of_sensor_register_param()
>   thermal: stm32: Convert to
>     devm_thermal_zone_of_sensor_register_params()
>   thermal: rcar_thermal: Convert to
>     devm_thermal_zone_of_sensor_register_params()
>   thermal: rcar_gen3_thermal: Register hwmon sysfs interface
> 

Fix the errors reported by the bot and also please run checkpatch.pl on
your series.

>  drivers/thermal/of-thermal.c        | 104 +++++++++++++++++++++++++---
>  drivers/thermal/rcar_gen3_thermal.c |   8 ++-
>  drivers/thermal/rcar_thermal.c      |  33 ++++-----
>  drivers/thermal/st/stm_thermal.c    |  20 ++----
>  include/linux/thermal.h             |  25 +++++++
>  5 files changed, 144 insertions(+), 46 deletions(-)
> 
> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> Cc: Eduardo Valentin <edubezval@gmail.com>
> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> Cc: Zhang Rui <rui.zhang@intel.com>
> Cc: linux-renesas-soc@vger.kernel.org
> To: linux-pm@vger.kernel.org
> 
> -- 
> 2.18.0
> 
