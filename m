Return-Path: <SRS0=gd9z=OY=vger.kernel.org=linux-renesas-soc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-4.0 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,FREEMAIL_FORGED_FROMDOMAIN,FREEMAIL_FROM,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B6A9EC43387
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 18:49:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 7A0DE2084D
	for <linux-renesas-soc@archiver.kernel.org>; Sat, 15 Dec 2018 18:49:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="lRIhEOH2"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726813AbeLOSte (ORCPT
        <rfc822;linux-renesas-soc@archiver.kernel.org>);
        Sat, 15 Dec 2018 13:49:34 -0500
Received: from mail-wr1-f67.google.com ([209.85.221.67]:41781 "EHLO
        mail-wr1-f67.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1726520AbeLOSte (ORCPT
        <rfc822;linux-renesas-soc@vger.kernel.org>);
        Sat, 15 Dec 2018 13:49:34 -0500
Received: by mail-wr1-f67.google.com with SMTP id x10so8451502wrs.8;
        Sat, 15 Dec 2018 10:49:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20161025;
        h=subject:to:cc:references:from:message-id:date:user-agent
         :mime-version:in-reply-to:content-language:content-transfer-encoding;
        bh=Vt6m/yyMRO8dRtH5H9zxZcki85P9S3zbiTPr005P0mA=;
        b=lRIhEOH2RErIslbAWcvo/z1As6HvsbL8WdU4epP+DBTu41bGevZCvi8n/3/0EWM0o9
         ZMwvolxEVupWQIG6NJT2Cfjre1gOHOb1z35rflO/T534wynuHmBybsAdMpdA8lNa3b5J
         LWLkMC+wzZj3B1KBOmoGKxQ5mou1RI2WeV2DSeYSbsU4dDN5p4mwxpiA7zuWEL92zRcZ
         a0hsJSCaz4apf4ZllF83ESQqrOzYgjaZxfsygWO9EuXzLobAZ8XpXrtRCNLzNgEft8ua
         qoySNzQvjJuy6smIYffjwKbAIeXgWUXESu2QkNpiQwODKVh+b0qnjStK88WIJ6Wbxea2
         U80w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:subject:to:cc:references:from:message-id:date
         :user-agent:mime-version:in-reply-to:content-language
         :content-transfer-encoding;
        bh=Vt6m/yyMRO8dRtH5H9zxZcki85P9S3zbiTPr005P0mA=;
        b=fPQYqJp1YLRS2G0g5rp3B/lwUEmknTk0fyQXeAGAM7Wc8KtGJwUGtGSGCrDkr+toFZ
         o4AJ+J2aNR0ZSftTiNWDNZi5guSSONsBca3UZZ3K6wJhq+3HxDUvGXK+XeJyvn6C+8lX
         q4XRlgfjdMR4RNM4ePYiQCDAV+dYflhUuoRr21g2vkVtMRb1kEu12sqcUKBPFfC7QIXv
         qQepRTVoxVxxgVDQvPqFwxoCiSvM96YuXWudzWpJOpUWWS7KR3qHFKypH2X2xpLVwuTZ
         X0JANxHGONxce8e6OdgB5f3KVaSNd0YVY3stVIE/cT/PnJfCG2xwN1IaJGx4OX06Cm80
         5CvA==
X-Gm-Message-State: AA+aEWb+ULRCPKawConf9Jt0mDdqgnYcd26AtxzW65ejnYfNPX+Md0rA
        hkmDCSO9/OZc3ruB4JjG+8w=
X-Google-Smtp-Source: AFSGD/UQU5iBufD+UmwZxjX2xpu1xlGlLZ9DZVdZrdpj7V0B2ES5nnUHqXC6Ask2vM1YpMijRDsqJg==
X-Received: by 2002:adf:ec83:: with SMTP id z3mr5543065wrn.264.1544899771839;
        Sat, 15 Dec 2018 10:49:31 -0800 (PST)
Received: from [192.168.1.4] (ip-86-49-110-70.net.upcbroadband.cz. [86.49.110.70])
        by smtp.gmail.com with ESMTPSA id k135sm11797218wmd.42.2018.12.15.10.49.30
        (version=TLS1_2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 15 Dec 2018 10:49:31 -0800 (PST)
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
From:   Marek Vasut <marek.vasut@gmail.com>
Message-ID: <270eeb39-140f-7f55-75d3-c2a6d9ab4034@gmail.com>
Date:   Sat, 15 Dec 2018 19:49:30 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:52.0) Gecko/20100101
 Thunderbird/52.8.0
MIME-Version: 1.0
In-Reply-To: <CAMuHMdWEuiPnZfeNA+T_Gp6W7EAGimrb9Z=rU590OnPz2-MLow@mail.gmail.com>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Sender: linux-renesas-soc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-renesas-soc.vger.kernel.org>
X-Mailing-List: linux-renesas-soc@vger.kernel.org

On 12/15/2018 07:47 PM, Geert Uytterhoeven wrote:
> Hi Marek,
> 
> On Sat, Dec 15, 2018 at 7:38 PM Marek Vasut <marek.vasut@gmail.com> wrote:
>> On 12/15/2018 06:23 PM, Eduardo Valentin wrote:
>>> On Wed, Dec 12, 2018 at 02:49:22AM +0100, Marek Vasut wrote:
>>>> Introduce new thermal_zone_of_sensor_register_params() function, which
>>>> allows passing struct thermal_zone_params into it and convert original
>>>> thermal_zone_of_sensor_register() to call it with params set to NULL.
>>>>
>>>> Signed-off-by: Marek Vasut <marek.vasut+renesas@gmail.com>
>>>
>>> Git complains about mismatch between From: and this SOB.
>>
>> I recall a discussion about gmail stripping the +foo tags from email
>> addresses. I can add a From: tag into the patch to override this
>> braindeath, or is there a better solution ?
> 
> Run the "git format-patch" command from a git repo where user.email
> is marek.vasut@gmail.com, so it will retain the original From: tag in the
> email body, as it is different?

I can also manually patch the From tags or add them, but it's all
workarounds.

-- 
Best regards,
Marek Vasut
