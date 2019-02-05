Return-Path: <SRS0=SaFT=QM=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.6 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,SIGNED_OFF_BY,
	SPF_PASS,URIBL_BLOCKED,USER_AGENT_MUTT autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E98CC282CB
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 23:24:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 1C030217F9
	for <linux-renesas-soc@archiver.kernel.org>; Tue,  5 Feb 2019 23:24:50 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="OMQwUVLL"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726558AbfBEXYt (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Tue, 5 Feb 2019 18:24:49 -0500
Received: from mail-pg1-f195.google.com ([209.85.215.195]:38796 "EHLO
        mail-pg1-f195.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726547AbfBEXYt (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Tue, 5 Feb 2019 18:24:49 -0500
Received: by mail-pg1-f195.google.com with SMTP id g189so2089820pgc.5;
        Tue, 05 Feb 2019 15:24:48 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to:user-agent;
        bh=y6quf0bZ+i54uyXDsSwKR9rvBS4RJJzGhFWAozP4PDE=;
        b=OMQwUVLLFtEDN6LSh4QIKNeFdrnN8C3D+7Je/GIkzdvaeWG9sypwBrzivNRTQ9iS25
         Y2Fuk5WXO+6LFyD68WA1jcfwOyMjaIm49IvJpl7GFF+xJHDxge9KXoYaqdgMhzvHvSso
         36EPyTPHfOgMb/BnAeHO8SlT8l7MlqfIIB6WJNe+PYzdIvOVTLYKqL0gTCxp4IRdcxiE
         7pgqA+XeozbbXjTNgl9ZPuyqR8lz8X0AEBpH4AHhHIU/pgFJJRvTSygUi0GgJiL+SNjL
         6TpiegQREO22pjQZ9QpcZPrClI42KfmwdOGEwFsG1n/LvQU1rrYuGCIgMSbKwkX7DGTk
         6VKw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to:user-agent;
        bh=y6quf0bZ+i54uyXDsSwKR9rvBS4RJJzGhFWAozP4PDE=;
        b=moIMnkSBKf6XEPeq0TPuVou3G13sURkVLxv4IwBaga5/F4vjwOnVjZbK9e2aLpTSbt
         iAEIQT46qHFPO/VH6QA60qZNYSiRygC4rqV5m2S/g4i/2wNnjmh+P9+cJWF+8PKEf64m
         +qe12XbfTJBMVkRaKu45uQSN+0/kMMWNomVpfMztGL6pS4latFoUwgFwNPdf4a9C5Doq
         PvcfkTosUvtzMQ9HkTiVe6H9Wz+7KC2BJV8IzsE90erlnhmRNCN3SrkqoHv3aEEC4G6d
         98vUORG3nXZJL1A42/ZdScplF3fTThc+M+XVjbgAx6G93EBxArpYHPPxI1Ar7mQvxcWH
         IFkQ==
X-Gm-Message-State: AHQUAuaDbW0iqJ6sVMOcZaXGQWtIjLMG8tkqRDEYWF1/DcpJBzB3n7TO
        c+cs1J+IIp3c0J/lq25ySB4=
X-Google-Smtp-Source: AHgI3IYlkND0tmxSkE0ZA+ddg+dgCBWbf2+xSwsAKCaQfvkHT8kde2xwt4sSBZ+t5ugTeukF8PYdFQ==
X-Received: by 2002:a63:105a:: with SMTP id 26mr6644257pgq.184.1549409088022;
        Tue, 05 Feb 2019 15:24:48 -0800 (PST)
Received: from localhost.localdomain ([2601:644:8201:32e0:7256:81ff:febd:926d])
        by smtp.gmail.com with ESMTPSA id n19sm106132pfh.115.2019.02.05.15.24.46
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 05 Feb 2019 15:24:46 -0800 (PST)
Date:   Tue, 5 Feb 2019 15:24:44 -0800
From:   Eduardo Valentin <edubezval@gmail.com>
To:     Marek Vasut <marek.vasut@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Marek Vasut <marek.vasut+renesas@gmail.com>
Subject: Re: [PATCH V3 3/6] thermal: Register hwmon in
 thermal_zone_of_sensor_register_param()
Message-ID: <20190205232442.GA4423@localhost.localdomain>
References: <20181217155644.29278-1-marek.vasut@gmail.com>
 <20181217155644.29278-4-marek.vasut@gmail.com>
 <20181218214439.GB8850@localhost.localdomain>
 <867ffa18-9c16-685a-7c83-7534bc14e41d@gmail.com>
 <a4aa607d-f83a-2ed4-09c2-fdcba308664d@gmail.com>
 <2b24720c-c649-44e0-0337-c8a52c78d33d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <2b24720c-c649-44e0-0337-c8a52c78d33d@gmail.com>
User-Agent: Mutt/1.5.23 (2014-03-12)
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On Mon, Jan 28, 2019 at 01:10:11PM +0100, Marek Vasut wrote:
> On 1/15/19 1:35 AM, Marek Vasut wrote:
> > On 12/22/18 3:19 AM, Marek Vasut wrote:
> >> On 12/18/2018 10:44 PM, Eduardo Valentin wrote:
> >>> On Mon, Dec 17, 2018 at 04:56:41PM +0100, marek.vasut@gmail.com wrote:
> >>>> From: Marek Vasut <marek.vasut@gmail.com>
> >>>>
> >>>> Register hwmon sysfs interface in thermal_zone_of_sensor_register_param()
> >>>> in case thermal_zone_params->no_hwmon is set to false. This behavior is
> >>>> the same as thermal_zone_device_register().
> >>>>
> >>>> From: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
> >>>> Cc: Eduardo Valentin <edubezval@gmail.com>
> >>>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
> >>>> Cc: Zhang Rui <rui.zhang@intel.com>
> >>>> Cc: linux-renesas-soc@vger.kernel.org
> >>>> To: linux-pm@vger.kernel.org
> >>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> >>>> ---
> >>>> V2: No change
> >>>> V3: - Work around the From line and SoB line checkpatch warning
> >>>>     - Reorder the SoB line at the end
> >>>> ---
> >>>>  drivers/thermal/of-thermal.c | 12 +++++++++++-
> >>>>  1 file changed, 11 insertions(+), 1 deletion(-)
> >>>>
> >>>> diff --git a/drivers/thermal/of-thermal.c b/drivers/thermal/of-thermal.c
> >>>> index e1a303a5698c..5ccff7b678de 100644
> >>>> --- a/drivers/thermal/of-thermal.c
> >>>> +++ b/drivers/thermal/of-thermal.c
> >>>> @@ -15,6 +15,7 @@
> >>>>  #include <linux/string.h>
> >>>>  
> >>>>  #include "thermal_core.h"
> >>>> +#include "thermal_hwmon.h"
> >>>>  
> >>>>  /***   Private data structures to represent thermal device tree data ***/
> >>>>  
> >>>> @@ -521,8 +522,15 @@ thermal_zone_of_sensor_register_params(struct device *dev, int sensor_id,
> >>>>  		if (sensor_specs.np == sensor_np && id == sensor_id) {
> >>>>  			tzd = thermal_zone_of_add_sensor(child, sensor_np,
> >>>>  							 data, ops);
> >>>> -			if (!IS_ERR(tzd))
> >>>> +			if (!IS_ERR(tzd)) {
> >>>> +				tzd->tzp = tzp;
> >>>
> >>> So, here you will overwrite what was done in of_parse_thermal_zones().
> >>> That means, after this point, property like sustainable power, slope and
> >>> offset are gone.
> >>
> >> Hmmmmm, that was rather inobvious, indeed.
> >>
> >> Do you have some suggestion how to pass in the no_hwmon = false then ?
> >> Since tzp->no_hwmon is set to true in of_parse_thermal_zones(), the
> >> three drivers (stm32, rcar, rcar_gen3) seem to hack around it. I'd like
> >> to clean that up.
> > 

Yeah, that is an issue.

> > Bump ?
> 
> Bump again, any suggestions ?

Yeah, a couple of ideas have been proposed for this issue.

First most tempting one is to have a DT property per thermal zone.
Making it linux specific, something prefixed by linux,<property>. I
recall Amit Kutcheria trying something similar to this, but dont
remember where that went. Frankly, this is a Linux thing, I am not
convinced DT is really the right place to fix this.

Another hack that could be written is a module parameter for of-thermal
that would reflect the no_hwmon value, globally. The down side here is
you have to make sure all drivers match that no_hwmon value, right?
> 
> -- 
> Best regards,
> Marek Vasut
