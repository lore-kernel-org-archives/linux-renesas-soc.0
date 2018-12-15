Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DD81BC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 19:07:54 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 9FE3F2086D
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 19:07:54 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="KurU2VB4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727168AbeLOTHy (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 14:07:54 -0500
Received: from mail-wr1-f66.google.com ([209.85.221.66]:43294 "EHLO
        mail-wr1-f66.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726533AbeLOTHx (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 14:07:53 -0500
Received: by mail-wr1-f66.google.com with SMTP id r10so8462602wrs.10;
        Sat, 15 Dec 2018 11:07:52 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Y5ikDRphHQyvwuVQSuhEcBF0sPvGI9QuiCbj1D24EFI=;
        b=KurU2VB4N9uj9ZdAYBmpV1ho7dEToxsSyMfujH+GNnnKjoZscWtuq6xZ0Y2ZumGUS2
         6Q9njIhgWPd+jKAVnoRjfhWYvlIDSXm5dkLYMTuS7GVYf5IfS1UFc8kvbHoArKYqGawJ
         tChu1DcJC/cIk8ayz8t4bHOPC+14T0dYVhakNzmZZ8YNUWuqw4wZkRtTC7o/KDdY4ddN
         SgeDoRxJN50+QPkDjNEK8mqFOgWPsXlN6AEAiV/7h48UjrD4sxdpBe+BnHH/J9X4WO60
         pYMJmeb2k33fS8Kz26HLsETh5gzHzCLYtxVqoReDS4k9tpUGzymjpDFW2D4y5T4DNI5c
         PtGA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Y5ikDRphHQyvwuVQSuhEcBF0sPvGI9QuiCbj1D24EFI=;
        b=Ms/QI3tX9u0UHYFypy5mcKjlWmUE3JQSdBY1tF2nRX/UwjVp7jTSJ2F5lLbWpCsvSt
         qlryVqqxfmRUorOMDelqJqEMovV7rHovVD4mXGAdUv/io5q6m9z5VP2A+59JKOBTxxFi
         9B9mmatsv4e5Mqj/MKJUr94jY4CUwiOPkQs6YSXGE1iQmldQ1qlqqS0T9WVbTfGJQZcb
         buobxqq0BCk3K5K9CsQd/truADXIxWtoXCh9tJB2zwvqWAX091hC05oXfS8lBp4HyyFl
         KPRikWbgb/127L6zuLJOhVy3+cAsSWWD1OkVCu24jvsjLalRZUrOjGZO+IMgHAXg48Zu
         ezMw==
X-Gm-Message-State: AA+aEWb7mx4oMLfWf6o62CCnMTx1Yruqis77yRT/YWpvnP2/4NGm/uHe
        RiFdqiMlnO16PwFN8Q72CEo=
X-Google-Smtp-Source: AFSGD/WcLqiuP1/RmHREuUtjmFWZUqRyvfEjeCP/9kAmxBgScRUynXBNQMXkEVDKQ2yNbCtq+JoNTw==
X-Received: by 2002:a5d:634b:: with SMTP id b11mr6107198wrw.14.1544900871876;
        Sat, 15 Dec 2018 11:07:51 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id 14sm13414553wmv.36.2018.12.15.11.07.50
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 11:07:51 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <076ebc8e-32a3-99bf-6d8a-7a0bae22b427@gmail.com>
Date:   Sat, 15 Dec 2018 20:07:50 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdUAVYk0Xx56H+V1usFa3627Zk7erewrtP-2HG02neit9A@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/15/2018 07:54 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, Dec 15, 2018 at 7:49 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 12/15/2018 07:47 PM, Geert Uytterhoeven wrote:
>>> On Sat, Dec 15, 2018 at 7:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>>>> On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
>>>>> On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
>>>>>> Introduce new thermal_zone_of_sensor_register_params() function, which
>>>>>> allows passing struct thermal_zone_params into it and convert original
>>>>>> thermal_zone_of_sensor_register() to call it with params set to NULL.
>>>>>>
>>>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>>>
>>>>> Git complains about mismatch between From: and this SOB.
>>>>
>>>> I recall a discussion about gmail stripping the +foo tags from email
>>>> addresses. I can add a From: tag into the patch to override this
>>>> braindeath, or is there a better solution ?
>>>
>>> Run the "git format-patch" command from a git repo where user.email
>>> is marek.vasut@gmail.com, so it will retain the original From: tag in the
>>> email body, as it is different?
>>
>> I can also manually patch the From tags or add them, but it's all
>> workarounds.
> 
> Use a different outgoing email server? I use my ISP's.

Or maybe it'd make sense to fix git to handle the +tags correctly ?

-- 
Best regards,
Marek Vasut
