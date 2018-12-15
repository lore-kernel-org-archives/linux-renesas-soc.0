Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B0497C43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 20:13:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 714772086D
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 20:13:23 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="frE9ND5e"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728565AbeLOUNX (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 15:13:23 -0500
Received: from mail-wm1-f67.google.com ([209.85.128.67]:36707 "EHLO
        mail-wm1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1727403AbeLOUNW (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 15:13:22 -0500
Received: by mail-wm1-f67.google.com with SMTP id a18so8955110wmj.1;
        Sat, 15 Dec 2018 12:13:20 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=c/6LatkLSmO3mgpOSMp5YH5PKZuOdPJ5mVfM/z/YBwo=;
        b=frE9ND5e7hgFG/sGESrtUmxQZ5KTIL6NbMepd6MnwFJra/jw94BEac1SPxFZanEKlG
         S+J+58jZrrN1vBDxKbJpa5YbhE08q6jWCYEL++yK25DJtEX5S+hxvOgbfIWh8Drfy4zz
         z3sncgwkegYJvnkRGGisDrXd7c1Y3Qno9QjiItXuHspGB1iI6/f9uRmXuCPISSFeP1Sz
         BGyNS0+SzIfh4nnkNJi5WrMdzALdarXJtjXFvNS9nHN9GqmQmOMx5DksbmMKKa31YHFR
         FldHvNyfFe3taf0eoopvwUa6sYXVs5gvCDUkgws5y1eldM7s8AVBTi2NCF5YUsk+sPbo
         ZHrA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=c/6LatkLSmO3mgpOSMp5YH5PKZuOdPJ5mVfM/z/YBwo=;
        b=S/CB1BBL9Kordo2bGcDoIWL4BGaC9qmopX/zrju0u8ndg5Sn/Dy4w68NQVFOrVZcFJ
         vPyuImieWV0//H4CW6M9H6QDS7hY6B/FLo/xCEKtcM+7eKrzyvJ5nGm3LN+nqm7M4Oft
         IIUJU+I5lXDUn8uEdBPmQALShHBLKPbnxFZzFmTRYw8MNVYfFhRe7t+4cQGwdVm+M+o9
         8NtE17EP8nuH39YoBT1wrb7RqbkBu5xz9RPGPsmBuxiTXOUlQ49ORbV1MjHff3ehe4Ev
         qifOd5xl7mUPi3qEhPWHoU87oLPSysRoSnrUtTPYt5FfHyjc4RKqAuOLQysea77pBXkC
         1aug==
X-Gm-Message-State: AA+aEWZAV09SY2drimN9rFLDwVptRYOkF8NP3wQoQrcKpz3FrP5xh69t
        ktFhxAY7C4tv253joBflPbA=
X-Google-Smtp-Source: AFSGD/WKO/u1uRKdnsCzgYXkmskroqvbcrkZUqlENKJfK/F/RzHBasBwVUzyBfzkdZ8fsnZwWXxC+w==
X-Received: by 2002:a1c:af89:: with SMTP id y131mr2509166wme.105.1544904800010;
        Sat, 15 Dec 2018 12:13:20 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id l37sm13147048wre.69.2018.12.15.12.13.18
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 12:13:19 -0800 (PST)
Subject: Re: [PATCH 1/6] thermal: split
 thermal_zone_of_sensor_register{,_param}()
To:     Geert Uytterhoeven <geert@linux-m68k.org>
Cc:     Eduardo Valentin <edubezval@gmail.com>,
        Linux PM list <linux-pm@vger.kernel.org>,
        Linux-Renesas <linux-renesas-soc@vger.kernel.org>,
        Marek Vasut <marek.vasut+renesas@gmail.com>,
        Daniel Lezcano <daniel.lezcano@linaro.org>,
        Wolfram Sang <wsa+renesas@sang-engineering.com>,
        Zhang Rui <rui.zhang@intel.com>,
        Geert Uytterhoeven <geert+renesas@glider.be>
References: <20181212014927.25840-1-marek.vasut+renesas@gmail.com>
 <20181212014927.25840-2-marek.vasut+renesas@gmail.com>
 <20181215172351.GB10311@localhost.localdomain>
 <baebd957-e527-fd03-bbaf-cbfa4a7624ed@gmail.com>
 <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
 <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com>
 <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
 <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com>
 <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <09902cc4-ef25-cd36-0d4a-effeabcd233f@gmail.com>
Date:   Sat, 15 Dec 2018 21:13:18 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUJPLu2H5dYZjFG1oKYOoXiQGE6_S8BFK8c7Nue_Dfqzg@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/15/2018 09:00 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, Dec 15, 2018 at 8:07 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 12/15/2018 07:54 PM, Geert Uytterhoeven wrote:
>>> On Sat, Dec 15, 2018 at 7:49 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 12/15/2018 07:47 PM, Geert Uytterhoeven wrote:
>>>>> On Sat, Dec 15, 2018 at 7:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>>>> On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
>>>>>>> On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
>>>>>>>> Introduce new thermal_zone_of_sensor_register_params() function, which
>>>>>>>> allows passing struct thermal_zone_params into it and convert original
>>>>>>>> thermal_zone_of_sensor_register() to call it with params set to NULL.
>>>>>>>>
>>>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>>>
>>>>>>> Git complains about mismatch between From: and this SOB.
>>>>>>
>>>>>> I recall a discussion about gmail stripping the +foo tags from email
>>>>>> addresses. I can add a From: tag into the patch to override this
>>>>>> braindeath, or is there a better solution ?
>>>>>
>>>>> Run the "git format-patch" command from a git repo where user.email
>>>>> is marek.vasut@gmail.com, so it will retain the original From: tag in the
>>>>> email body, as it is different?
>>>>
>>>> I can also manually patch the From tags or add them, but it's all
>>>> workarounds.
>>>
>>> Use a different outgoing email server? I use my ISP's.
>>
>> Or maybe it'd make sense to fix git to handle the +tags correctly ?
> 
> What needs to be fixed?
> If user.email != From, git format-patch generates a From: header, else
> it doesn't. Doesn't that make sense?

I believe the complaint here is that email address in From does not
match email address in SoB line, because some SMTP servers scrub the
+foo tag from From: and not from SoB-line . And yet, the SoB line is
from the same person/email address as the email address in From, so they
are equal. I think git should just ignore the +foo tag in SoB line.

-- 
Best regards,
Marek Vasut
