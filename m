Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4F9E4C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 18:38:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 180AB206C2
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 18:38:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="rouOFMHh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726533AbeLOSiY (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 13:38:24 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:35836 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbeLOSiY (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 13:38:24 -0500
Received: by mail-wm1-f67.google.com with SMTP id c126so8795385wmh.0;
        Sat, 15 Dec 2018 10:38:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=pJlVg7HIn7Ozl/BGW9MawugS8pSDKB2FkdmgcvhVRwI=;
        b=rouOFMHhgG7DrYkg0r9v2X1B7Vq+Lsdqv1quGQ3uOws+m8FIXGSfXbqn2QXAcoMUFt
         4fHACQnP9l/rWegKHaad1lrMQRm/mEa29VteLgjuhqQ6UjmOH06PXqOsCS0OdGNeBN0/
         ByOCJmewLXcazs9yAd/dAP6bdvCpSs0oainzsvNy2nlG/fLFfrTpBAGjyLILGa8niEq9
         pCCd4iqLyMreZvs5ojFCGLjs1NUHYsOBmPItuQZy5n0asauCVpr+uM+5UFabvunJZcd/
         vqfcpoc0Al7s4EIfzMi+yoDJ8ekqgJrdeJgGM0CThaiXlxhSAofTOo4biVFZ1hKBWsS7
         osyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=pJlVg7HIn7Ozl/BGW9MawugS8pSDKB2FkdmgcvhVRwI=;
        b=rJl6HN3qMh096f3vwDtyTACJCbe/4256DXVFSIFgYQ8K9F2v7gw06ELMyjJWtdGSHQ
         lcOfnQvEPwpxlLSHHpTi0x5idSLXxfd2CfQn2snQn7zOdoVtHyMmzKYIVmjNlpa4Ti5q
         OmAgk66cOqJPxMytLBL3+aNOK3uhAFEImn26UNQFw3ZqDTIeWX7aSqwgNej87haEZidC
         7gdRjKyZVYfwh0rJyN7svvuAi8yfBX4RKjhLs29Vt8Z9rF424HItJq0IQOTKBJo3dDZE
         tsqpOIvEnXKTCTfs/1IarVODYc60rsmsO/Y1hDXy+ERPVNky+KIjEBQ3TeFp3MeDFJQ5
         fZ8g==
X-Gm-Message-State: AA+aEWYtAnjXYDiRyFK0PU1AuACxS3uNhoxXju0a8MY0PK21XS59C8B9
        ZSa9ouGECNW2cPBRR50bR+w=
X-Google-Smtp-Source: AFSGD/XxLLBkQML9bloqXz0SNAQMlNZ4JCU/EV46OnVNX2sJ+f4W+dpcyjxjpfcEZOX17mowAz9xfw==
X-Received: by 2002:a1c:44d6:: with SMTP id r205mr7166036wma.50.1544899102440;
        Sat, 15 Dec 2018 10:38:22 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id c77sm9460009wmh.12.2018.12.15.10.38.21
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 10:38:21 -0800 (PST)
Subject: Re: [PATCH 1/6] thermal: split
 thermal_zone_of_sensor_register{,_param}()
To:     Eduardo Valentin <edubezval@gmail.com>
Cc:     linux-pm@vger.kernel.org, linux-renesas-soc@vger.kernel.org,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com>
 <20181215172351.GB10311@localhost.localdomain>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com>
Date:   Sat, 15 Dec 2018 19:38:20 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <20181215172351.GB10311@localhost.localdomain>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
> On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
>> Introduce new thermal_zone_of_sensor_register_params() function, which
>> allows passing struct thermal_zone_params into it and convert original
>> thermal_zone_of_sensor_register() to call it with params set to NULL.
>>
>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
> 
> Git complains about mismatch between From: and this SOB.

I recall a discussion about gmail stripping the +foo tags from email
addresses. I can add a From: tag into the patch to override this
braindeath, or is there a better solution ?

>> Cc: Daniel Lezcano <daniel.lezcano@linaro.org>
>> Cc: Eduardo Valentin <edubezval@gmail.com>
>> Cc: Wolfram Sang <wsa+renesas@sang-engineering.com>
>> Cc: Zhang Rui <rui.zhang@intel.com>
>> Cc: linux-renesas-soc@vger.kernel.org
>> To: linux-pm@vger.kernel.org
> 
> I would prefer if you put your SOB at the bottom.

[...]
-- 
Best regards,
Marek Vasut
